# .vim

This is my customized version of some useful `vim` tools.

It is highly recommended that you back up your own .vimrc and .vim/ folder
before installing this.

## Useful Commands

| Command            | Description                                                                                                      |
| ------------------ | ---------------------------------------------------------------------------------------------------------------- |
| :vs                | Open another tab as a vertical split.                                                                            |
| :sp                | Open another tab as a horizontal split.                                                                          |
| :qa                | Quit all tabs.                                                                                                   |
| ctrl + <arrow key> | Use `ctrl` + any arrow key to jump between tabs in the specified direction.                                      |
| :A                 | Switch between `.h` and `.cpp` files, in the same directory.                                                     |
| F2                 | Opens a file browser. Use the arrow keys (or mouse) to navigate. Use `enter` to expand folders and select files. |
| ctrl + p           | Search for a file.                                                                                               |

## Installation

### Linux Install Guide

```
cd ~/
git clone --recursive https://github.com/mrhappyasthma/.vim.git
```

or

```
cd ~/
git clone https://github.com/mrhappyasthma/.vim.git
cd .vim
git submodule update --init --recursive
```

After that is cloned, use `vim` to open an file and run `:BundleInstall`.

*Note: These steps only need to be done once during install. You will NOT need
to run them every time.*
