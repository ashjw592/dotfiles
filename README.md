# dotfiles

My personal terminal config for Fedora + Ghostty + tmux + zsh.

## Stack

- **Terminal** — [Ghostty](https://ghostty.org) with Catppuccin Frappé
- **Multiplexer** — tmux
- **Shell** — zsh
- **Prompt** — [Starship](https://starship.rs)
- **Autocomplete** — zsh-autosuggestions + zsh-syntax-highlighting
- **Directory jumping** — [zoxide](https://github.com/ajeetdsouza/zoxide)
- **ls replacement** — [eza](https://github.com/eza-community/eza)

## Install

```sh
# Clone the bare repo
git clone --bare git@github.com:ashjw592/dotfiles.git ~/.dotfiles

# Set up the alias
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the files
dotfiles checkout

# Hide untracked files
dotfiles config --local status.showUntrackedFiles no
```

## Dependencies

```sh
sudo dnf install zsh tmux zsh-autosuggestions zsh-syntax-highlighting zoxide

# Starship
curl -sS https://starship.rs/install.sh | sh

# eza (not in Fedora repos)
curl -Lo eza.tar.gz https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-musl.tar.gz
tar xzf eza.tar.gz && sudo mv eza /usr/local/bin/ && rm eza.tar.gz
```

## Config Locations

| File | Path |
|------|------|
| Ghostty | `~/.config/ghostty/config` |
| tmux | `~/.config/tmux/tmux.conf` |
| zsh | `~/.config/zsh/.zshrc` |
| Starship | `~/.config/starship.toml` |
| readline | `~/.config/readline/inputrc` |

## Usage

See [CHEATSHEET.md](CHEATSHEET.md) for all keybinds, aliases, and tmux shortcuts.

## Managing

```sh
dotfiles status
dotfiles add ~/.config/zsh/.zshrc
dotfiles commit -m "update zshrc"
dotfiles push
```
