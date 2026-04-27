```
 _    _         _ _ ____            _
| |  | |       | (_)  _ \          | |
| |  | |  ___  | | | |_) )  __ _  _| |__
| |/\| | / _ \ | | |  _ <  / _` |/ __| '_ \
\  /\  /| (_) || | | |_) || (_| |\__ \ | | |
 \/  \/  \___/ |_|_|____/  \__,_||___/_| |_|
```

Bulletproof aliases that compress everyday terminal workflows for faster, safer system execution

WodiBash turns multi-step workflows into single commands, eliminates repetitive typing, enforces safer defaults for destructive operations, and removes the need to remember long command sequences across:

- Git & GitHub CLI (`gh`)
- Python (`python`, `pip`, `venv`, packaging)
- Node (`npm`, `pnpm`, `npx`)
- Rust (Cargo)
- AI (Ollama, Aider, Coding agents)
- Navigation and system
- Shell, processes and networking
- Search tooling (`grep`, `rg`, `fd`)

This is not a framework or a package, it's a working setup that grew from actual use.

WodiBash is my personal terminal execution layer built and iterated over time. I wrote it for developers who want to move faster in the terminal. It compresses repetitive terminal workflows into single-keystroke actions and removes repetition, reduces failure surface, and standardizes how you work in the terminal.

## Features

- Git Workflow Compression
Turns multi-step Git operations into single commands.
`ga`, `gc`, `gch`, `gpo`, `gs`, `gp` remove repetitive typing across the full lifecycle
`glo` gives immediate visual git log history (oneline + graph + decorate)
`gundo`, `gresh`, `gclean` act as recovery and reset tools when things break

- Python Environment Control
Eliminates setup friction and environment drift.
mkv + venv standardize environment creation and activation
`pfr`, `pir`, `pu` keep dependencies visible and controlled
`pi`, `pyb`, `ppub` reduces PyPI publishing to one command

- NPM & Web Dev: The commands you end up typing every day, cut down to a few keystrokes (`ni`, `nrd`, `nrb`, `nrt`, `pni`, `pnr`, `pna`, `pnx`) with `nclean` to bring projects back to a clean state and removes build artifacts and dependencies when systems start drifting

- AI Integration: Quick commands for running LLM workflows. Ollama (`ol`, `olr`) without needing paid API keys and Aider (`aio`, `aid`, `ai`, `aig`) handle local and agent-based usage, while coding agents (`cod`, `cla`, `gem`, `cur`) for Codex, Claude Code CLI, Gemini CLI, and Cursor.

- Safer Defaults for Dangerous Commands: Destructive commands made safer (`rm` becomes informative, interactive and verbose to prevent accidental loss)
Alongside controlled cleanup commands  (`nclean`, `pclean`, `gclean`) to clean broken environments quickly


## How to use

### For Linux (native Bash)/Windows via Git Bash (MINGW / MSYS)/Termux (Android)/macOS (via Bash)

 - Open your terminal and type:

```bash
nano ~/.bashrc
```

- Copy the contents of `aliases.sh` file from this repo and paste it at the bottom into your shell config

- Save and refresh:

```bash
source ~/.bashrc
```

However, you can use one of the aliases: `sb`

Fastest setup;

```bash
git clone https://github.com/calchiwo/wodibash.git && cat wodibash/aliases.sh >> ~/.bashrc && source ~/.bashrc
wodibashupdate
```

### macOS (via zsh)

 - Open your config:

```zsh
nano ~/.zshrc
```

- Paste the aliases, then save, exit and reload:

```zsh
source ~/.zshrc
```

Fastest setup;

```zsh
git clone https://github.com/calchiwo/wodibash.git && cat wodibash/aliases.sh >> ~/.zshrc && source ~/.zshrc
wodibashupdate
```

## Other Installation

<details>

### For Bash

```bash
curl -s https://raw.githubusercontent.com/calchiwo/wodibash/main/aliases.sh >> ~/.bashrc && source ~/.bashrc
wodibashupdate
```

### For Zsh (macOS)

```zsh
curl -s https://raw.githubusercontent.com/calchiwo/wodibash/main/aliases.sh >> ~/.zshrc && source ~/.zshrc
wodibashupdate
```

</details>

## Discover commands

After installation, you can see all available aliases with:

```bash
helpme
```

This prints all WodiBash commands in a grouped, readable format so you can quickly see what’s available.


## Self Updates

WodiBash includes a built-in self-update and safe reintegration command.

After installation, you can update your setup at any time with:

```bash
wodibashupdate
```

This will pull the latest version and safely update your WodiBash block inside your shell config.

## Philosophy
WodiBash is not about shortcuts.

It is about:
- reducing repeated thinking
- standardizing execution
- making recovery fast when systems break or drift

The terminal should not slow you down. It should execute exactly what you intend, immediately. That's what WodiBash solves.

## 🤝 Contributing

Found a way to make WodiBash even more "bulletproof"? Pull requests are welcome!

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Author

Caleb Wodi
- [X/Twitter](https://x.com/calchiwo)
- [LinkedIn](https://linkedIn.com/in/calchiwo)