{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      fastfetch

      alias vi nvim
      alias ga "git add $1"
      alias gc "git commit -m $1"
      alias gs "git status --short"
      alias gpl "git pull origin $1"
      alias gck "git checkout $1"
      alias grs "git remote set-url origin $1"
      alias gpush "git push origin $2"
      alias gpull "git pull origin $1"
      alias scr "$HOME/Notes/scr.sh"
      alias nrd "npm run dev"
      alias nrs "npm run start"
      alias nrb "npm run build"
      alias prd "pnpm run dev"
      alias prs "pnpm run start"
      alias prb "pnpm run build"

      set -gx PATH ~/.npm-global/bin $PATH
      set -x EDITOR nvim
      set -U fish_greeting

      if status is-interactive; and not set -q TMUX
        exec tmux
      end
    '';
  };
}
