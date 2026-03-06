# WodiBash

```
 _    _         _ _ ____            _
| |  | |       | (_)  _ \          | |
| |  | |  ___  | | | |_) )  __ _  _| |__
| |/\| | / _ \ | | |  _ <  / _` |/ __| '_ \
\  /\  /| (_) || | | |_) || (_| |\__ \ | | |
 \/  \/  \___/ |_|_|____/  \__,_||___/_| |_|
```

A Bulletproof Collection for Git, Python, NPM, and AI Workflows

WodiBash is a `.bashrc` terminal configuration, I wrote it for developers who want to move faster in the terminal. It eliminates repetitive typing for common tasks in Git, Python packaging, Web Development, and Local LLMs.

## What the set includes

 *  **Git God Mode**: Shortcuts for the entire workflow: from `ga` (add) to `gch` (branching) and `glo` (visual logs). Includes safety net aliases for tag management (`gt`, `gpt`).

 * **Python Master Block**: Automated Virtual Environments (`mkv`, `venv`), dependency management (`pfr`), and one-click PyPI publishing (`ppub`).

 * **NPM Efficiency**: Clean builds (`nclean`) and a "nuclear option" (`nuke`) to reset `node_modules` across monorepos.

 * **AI Integration**: Quick-fire commands to run locall LLMs without needing paid API keys; Ollama (`ol`, `or `) and Aider (`aio`, `aid`, `ai`, `aig`).
 
 * **Safety First**: Destructive commands like `r` (rm -rf) are aliased to be informative and interactive (`-riv`) to prevent accidental data loss.

## How to use

### For Windows (Git Bash)/Linux

 * Open your terminal and type:

```bash
nano ~/.bashrc
```

 * Copy the sets of the `aliases.sh` file from this repo and paste it at the bottom.
 * Save and refresh:

```bash
source ~/.bashrc
```

However, you can use one of the aliases included in this set!: `sb`

### macOS

 * Open your config:

```bash
nano ~/.zshrc
```

 * Paste the aliases, then save, exit and reload:

```bash
source ~/.zshrc
```

## Cheat sheet

| Command | What it does |
|---|---|
| `helpme` | Print all active aliases grouped by category |
| `gs` / `ga` / `gc` | `git status` / `git add` / `git commit -m` |
| `glo` | Visual git log (oneline + graph + decorate) |
| `gundo` | Undo last commit, keep changes staged |
| `venv` | Activate `.venv` or `venv` (tries all common paths) |
| `pclean` | Remove `__pycache__`, `.pyc`, pytest/mypy/coverage artifacts |
| `nuke` | Recursively delete all `node_modules` and `dist` folders |
| `aio` | Aider with local Ollama Llama3 |
| `cpw` | Copy current path to clipboard |
| `todo` | Grep for TODO / FIXME across the project |
| .....and more in the set |

## 🤝 Contributing

Found a way to make these even more "bulletproof"? Pull requests are welcome!


## Authour
[Caleb Wodi](https://github.com/calchiwo)