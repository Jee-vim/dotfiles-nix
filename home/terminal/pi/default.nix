{config, ...}: let
  configSourceDir = toString ./.;
in {
  xdg.configFile."../.pi/agent/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/AGENTS.md";

  xdg.configFile."../.pi/agent/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/settings.json";

  xdg.configFile."../.pi/agent/skills".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/skills";

  xdg.configFile."../.pi/agent/agents".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/agents";
}
