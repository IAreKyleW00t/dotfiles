# dotfiles

This is a very basic repo for managing and tracking my `dotfiles` using plain 'ol [git](https://git-scm.com/).
Feel free to use this repo as a reference/example for creating your own dotfiles.

I'll probably move to something like [yadm](https://yadm.io/) to more easily handle [alterate files](https://yadm.io/docs/alternates) and [bootstrapping](https://yadm.io/docs/bootstrap).

## Installation

For ease of use, we'll create a `dotfiles` alias for the `git` command.

```sh
alias dotfiles='git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
```

### First-time setup

If you are settings up `dotfiles` for the **first time**, meaning you have NOT set it up on any other computer, then you need to create the initial repo.

```sh
git init --bare "$HOME/.dotfiles"
dotfiles config --local status.showUntrackedFiles no
```

### Normal Setup

If you've already setup a repo with your configs and are setting up a new computer, you can do the same things except clone the repo instead.

```sh
git clone --bare <git-repo-url> "$HOME/.dotfiles"
dotfiles checkout
dotfiles config --local status.showUntrackedFiles no
```

## Usage

Since this is just a fancy `git` alias the usage is exactly the same except you must explicitly add new configs that need tracked.

```sh
dotfiles add .gitconfig
dotfiles commit -m "An example"
dotfiles push
```

## License

See [LICENSE](LICENSE).

## Credits

- [Dotfiles: Best Way to Store in a Bare Git Repository](https://www.atlassian.com/git/tutorials/dotfiles) by Atlassian
