# Terminal Cheatsheet

## Vi Mode

| Key | Action |
|-----|--------|
| `Esc` | Normal mode (cursor → block) |
| `i` | Insert mode (cursor → beam) |
| `a` | Insert after cursor |
| `A` | Insert at end of line |
| `0` | Start of line |
| `$` | End of line |
| `w` / `b` | Next / previous word |
| `dw` | Delete word |
| `dd` | Delete whole line |
| `u` | Undo |
| `ctrl-r` | Redo |

---

## Keybinds (Insert Mode)

| Key | Action |
|-----|--------|
| `→` or `ctrl-space` | Accept autosuggestion |
| `↑` / `↓` | Search history by prefix |
| `ctrl-a` | Beginning of line |
| `ctrl-e` | End of line |
| `ctrl-w` | Delete word backwards |
| `ctrl-u` | Delete whole line |
| `ctrl-l` | Clear screen |
| `tab` | Autocomplete (case-insensitive) |

---

## Zoxide

> Learns from your `cd` history. The more you visit a dir, the higher it ranks.

| Command | Action |
|---------|--------|
| `cd foo` | Smart jump to best match for `foo` |
| `z foo` | Same as `cd` (explicit) |
| `zi` | Interactive fuzzy picker |

---

## Eza (ls replacement)

| Command | Action |
|---------|--------|
| `ls` | List with icons, dirs first |
| `ll` | Long list with git status |
| `lt` | Tree view (2 levels deep) |

---

## Git Aliases

| Alias | Command |
|-------|---------|
| `g` | `git` |
| `gs` | `git status -sb` |
| `ga` | `git add` |
| `gc` | `git commit` |
| `gco` | `git checkout` |
| `gp` | `git push` |
| `gl` | `git pull` |
| `gd` | `git diff` |
| `gds` | `git diff --staged` |
| `glog` | `git log --oneline --graph --decorate` |

---

## Navigation Aliases

| Alias | Action |
|-------|--------|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |

---

## tmux

> Prefix is `ctrl-a`

| Key | Action |
|-----|--------|
| `prefix \|` | Split pane horizontally |
| `prefix -` | Split pane vertically |
| `prefix h/j/k/l` | Navigate panes |
| `prefix r` | Reload tmux config |
| `prefix [` | Enter copy mode (vi keys) |
| `v` (copy mode) | Begin selection |
| `y` (copy mode) | Yank selection |

---

## Config File Locations

| File | Path |
|------|------|
| Ghostty | `~/.config/ghostty/config` |
| tmux | `~/.tmux.conf` |
| zsh | `~/.zshrc` |
| Starship prompt | `~/.config/starship.toml` |
| readline (inputrc) | `~/.inputrc` |
