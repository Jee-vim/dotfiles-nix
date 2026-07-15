import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { exec } from "child_process";
import { promisify } from "util";

const execAsync = promisify(exec);

export default function (pi: ExtensionAPI) {
  pi.on("tool_result", async (event, ctx) => {
    const toolName = event.toolName;
    const input = event.input as Record<string, any>;
    let targetFile: string | null = null;

    if ((toolName === "write" || toolName === "edit" || toolName === "patch_file") && input?.path) {
      targetFile = input.path;
    } else if (toolName === "bash" && typeof input?.command === "string") {
      const match = input.command.match(/(?:nano|vim|echo|tee|>)\s+([^\s;&|]+)/);
      if (match) {
        targetFile = match[1];
      }
    }

    if (!targetFile) {
      return;
    }

    const filePath = targetFile;
    console.log(`[INFO] Running LSP check on modified file: ${filePath}`);

    try {
      await execAsync(`npx tsc --noEmit ${filePath}`);
      console.log(`[DEBUG] LSP diagnostics passed for ${filePath}`);
    } catch (error: any) {
      const lspErrorMsg = error.stdout || error.stderr || error.message;
      console.log(`[WARN] LSP found errors in ${filePath}`);

      const originalText = event.result?.content?.[0]?.text || "";
      return {
        content: [
          {
            type: "text",
            text: `${originalText}\n\n[LSP Diagnostics - Fix these errors]:\n${lspErrorMsg}`
          }
        ],
        isError: true
      };
    }
  });
}
