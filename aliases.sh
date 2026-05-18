# --- WODIBASH START ---

# =================================================================
# WODIBASH - BULLETPROOF TERMINAL ALIASES
# THAT COMPRESSES EVERYDAY WORKFLOWS FOR FASTER, SAFER SYSTEM EXECUTION

#  _    _         _ _ ____            _
# | |  | |       | (_)  _ \          | |
# | |  | |  ___  | | | |_) )  __ _  _| |__
# | |/\| | / _ \ | | |  _ <  / _` |/ __| '_ \
# \  /\  /| (_) || | | |_) || (_| |\__ \ | | |
#  \/  \/  \___/ |_|_|____/  \__,_||___/_| |_|

# =================================================================

# ---- 1. NAVIGATION & SYSTEM ----
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls'
alias la='ls -a'
alias lsl='ls -la'
alias cl='clear'
alias cls='clear && ls'
alias hy='history'
alias r='rm -rIv '         # Recursive, informative verbose
alias rm='rm -f -i '         # Interactive delete
v() { "$@" --version; }
h() { "$@" --help; }

alias n='nano '
alias nb='nano ~/.bashrc'
alias sb='source ~/.bashrc'
alias cnb='code ~/.bashrc'

alias nz='nano ~/.zshrc'
alias sz='source ~/.zshrc'
alias cnz='code ~/.zshrc'

# Smart Clipboard (Detects OS)
# copy current path to clipboard
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    alias cpw='pwd | clip'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias cpw='pwd | pbcopy'
elif [[ -n "$PREFIX" && "$PREFIX" == *termux* ]]; then
    alias cpw='pwd | termux-clipboard-set'
else
    alias cpw='pwd | xclip -selection clipboard'
fi

# --- 2. GIT WORKFLOW --
alias ga='git add '
alias gc='git commit -m'
alias gca='git commit --amend'
alias gci='git commit -m "Initial commit"'
alias gs='git status'
alias gd='git diff'
alias gds='gd --staged'
alias gdiff='git diff --stat'
alias gl='git log'
alias glo='git log --oneline --graph --decorate'
alias gb='git branch'
alias gp='git push'

gpo() {
    if [ "$1" = "." ]; then
        git push origin "$(git symbolic-ref --short HEAD)"
    else
        git push origin "$1"
    fi
}

alias gpf='git push --force-with-lease'

gpof() {
    git push origin "$(git symbolic-ref --short HEAD)" --force-with-lease
}

alias gpl='git pull'

