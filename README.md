Configurations for CLI-based tools
==================================

This repository contains the latest configuration I have for:

- vim
- tmux
- bash
- ipython
- ptpython
- git

Setup
-----

1. Clone this repository with the `--recursive` flag

    ```bash
    git clone --recursive git://github.com/felixleong/dotfiles
    ```

2. Symlink the required configuration files

    ```bash
    # For VIM files, for example
    cd ~
    ln -s dotfiles/.vimrc .
    ln -s dotfiles/.vim .

    # Git
    ln -s dotfiles/.gitconfig .

    # NPM
    ln -s dotfiles/.npmrc .
    ```

3. Install the required Node and Python 3 packages

    ```bash
    sudo pip3 install --user -r requirements.txt
    cat npm-requirements.txt | sudo xargs npm install -g
    ```

Updating Submodules
-------------------

```bash
git submodule update --remote
```
