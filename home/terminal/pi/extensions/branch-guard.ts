import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { exec, spawn } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);

// Helper to run interactive terminal commands (like git reset -p)
function runInteractive(command: string, args: string[]): Promise<void> {
  return new Promise((resolve) => {
    const proc = spawn(command, args, { stdio: "inherit" });
    proc.on("close", () => resolve());
  });
}

export default function (pi: ExtensionAPI) {
  let originalBranch = "";
  let tempBranch = "";

  pi.on("session_start", async () => {
    try {
      await execAsync("git rev-parse --is-inside-work-tree");
      
      const { stdout: branchStdout } = await execAsync("git branch --show-current");
      originalBranch = branchStdout.trim();
      
      tempBranch = `temp-${Date.now()}`;
      
      await execAsync(`git checkout -b ${tempBranch}`);
      console.log(`[INFO] Created and switched to isolated branch: ${tempBranch}`);
    } catch (error: any) {
      console.log(`[WARN] Git initialization skipped: ${error.message}`);
      originalBranch = "";
      tempBranch = "";
    }
  });

  pi.on("agent_end", async (_event, ctx) => {
    if (!originalBranch || !tempBranch) {
      return;
    }

    try {
      const { stdout: statusStdout } = await execAsync("git status --porcelain");
      if (!statusStdout.trim()) {
        console.log("[INFO] No changes detected. Cleaning up temporary branch.");
        await execAsync(`git checkout ${originalBranch}`);
        await execAsync(`git branch -d ${tempBranch}`);
        return;
      }

      const keepChanges = await ctx.ui.confirm(
        "Merge Changes",
        "Do you want to merge the agent's modifications into your current branch?"
      );

      if (keepChanges) {
        // Commit and merge everything
        await execAsync("git add -A");
        await execAsync(`git commit -m "agent: automated session changes"`);
        await execAsync(`git checkout ${originalBranch}`);
        await execAsync(`git merge ${tempBranch} --no-edit`);
        await execAsync(`git branch -d ${tempBranch}`);
        console.log(`[INFO] Merged all changes into ${originalBranch}`);
      } else {
        const partialKeep = await ctx.ui.confirm(
          "Partial Save",
          "Would you like to interactively select which changes to keep?"
        );

        if (partialKeep) {
          // Switch back to original branch and interactively checkout files/patches from the temp branch
          await execAsync("git add -A");
          await execAsync(`git commit -m "agent: temporary save"`);
          await execAsync(`git checkout ${originalBranch}`);
          
          console.log("[INFO] Starting interactive patch selection. Choose [y]es to keep, [n]o to discard.");
          await runInteractive("git", ["checkout", "-p", tempBranch]);
          
          await execAsync(`git branch -D ${tempBranch}`);
          console.log(`[INFO] Kept selected modifications. Discarded the rest.`);
        } else {
          // Hard discard everything
          await execAsync(`git checkout ${originalBranch}`);
          await execAsync(`git branch -D ${tempBranch}`);
          console.log(`[INFO] Discarded agent changes and restored ${originalBranch}`);
        }
      }
    } catch (error: any) {
      console.log(`[ERROR] Git cleanup failed: ${error.message}`);
    } finally {
      originalBranch = "";
      tempBranch = "";
    }
  });
}
