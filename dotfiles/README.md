## dotfiles

This directory contains my config files.

## What exactly are dotfiles?

In many operating systems, files & directories starting with a dot (`.`) are considered hidden.

This is particularly useful, as it provides a good place for programs to store their settings.

The tradition of storing config in dotfiles is widely adopted in Unix-based systems (most notably Linux & macOS).

Putting dotfiles online makes it very convenient, to quickly set up new work environments.

## Installation

To manage my dotfiles, I use [stow](https://www.gnu.org/software/stow/).

It's a tool, that allows quick creation of symbolic links.

> [!TIP]
> *What's a symbolic link?*
>
> Symbolic links (symlinks) are files that act as pointers to other files or directories. They're similar to Windows' shortcuts, but have minor differences in functionality & purpose.

First, check if you have `stow` installed:

```shell
$ stow --version
```

If no errors occurred, you can use `stow` to link my dotfiles:

```shell
$ stow --no-folding --adopt -t ~ .
```

After running above command, `stow` will create symbolic links in your home directory to files in this directory.

In case of any conflicts, `stow` will adapt to them (your configuration will be chosen over mine), you won't lose any settings :)

If you want to check, if `stow` has adapted anything, you can always run:
```shell
$ git status
```
