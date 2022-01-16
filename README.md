# jon's dotfiles

Config files, managed by the [GNU Stow](https://www.gnu.org/software/stow/) symlink farm manager.

## usage

```bash
git clone https://github.com/jon-codes/.dotfiles.git ~/.dotfiles
```

```bash
cd ~/.dotfiles
```

### symlinking individual configs

```bash
stow --dotfiles zsh
```

### removing individual configs

```bash
stow --dotfiles --delete zsh
```