gcl() {
    if [[ "$1" == */* && "$1" != *://* && "$1" != git@* ]]; then
        git clone "git@github.com:$1.git"
    else
        git clone "$1"
    fi
}

alias gf='git fetch'
alias gco='git checkout'
alias gch='git checkout -b '
alias gsh='git switch -c '
alias gsw='git switch'
alias gt='git tag v'
alias gpt='git push origin v'
alias gtd='git tag -d v '
alias gtdp='git push origin :refs/tags/v '
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'
alias grb='git rebase'
alias gri='git rebase -i'
alias grh='git rebase -i HEAD~'
alias gcaid='git rebase --committer-date-is-author-date HEAD~'
alias gcane='git commit --amend --no-edit'
alias grc='git rebase --continue'
alias grs='git repo structure' # reachable objects and repository structure
alias gres='git restore'
alias grest='git restore --staged '    # unstage file without losing changes
alias gundo='git reset --soft HEAD~1' # undo last commit, keep changes staged
alias gresh='git reset --hard origin/main'
alias gresom='git reset origin/main'
alias gmain='git checkout main || git checkout master || git switch main || git switch master'
alias gclean='git clean -fd'
alias gping='ping github.com'
alias g='git'
alias gi='git init'
alias ginit='git init && git add . && git commit -m "Initial commit"'
alias readme='touch README.md && code README.md'
alias license='touch LICENSE && code LICENSE'

# --- GITHUB CLI ---
# Install GitHub CLI: https://cli.github.com/
alias ghpr='gh pr create'
alias ghprl='gh pr list'
alias ghprv='gh pr view --web'
alias ghrn='gh release create'
alias ghrl='gh release list'
alias ghre='gh repo view --web'

# --- 3. PYTHON MASTER BLOCK ---
alias p='python'
alias p312='/c/Users/Lenovo/AppData/Local/Programs/Python/Python312/python.exe'
alias p314='/c/Users/Lenovo/AppData/Local/Programs/Python/Python314/python.exe'
alias mkv='python -m venv .venv'
alias venv='source .venv/Scripts/activate || source .venv/bin/activate || source venv/Scripts/activate || source venv/bin/activate'
alias vno='deactivate'
alias newpy='mkv && venv && pip install --upgrade pip'
alias pi='pip install '
alias pie='pip install -e .'
alias pyrm='pip uninstall -y'
alias pir='pip install -r requirements.txt'
alias pfr='pip freeze > requirements.txt'
alias pu='pip list --outdated'
alias pyb='rm -rf dist/ build/ *.egg-info && python -m build'
alias pyl='python -m twine register'
alias ppub='python -m twine upload dist/*'

pclean() {
    read -rp "Clean all Python caches and build artifacts in $(pwd)? [y/N] " confirm
    if [[ "$confirm" == [yY] ]]; then
        find . -type d -name "__pycache__" -exec rm -rf {} +
        find . -type f -name "*.pyc" -delete
        rm -rf .pytest_cache .coverage .mypy_cache .ipynb_checkpoints build/ dist/ *.egg-info .eggs/
        echo "Python environment cleaned!"
    fi
}

alias pyformat='python -m isort . && python -m black .'
alias pylint='python -m pyflakes .'
alias pyt='pytest'
alias pytv='pytest -v'
alias pytx='pytest -x'
alias pyc='python -c'

# --- 4. NPM, PNPM & WEB DEV ---
alias ni='npm install'
alias nl='npm login'
alias nlo='npm logout'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'
alias ncheck='npm publish --dry-run'
alias npub='npm publish'
alias npack='npm pack'
alias npdr='npm pack --dry-run'
alias nup='npm update'

nclean() {
    read -rp "Delete all node_modules/dist/build/next/out/turbo in $(pwd)? [y/N] " confirm
    if [[ "$confirm" == [yY] ]]; then
        find . -name "node_modules" -type d -prune -exec rm -rf "{}" + && \
        find . -name "dist" -type d -prune -exec rm -rf "{}" + && \
        find . -name "build" -type d -prune -exec rm -rf "{}" + && \
        find . -name ".next" -type d -prune -exec rm -rf "{}" + && \
        find . -name "out" -type d -prune -exec rm -rf "{}" + && \
        find . -name "*.tgz" -type d -prune -exec rm -f "{}" + && \
        find . -name ".turbo" -type d -prune -exec rm -rf "{}" +
        echo "Node environment cleaned!"
    fi
}

# Web developement
alias cna='npx create-next-app'
alias cra='npx create-react-app'

alias fuman='npx create-fumadocs-app'
alias fumap='pnpm create fumadocs-app'
alias fumay='yarn create fumadocs-app'
alias fumab='bun create fumadocs-app'

# pnpm
alias pni='pnpm install'
alias pnr='pnpm run'
alias pna='pnpm add'
alias pnx='pnpm dlx'

# --- 5. RUST/CARGO ---
alias cb='cargo build'
alias cr='cargo run'
alias ct='cargo test'
alias ctv='cargo test -- --nocapture'
alias cc='cargo check'
alias ccl='cargo clippy'
alias crel='cargo build --release'
alias cfmt='cargo fmt'
alias cdoc='cargo doc --open'
alias cnew='cargo new'
alias cadd='cargo add'

# --- 6. SHELL / PROCESSES / NETWORKING ---
alias c='code'
alias c.='code .'

alias open='termux-open' # Install with pkg install termux-api. See repo: github.com/termux/termux-api .I ran into this while trying to build a VS Code style CLI for Andriod editors (Pydriod, Acode, Spck editors etc) that opens files directly from the terminal using Andriod intents instead of manual repititive "Open with" selection.
alias df='df -h'
alias du='du -sh *'                   # human-readable sizes in current dir
alias tpath='echo $PATH | tr ":" "\n"' # readable PATH

alias force='--force'

alias ports='ss -tulnp'              # what's listening (Linux) / lsof -i on mac
alias whatsport='lsof -i'           # or ss -tulnp already there, but this is cross-platform
alias psg='ps aux | grep'

killport() {
    if [ -z "$1" ]; then
        echo "Usage: killport <port>"
        return 1
    fi

    local port="$1"

    # Windows Git Bash / MSYS / Cygwin
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        pid=$(netstat -ano | grep ":$port" | awk '{print $NF}' | tail -1)

        if [ -n "$pid" ]; then
            taskkill //PID "$pid" //F
            echo "Killed process on port $port (PID: $pid)"
        else
            echo "No process found on port $port"
        fi

    # Termux
    elif [[ -n "$PREFIX" && "$PREFIX" == *termux* ]]; then
        pkill -f ":$port" 2>/dev/null && \
        echo "Killed process on port $port" || \
        echo "No process found"

    # Linux/macOS
    else
        pid=$(lsof -ti:"$port" 2>/dev/null)

        if [ -n "$pid" ]; then
            kill -9 "$pid"
            echo "Killed process on port $port (PID: $pid)"
        else
            echo "No process found on port $port"
        fi
    fi
}

alias myip='curl -s ifconfig.me'
alias reload='exec $SHELL -l'        # full shell reload, cleaner than source

alias mk='mkdir'
mkcd() { mkdir -p "$1" && cd "$1"; }  # mkdir + cd in one
bak()  { cp "$1" "$1.bak"; }  # quick backup any file
empty() { > "$1"; }

# alias >='>' # That truncates a file to zero bytes while keeping it in place
alias empty='f(){ > "$1"; }; f'

## --- 7. AI ----

# Local LLM
alias o='ollama'
alias ol='ollama list'
alias olr='ollama run ' # for example or llama3 or glm-5:cloud
alias olserve='ollama serve'
alias olrm='ollama rm'
alias olpull='ollama pull'

# Aider
export OLLAMA_API_BASE="http://localhost:11434" # tell Aider where Ollama lives
alias ai='aider' # pip install aider-chat
alias aio='aider --model ollama/llama3' # run Aider with Llmma3 via Ollama
alias aig='aider --model ollama/glm-5:cloud'
alias aid='aider --model ollama/deepseek-coder-v2'

# Coding Agents
alias cod='codex' # npm i -g @openai/codex
alias cur='cursor-agent' # curl https://cursor.com/install -fsS | bash
alias gem='gemini' # npm i -g @google/gemini-cli
alias cla='claude' # npm i -g @anthropic-ai/claude-code (claude code cli)
alias omo='oh-my-codex' # npm install -g @openai/codex oh-my-codex

# --- 8. SEARCHING TOOLS ---
alias rg='rg --color=auto'
alias fd='fd --color=auto'
alias grep='grep --color=auto'
alias rgpy='rg --type py'
alias rgts='rg --type ts'
alias todo='grep -rnw . -e "TODO" -e "FIXME" -e "todo" -e "fixme" --exclude-dir={node_modules,.git,dist}'

alias wl='wodilist' # pip install wodilist
alias etr='explainthisrepo' # pip install explainthisrepo
alias fmtree='filemaptree' # pip install filemaptree

# --- 9. LOOPING MUSIC ---
function loopmusic() {
    if [ -z "$1" ]; then
        echo "Usage: loopmusic <file>"
        return 1
    fi

    if [ ! -f "$1" ]; then
        echo "File not found: $1"
        return 1
    fi

    while true; do
        play "$1"
    done
}

# --- 10. CLOUD / DEPLOYMENT ---

# Install:
# npm i -g vercel
# npm i -g netlify-cli
# npm i -g firebase-tools
# npm i -g wrangler
# npm i -g @railway/cli
# brew install supabase/tap/supabase
# winget install Docker.DockerDesktop
# Install GitHub CLI: https://cli.github.com/

# Vercel
alias vc='vercel'
alias vcl='vercel login'
alias vcd='vercel dev'
alias vcp='vercel --prod'
alias vclog='vercel logs'
alias vcrm='vercel remove'

# Netlify
alias nt='netlify'
alias ntd='netlify dev'
alias ntp='netlify deploy'
alias ntpp='netlify deploy --prod'
alias ntl='netlify login'

# Firebase
alias fb='firebase'
alias fbl='firebase login'
alias fbi='firebase init'
alias fbd='firebase deploy'
alias fbh='firebase hosting:channel:deploy'

# Supabase
alias sup='supabase'
alias sups='supabase start'
alias supst='supabase status'
alias supdb='supabase db push'
alias supd='supabase deploy'

# Docker
alias dk='docker'
alias dkb='docker build .'
alias dkr='docker run'
alias dkc='docker compose'
alias dkcu='docker compose up'
alias dkcd='docker compose down'
alias dkl='docker logs'

# GitHub Actions
alias gha='gh workflow list'
alias ghar='gh run list'
alias ghaw='gh run watch'
alias gharun='gh workflow run'

# Fly.io
alias flyd='fly deploy'

# Railway
alias rw='railway'
alias rwd='railway up'

# Render
alias rd='render'

# Cloudflare
alias cf='wrangler'
alias cfd='wrangler deploy'
alias cfl='wrangler login'

# --- 11. SERVERS / VPS / SSH ---

# SSH
alias sshk='ssh-keygen -t ed25519'
alias sshl='cat ~/.ssh/id_ed25519.pub'
alias ssha='ssh-add ~/.ssh/id_ed25519'
alias sshc='ssh-copy-id'

# Linux server utilities
alias srv='ssh ' # for example: srv root@myserver
alias srvls='systemctl list-units --type=service'
alias srvstart='sudo systemctl start'
alias srvstop='sudo systemctl stop'
alias srvrestart='sudo systemctl restart'
alias srvstatus='sudo systemctl status'

# Logs
alias logs='journalctl -xe'
alias logsf='journalctl -f'
alias nginxlog='tail -f /var/log/nginx/access.log'
alias errlog='tail -f /var/log/nginx/error.log'

# Process managers
alias pm='pm2'
alias pml='pm2 list'
alias pms='pm2 start'
alias pmr='pm2 restart'
alias pmd='pm2 delete'
alias pmlog='pm2 logs'

# Docker server workflows
alias dkps='docker ps'
alias dkimg='docker images'
alias dkprune='docker system prune'
alias dkre='docker restart'

# Remote sync
alias scpup='scp'
alias rs='rsync -avz'

# Quick Python server
alias pyserve='python -m http.server'

# Node local server
alias nserve='npx serve'

# Static file server
servehere() {
    local port=${1:-8000}
    python -m http.server "$port"
}

# --- 12. GIT AUTOCOMPLETE ---
_git_completion_loaded=false

# Try all known paths (Linux distros, macOS Homebrew, Termux)
for _git_comp_path in \
    /usr/share/bash-completion/completions/git \
    /usr/local/share/bash-completion/completions/git \
    /opt/homebrew/etc/bash_completion.d/git \
    "${PREFIX}/share/bash-completion/completions/git"; do
    if [ -f "$_git_comp_path" ]; then
        . "$_git_comp_path"
        _git_completion_loaded=true
        break
    fi
done

# Only wire up aliases if __git_complete was actually defined
if $_git_completion_loaded && command -v __git_complete &>/dev/null; then
    __git_complete ga  _git_add
    __git_complete gc  _git_commit
    __git_complete gco _git_checkout
    __git_complete gch _git_checkout
    __git_complete gp  _git_push
    __git_complete gpo _git_push
    __git_complete gpl _git_pull
    __git_complete gs  _git_status
    __git_complete gd  _git_diff
    __git_complete gl  _git_log
    __git_complete gf  _git_fetch
    __git_complete gsh _git_switch
    __git_complete grc _git_rebase
    __git_complete gcane _git_commit
fi

unset _git_comp_path _git_completion_loaded

# --- 13. DASHBOARD ---
alias helpme='echo "--- GIT ALIASES ---" && alias | grep -E "^alias g" | sed "s/alias //g" | column -t -s "=" && echo "" && echo "--- NAV, PKG & SYSTEM ---" && alias | grep -vE "(^alias g|helpme)" | sed "s/alias //g" | column -t -s "="'

# --- 14. SELF UPDATE ---
wodibashupdate() {
    # Pull latest or clone fresh
    if [ -d ~/wodibash ]; then
        git -C ~/wodibash pull
        # Alternative: git -C ~/wodibash fetch && git -C ~/wodibash reset --hard origin/main
    else
        git clone https://github.com/calchiwo/wodibash.git ~/wodibash
    fi

    local bashrc=~/.bashrc
    local src=~/wodibash/aliases.sh
    local start="# --- WODIBASH START ---"
    local end="# --- WODIBASH END ---"

    # Backup before touching anything
    cp "$bashrc" "$bashrc.bak"

    if ! grep -q "$start" "$bashrc"; then
        # First time: markers not found, append the whole block
        echo "" >> "$bashrc"
        cat "$src" >> "$bashrc"
    else
        # Markers exist: replace everything between them (inclusive) with fresh aliases.sh
        # aliases.sh already contains both START and END markers
        # So: hit START in .bashrc → dump aliases.sh → skip all old lines until END → continue
        local tmp
        tmp=$(mktemp)
        awk -v start="$start" -v end="$end" -v src="$src" '
            $0 == start {
                in_block=1
                while ((getline line < src) > 0) print line
                next
            }
            in_block && $0 == end {
                in_block=0
                next
            }
            in_block { next }
            { print }
        ' "$bashrc" > "$tmp" && mv "$tmp" "$bashrc"
    fi

    source "$bashrc"
    echo "wodibash updated!"
}

# --- WODIBASH END ---