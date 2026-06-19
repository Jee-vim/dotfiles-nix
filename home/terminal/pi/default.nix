{config, ...}: let
  configSourceDir = toString ./.;
in {
  home.file.".pi/agent/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/AGENTS.md";

  home.file.".pi/agent/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/settings.json";

  home.file.".pi/agent/mcp.json".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/mcp.json";

  home.file.".pi/agent/skills".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/skills";

  home.file.".pi/agent/agents".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/agents";
}
