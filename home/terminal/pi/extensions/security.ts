import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

export default function (pi: ExtensionAPI) {
  pi.on("tool_call", async (event, ctx) => {
    const inputString = JSON.stringify(event.input);

    const matchEnv = inputString.includes(".env");
    const matchDestructive = event.toolName === "bash" && inputString.includes("rm -rf");

    if (matchEnv || matchDestructive) {
      const confirmed = await ctx.ui.confirm(
        "Security Trigger",
        `Allow tool [${event.toolName}] to run? Data: ${inputString}`
      );
      if (!confirmed) {
        throw new Error("Execution blocked by user local extension policy.");
      }
    }
  });
}
