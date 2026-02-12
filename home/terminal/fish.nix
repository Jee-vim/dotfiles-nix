{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      alias vi nvim
      alias ga "git add $1"
      alias gc "git commit -m $1"
      alias gs "git status --short"
      alias gck "git checkout $1"
      alias grs "git remote set-url origin $1"
      alias gpush "git push origin $2"
      alias gpull "git pull origin $1"
      alias nrd "npm run dev"
      alias nrs "npm run start"
      alias nrb "npm run build"
      alias nrf "npm run format"
      alias prd "pnpm run dev"
      alias prs "pnpm run start"
      alias prb "pnpm run build"
      alias prf "pnpm run format"
      alias zrb "zig run build"
      alias zr "zig run"
      alias zb "zig build"

      set -gx PATH ~/.npm-global/bin $PATH
      set -x EDITOR nvim
      set -U fish_greeting
      set -gx PATH $HOME/.foundry/bin $PATH

      if status is-interactive; and not set -q TMUX
        exec tmux
      end
    '';

    functions.rm = {
      description = "Require sudo authentication before rm -rf";
      body = ''
        set need_sudo 0
           for arg in $argv
             if string match -qr -- "-.*[rf].*" $arg
               set need_sudo 1
               break
             end
           end

           if test $need_sudo -eq 1
             echo "Authentication required for rm -rf"
             sudo -v || return 1
           end

           for target in $argv
             if test "$target" = "/" -o "$target" = "~" -o "$target" = "$HOME"
               echo "Refusing to rm -rf critical path: $target"
               return 1
             end
           end

           command rm $argv
      '';
    };
  };
}
