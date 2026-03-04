# ---- NAVIGATION & SYSTEM ----
alias ..='cd ..'
alias ...='cd ../..'
alias l='ls'
alias cl='clear'
alias cls='clear && ls'
alias h='history'
alias f='history | grep' # Use: f git
alias r='rm -rIv ' # Recursive, informative verbose
alias rmi='rm -i ' # Interactive delete
alias cpw='pwd | clip' # Copy current path to Windows clipboard
alias cpwl='pwd | xclip-selection clipboard' # Copy current path to Linux (Ubuntu/Debian) clipboard
alias cpwl='pwd | wl-copy' # Copy current path to Linux (Fedora/Arch) clipboard
alias nb='nano ~/.bashrc'
alias sb='source ~/.bashrc'
alias cnb='code ~/.bashrc' # Open config in VSCode
alias v='--version'
alias v='--v'

# --- Git Workflow --
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
alias f='--force'

# --- Python Master Block ---
alias p='python'
alias mkv='python -m venv .venv'
alias venv='source .venv/Scripts/activate || source venv/Scripts/activate'
alias vno='deactivate'

alias pi='pip install'
alias pie='pip install -e .'
alias pir='pip install -r requirements.txt'
alias pfr='pip freeze > requirements.txt'
alias pu='pip list --outdated' # See what needs update

alias pyb='rm -rf dist/ build/ *.egg-info && python -m build'
alias pyl='python -m twine register'
alias ppub='python -m twine upload dist/*'
alias pclean='find . -type d -name "__pycache__" -exec rm -rf {} +; find . -type f -name "*.pyc" -delete; rm -rf .pytest_cache .coverage .mypy_cache .ipynb_checkpoints'

alias pyformat='python -m isort . && python -m black .'
alias pylint='python -m pyflakes .'
alias pyt='pytest'
alias pytv='pytest -v' # Verbose tests
alias pytx='pytest -x' # Stop at the first failure
alias pyc='python -c' # Run a quick string of code

# --- NPM & WEB DEV ---
alias ni='npm install'
alias nl='npm login'
alias ncheck='npm publish --dry-run'
alias npub='npm publish'
alias nclean='rm -rf dist/ build/ .next/ out/ .turbo/' # Basic build clean
alias nuke='find . -name "node_modules" -type d -prune -exec rm -rf "{}" + && find . -name "dist" -type d -prune -exec rm -rf "{}" + && find . -name "build" -type d -prune -exec rm -rf "{}" +'
alias cna='npx create-next-app'
alias cra='npx create-react-app'


# --- VS Code ---
alias c='code'
alias c.='code .'

# --- Ollama model ---
alias o='ollama'
alias ol='ollama list'
alias or='ollama run'
alias oserve='ollama serve'
alias orm='ollama rm'
alias opull='ollama pull' # Update a model to the latest version

# --- Tools ---
alias todo='grep -rnw . -e "TODO" -e "FIXME" --exclude-dir={node_modules,.git,dist}' # find things that shouldn't be shipped
alias wl='wodilist'
alias expl='explainthisrepo'
alias fmtree='filemaptree'

# Git Autocomplete Setup
# This part finds the git script on your system
if [ -f /usr/share/bash-completion/completions/git ]; then
    . /usr/share/bash-completion/completions/git
fi

# Link your aliases to the correct git functions
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


alias helpme='echo "--- GIT ALIASES ---" && alias | grep -E "g[a-z]+" | column -t -s "=" && echo "" && echo "--- NAV, PKG & SYSTEM ---" && alias | grep -vE "(g[a-z]+|helpme)" | column -t -s "="'
