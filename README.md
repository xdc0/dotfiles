# Dotfiles

This repository contains configuration files for various applications I use regularly.

## Usage

### Notice

I try to keep my config settings platform agnostic, but this is not a guarantee, sometimes for 
the sake of saving time or for plain laziness, I will hardcode some values here and there that 
only work on my computers.

If you choose to use any of these configurations, please keep the above in mind.

### Installation

1. Clone this repository to any directory of your preference.
2. Change to your home directory and create a symbolic link:

```shell
$ ln -ns /absolute/path/to/dotfiles/.config ./
```

Make sure that you use an absolute path when creating the symbolic link as relative paths do
not work.

## Applications

### Emacs

Emacs is my editor of choice since ~2013. I started my professional career using other tools
(Dreamweaver, Bluefish and Eclipse), then moved on to VIM for a few years and eventually
gravitated to Emacs.

I've used other tools on-and-off as my daily driver, particularly IntelliJ IDEs (which are 
great tools) but it is unlikely I stop using Emacs as long as I continue working in the 
technology field.

#### Notes about configuration

The configuration I use is centered about `evil-mode`, after using VIM I simply cannot
function without its modal text editing style. The configurations might grow stale
eventually, but I usually run Emacs at the latest version, if not at bleeding edge.

I primarly configure packages using `use-package` which I find very convenient to keep
things well defined and organized.

Some configurations might be too specific to macOS as it is the OS I use the most when
working.

You can inspect configurations for specific programming languages under 
`.emacs.d/config/languages`. Other general configuration should be easy to find.
