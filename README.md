# jon's dotfiles

Config files, managed by the [GNU Stow](https://www.gnu.org/software/stow/) symlink farm manager.

## usage

```bash
git clone git@github.com:jon-codes/.dotfiles.git ~/.dotfiles

cd ~/.dotfiles

git submodule update --init --recursive
```

### symlinking individual configs

```bash
stow zsh
```

### symlinking multiple configs

```bash
stow zsh git
```

### removing symlinked configs

```bash
stow --delete zsh
```
