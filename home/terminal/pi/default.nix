{config, ...}: let
  configSourceDir = toString ./.;
in {
  xdg.configFile."../.pi/agent/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/AGENTS.md";

  xdg.configFile."../.pi/agent/skills".source =
    config.lib.file.mkOutOfStoreSymlink "${configSourceDir}/skills";
}
