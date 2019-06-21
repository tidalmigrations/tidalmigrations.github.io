---
title: Tidal Tools Autocompletion
keywords: autocomplete, tab, linux, macos, bash
last_updated: April 24, 2018
summary: "Setting up autocompletion for Tidal Tools"
sidebar: main_sidebar
permalink: autocompletion.html
folder: tidaltools
---

# What is Autocompletion?
Autocompletion, also known as tab-completion is a common feature of command-line interpreters.
It allows you to type the first few characters of a command, and press a completion key (_tab_) to
autocomplete the rest of the command.

In the case of multiple possibilities, it will list all possible command options beginning with those few characters.

Tidal Tools's autocompletion feature can be very useful! For more details, consult `tidal completion -h`.

# Setting up Autocompletion

Currently, Tidal Tools's autocompletion feature is supported for Bash.
Follow the instructions below on setting up autocompletion for your operating system.

## Linux

Before enabling tidal autocompletion, be sure to install bash completion with the following command:

```
sudo apt install bash-completion
```

Now, to enable the autocompletion feature to your *current* shell, run:
```
source <(tidal completion bash)
```

The following command will set up Tidal autocompletion to your profile, so that it is automatically enabled for any new shell session you open.
```
echo "source <(tidal completion bash)" >> ~/.bashrc
```

## macOS

On macOS, you must have bash-completion support installed.

If not, you can install bash-completion via [Homebrew](https://brew.sh/).


Next, if you are running *Bash 3.2*, run:
```
brew install bash-completion

```
or if you are running *Bash 4.1+*
```
brew install bash-completion@2

```

{% include note.html content="Follow the “caveats” section of brew’s output to add the appropriate bash completion path to your local .bashrc. to enable bash completion for any new shell session" %}

After installing bash-completion support or have already installed it, you can add *Tidal* autocompletion to the bash-completion:

`tidal completion bash > $(brew --prefix)/etc/bash_completion.d/tidal`
