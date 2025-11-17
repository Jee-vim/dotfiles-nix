{
  programs.ghostty = {
    theme = "GruvboxDarkHard";
    font-size = 10;
    shell-integration = "fish";
    keybind = [
      "ctrl+h=goto_split:left"
      "ctrl+l=goto_split:right"
    ];
  };
}
