set -g fish_greeting

if status is-interactive
    starship init fish | source
end

function copy
    if test -f $argv[1]
        cat $argv[1] | wl-copy
    else
        echo "File $argv[1] does not exist."
    end
end

function change_dns
    if test -f ~/.scripts/change_dns.sh
        bash ~/.scripts/change_dns.sh
    else
        echo "File ~/.scripts/change_dns.sh does not exist."
    end
end

function space
    ~/.scripts/space.sh $argv
end

function yt
    yt-dlp --restrict-filenames \
           --output '%(playlist_index)s-%(title)s.%(ext)s' \
           --ignore-errors \
           --embed-subs \
           --all-subs \
           --sub-langs all,-live_chat \
           --compat-options no-live-chat \
           --convert-subs srt \
           --format "(bestvideo[height<=1080]+bestaudio/best[height<=1080])/best" \
           --merge-output-format mp4 \
           --convert-thumbnails jpg \
           --embed-thumbnail \
           --audio-quality 0 \
           --add-metadata \
           --xattrs \
           --xattr-set-filesize \
           --prefer-free-formats \
           --geo-bypass \
           --no-mark-watched \
           --console-title \
           --no-warnings \
           --sponsorblock-remove all \
           --compat-options embed-thumbnail-atomicparsley \
           --force-overwrites \
           --no-check-certificate \
           $argv
end


function musicdw
    yt-dlp --restrict-filenames \
           --output '%(title)s.%(ext)s' \
           --ignore-errors \
           --extract-audio \
           --audio-format mp3 \
           --audio-quality 0 \
           --embed-thumbnail \
           --convert-thumbnails jpg \
           --add-metadata \
           --xattrs \
           --geo-bypass \
           --no-warnings \
           --sponsorblock-remove all \
           --console-title $argv
end

# List Directory
alias pearai='PearAI'
alias fishconf='nvim ~/.config/fish/config.fish'
alias keys='nvim ~/.config/hypr/keybindings.conf'
alias vim='nvim'
alias killer='~/.scripts/killer.sh'
alias cb='cargo build'
alias cr='cargo run'
alias mp3='yt-dlp -x --embed-thumbnail --audio-format mp3'
alias dsa='cd ~/git/dsa/src/'
alias diary='diary --dir=.diary/ --editor=nvim'
alias pipes='pipes.sh'
alias ls='lsd'
alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias shutdown='systemctl poweroff'
alias matrix='cmatrix'
alias wifi='nmtui'
alias rw='~/dotfiles/.config/waybar/toggle.sh'
alias dot="cd ~/dotfiles"

#GIT
alias gs="git status"
alias ga="git add"
alias gc="git clone"
alias gp="git push"
alias gpl="git pull"
alias gst="git stash"
alias gsp="git stash; git pull"
alias gcheck="git checkout"

# Handy change dir shortcuts
abbr .. 'cd ..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

#go
set -x GOPATH $HOME/go
set -x GOMODCACHE $GOPATH/pkg/mod

pokemon-colorscripts -r 1 --no-title
set -Ux PATH /home/damon/.local/share/solana/install/active_release/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/damon/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Set up NVM
set -gx NVM_DIR $HOME/.nvm
set -gx PATH $NVM_DIR/bin $PATH

# Source nvm.fish
if test -f ~/.config/fish/functions/nvm.fish
    source ~/.config/fish/functions/nvm.fish
end

