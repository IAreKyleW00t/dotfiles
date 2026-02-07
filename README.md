# 🗂️ dotfiles

This is a very basic repo for managing and tracking my `dotfiles` using plain 'ol [git](https://git-scm.com/).

## Installation

Create a `dotfiles` alias for the `git` command.

```sh
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
```

### First-time setup

```sh
git init --bare "$HOME/.dotfiles"
dotfiles config --local status.showUntrackedFiles no
```

### Normal Setup

```sh
git clone --bare git@github.com:IAreKyleW00t/dotfiles.git "$HOME/.dotfiles"
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## Usage

This is just a fancy `git` alias; the usage is exactly the same.

```sh
dotfiles add .gitconfig
dotfiles commit -m "An example"
dotfiles push
```

## License

See [LICENSE](LICENSE).

## Credits

- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles) by Atlassian
