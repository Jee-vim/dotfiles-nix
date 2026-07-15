import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";
import { execFile } from "child_process";

export default function (pi: ExtensionAPI) {
  pi.on("agent_end", async () => {
    execFile("notify-send", [
      "--urgency=normal",
      "Pi Agent",
      "Action or decision required."
    ]);
  });
}
