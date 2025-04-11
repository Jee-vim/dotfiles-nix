{
  programs.vim = {
    enable = true;
    defaultEditor = true;
    settings = {
      expandtab = true;
      mouse = "a";
      number = true;
      shiftwidth = 2;
      tabstop = 2;
      relativenumber = true;
    };
    extraConfig = ''
      " Enable softtabstop & smartindent
      set softtabstop=2
      set smartindent
    '';
  };
}
