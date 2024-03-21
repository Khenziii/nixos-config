## dotfiles

This repository contains some of my config files.

## What exactly are dotfiles?

In many operating systems, files / directories starting with a dot (`.`) are considered hidden.

This is particularly useful, as it makes them a good place for programs to store theirs settings in.

The tradition of storing config in dotfiles is widely adopted in Unix-based systems (most notably Linux & macOS).

Putting dotfiles online makes it very convenient, to quickly set up new work environments.

## Installation

To manage my dotfiles, I use [stow](https://www.gnu.org/software/stow/).

It's a tool, that allows quick creation of symbolic links.

To install, you should first make sure, that git & stow is available on your os:
```bash
git version && stow --version
```

navigate to your home directory:
```bash
cd ~
```

clone the repo:
```bash
git clone https://github.com/Khenziii/dotfiles
```

move to the cloned repo:
```bash
cd dotfiles
```

and run:
```bash
stow .
```

After running above command, stow will take all files that are in the current working directory and create a symbolic link to them in the parent directory.
