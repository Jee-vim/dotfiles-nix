import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { execFile } from "child_process";

export default function (pi: ExtensionAPI) {
  let envAccessDenied = false;

  // Reset the denial state when a new user interaction session begins
  pi.on("session_start", async () => {
    envAccessDenied = false;
  });

  pi.on("agent_end", async (_event, ctx) => {
    const history = ctx.session?.messages || [];
    const lastMessage = history[history.length - 1];
    
    let title = "Pi Agent";
    let message = "Task completed successfully.";
    let urgency = "normal";

    if (lastMessage && lastMessage.role === "assistant") {
      const text = lastMessage.content || "";
      const isQuestion = text.includes("?") || text.toLowerCase().includes("choose") || text.toLowerCase().includes("select");
      
      if (isQuestion) {
        title = "Pi Choice Required";
        message = "The agent is waiting for your choice or answer.";
        urgency = "critical";
      }
    }

    execFile("notify-send", [
      `--urgency=${urgency}`,
      title,
      message
    ]);
  });

  pi.on("tool_call", async (event, ctx) => {
    const inputString = JSON.stringify(event.input);
    const matchEnv = inputString.includes(".env");
    const matchDestructive = event.toolName === "bash" && inputString.includes("rm -rf");

    if (matchEnv || matchDestructive) {
      // If the user already said no to .env in this workflow, block it instantly without prompting again
      if (matchEnv && envAccessDenied) {
        throw new Error("Execution blocked by user local extension policy (Prior refusal remembered).");
      }

      execFile("notify-send", [
        "--urgency=critical",
        "Security Trigger",
        `Tool [${event.toolName}] requires confirmation.`
      ]);

      const confirmed = await ctx.ui.confirm(
        "Security Trigger",
        `Allow tool [${event.toolName}] to run? ${inputString}`
      );
      
      if (!confirmed) {
        if (matchEnv) {
          envAccessDenied = true;
        }
        throw new Error("Execution blocked by user local extension policy.");
      }
    }
  });
}
