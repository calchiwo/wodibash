# =================================================================
# WODIBASH - MASTER ALIASES
# =================================================================

# ---- 1. NAVIGATION & SYSTEM ----
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls'
alias cl='clear'
alias cls='clear && ls'
alias h='history'
alias fh='history | grep'
alias r='rm -rIv '         # Recursive, informative verbose
alias rmi='rm -i '         # Interactive delete

# Smart Clipboard (Detects OS)
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    alias cpw='pwd | clip'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias cpw='pwd | pbcopy'
else
    alias cpw='pwd | xclip -selection clipboard'
fi

alias nb='nano ~/.bashrc'
alias sb='source ~/.bashrc'
alias cnb='code ~/.bashrc'
alias v='--version'

# --- 2. GIT WORKFLOW --
alias ga='git add '
alias gc='git commit -m'
alias gca='git commit --amend'
alias gci='git commit -m "Initial commit"'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias glo='git log --oneline --graph --decorate'
alias gp='git push'
alias gpo='git push origin '
alias gpf='git push --force'
alias gpl='git pull'
alias gcl='git clone'
alias gf='git fetch'
alias gco='git checkout'
alias gch='git checkout -b '
alias gsh='git switch -c '
alias force='--force'

# --- 3. PYTHON MASTER BLOCK ---
alias p='python'
alias mkv='python -m venv .venv'
alias venv='source .venv/Scripts/activate || source .venv/bin/activate || source venv/Scripts/activate || source venv/bin/activate'
alias vno='deactivate'
alias pi='pip install'
alias pie='pip install -e .'
alias pir='pip install -r requirements.txt'
alias pfr='pip freeze > requirements.txt'
alias pu='pip list --outdated'

alias pyb='rm -rf dist/ build/ *.egg-info && python -m build'
alias pyl='python -m twine register'
alias ppub='python -m twine upload dist/*'
alias pclean='find . -type d -name "__pycache__" -exec rm -rf {} +; find . -type f -name "*.pyc" -delete; rm -rf .pytest_cache .coverage .mypy_cache .ipynb_checkpoints'

alias pyformat='python -m isort . && python -m black .'
alias pylint='python -m pyflakes .'
alias pyt='pytest'
alias pytv='pytest -v'
alias pytx='pytest -x'
alias pyc='python -c'

# --- 4. NPM & WEB DEV ---
alias ni='npm install'
alias nl='npm login'
alias ncheck='npm publish --dry-run'
alias npub='npm publish'
alias nclean='rm -rf dist/ build/ .next/ out/ .turbo/'
alias nuke='find . -name "node_modules" -type d -prune -exec rm -rf "{}" + && find . -name "dist" -type d -prune -exec rm -rf "{}" + && find . -name "build" -type d -prune -exec rm -rf "{}" +'
alias cna='npx create-next-app'
alias cra='npx create-react-app'

# --- 5. VS CODE ---
alias c='code'
alias c.='code .'

## ---6. AI ---- 
alias o='ollama'
alias ol='ollama list'
alias or='ollama run'
alias oserve='ollama serve'
alias orm='ollama rm'
alias opull='ollama pull'

# --- 7. TOOLS ---
alias todo='grep -rnw . -e "TODO" -e "FIXME" --exclude-dir={node_modules,.git,dist}'
alias wl='wodilist'
alias expl='explainthisrepo'
alias fmtree='filemaptree'

# --- 8. GIT AUTOCOMPLETE ---
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

__git_complete ga _git_add
__git_complete gc _git_commit
__git_complete gco _git_checkout
__git_complete gch _git_checkout
__git_complete gp _git_push
__git_complete gpo _git_push
__git_complete gpl _git_pull
__git_complete gs _git_status
__git_complete gd _git_diff
__git_complete gl _git_log
__git_complete gf _git_fetch
__git_complete gsh _git_switch

# --- 9. DASHBOARD ---
alias helpme='echo "--- GIT ALIASES ---" && alias | grep -E "^alias g" | sed "s/alias //g" | column -t -s "=" && echo "" && echo "--- NAV, PKG & SYSTEM ---" && alias | grep -vE "(^alias g|helpme)" | sed "s/alias //g" | column -t -s "="'