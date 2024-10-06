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
    # List available formats for the video
    yt-dlp -F $argv[1]
    
    # Prompt the user to input the format they want
    echo "Please enter the format code for the video you want to download:"
    read -l video_format
    
    # Check if the selected format is "video only"
    set -l is_video_only (yt-dlp -F $argv[1] | grep -q "^$video_format.*video only")
    
    if test $status -eq 0
        # If the format is "video only", select the best audio format
        set -l audio_format (yt-dlp -F $argv[1] | grep "audio only" | head -n 1 | awk '{print $1}')
        echo "Selected video format is video-only. Matching with audio format $audio_format."
        
        # Download and merge video + audio
        yt-dlp --restrict-filenames \
               --output '%(playlist_index)s-%(title)s.%(ext)s' \
               --format "$video_format+$audio_format" \
               --merge-output-format mp4 \
               --embed-subs \
               --all-subs \
               --sub-langs all,-live_chat \
               --compat-options no-live-chat \
               --convert-subs srt \
               --embed-thumbnail \
               --convert-thumbnails jpg \
               --add-metadata \
               --xattrs \
               --audio-quality 0 \
               --sponsorblock-remove all \
               --force-overwrites \
               --no-check-certificate \
               $argv[1]
    else
        # Download the selected format (video+audio if available)
        echo "Selected format includes both video and audio."
        yt-dlp --restrict-filenames \
               --output '%(playlist_index)s-%(title)s.%(ext)s' \
               --format "$video_format" \
               --merge-output-format mp4 \
               --embed-subs \
               --all-subs \
               --sub-langs all,-live_chat \
               --compat-options no-live-chat \
               --convert-subs srt \
               --embed-thumbnail \
               --convert-thumbnails jpg \
               --add-metadata \
               --xattrs \
               --audio-quality 0 \
               --sponsorblock-remove all \
               --force-overwrites \
               --no-check-certificate \
               $argv[1]
    end
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

