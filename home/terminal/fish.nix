{
  programs.fish = {
    enable = true;
    shellAliases = {
      v = "nvim";
      nb = "sudo nixos-rebuild switch --flake .#jee";
      lsbig = "du -ah ./ | sort -rh | head -n 20";

      ga = "git add $1";
      gc = "git commit -m $1";
      gac = "git add . && git commit -m $1";
      gs = "git status --short";
      gl = "git log --oneline --graph --decorate";
      gck = "git checkout $1";
      grs = "git remote set-url origin $1";
      gps = "git push origin $2";
      gpl = "git pull origin $1";

      nrd = "npm run dev";
      nrs = "npm run start";
      nrb = "npm run build";
      nrf = "npm run format";
      prd = "pnpm run dev";
      prs = "pnpm run start";
      prb = "pnpm run build";
      prf = "pnpm run format";

      zrb = "zig run build";
      zr = "zig run";
      zb = "zig build";
    };
    interactiveShellInit = ''
      set -U fish_greeting
    '';
    functions.rm = {
      body = ''
        if status is-command-substitution
          command rm $argv
          return
        end

        set need_confirm 0
        set has_target 0
        for arg in $argv
          if string match -qr -- '^-' $arg
            if string match -qr -- '[rR]' $arg; and string match -qr -- 'f' $arg
              set need_confirm 1
            end
          else
            set has_target 1
            if test "$arg" = "/" -o "$arg" = "~" -o "$arg" = "$HOME"
              echo "Refusing to rm -rf critical path: $arg"
              return 1
            end
          end
        end

        if test $need_confirm -eq 1 -a $has_target -eq 1
          read -P "Really rm -rf $argv? [y/N] " -n confirm
          if test "$confirm" != "y"
            echo "Aborted."
            return 1
          end
        end

        command rm $argv
      '';
    };
  };
}
