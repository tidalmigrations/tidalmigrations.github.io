---
title: Troubleshoot and diagnose Tidal Tools problems
keywords: tidal doctor, yaml, docker, linux, windows, log, log file, powershell, powershell ise
last_updated: Dec 13, 2018
summary: |
    If you are having problems related to Tidal Tools, the following tips
    should help you getting things working.
sidebar: tidal_toolsbar
permalink: troubleshooting.html
folder: tidaltools
---

Most problems with Tidal Tools can be fixed by following the troubleshooting
methods described below. If you need extra help with any of this, you can reach
us at [support@tidalmigrations.com](mailto:support@tidalmigrations.com).

## General troubleshooting options {#general}

### Diagnose dependencies and environment with `tidal doctor` {#tidal-doctor}

To work properly and to provide some of its features Tidal Tools depends on
some additional software and external services. To check your environment run
`tidal doctor` and review its output for any warnings and ways to recover.

Sample `tidal doctor` output looks like the following:

```
[-] Tidal Tools v2.2.20
    X Updates available.
      Go to https://get.tidal.sh/ for update instructions.
    • Config file in use: /home/tidaluser/.config/tidal/config.yaml
    • Logfile location: /home/tidaluser/.local/share/tidal/tidal.log

[√] Tidal API connection
    • Tidal API connection configured OK.

[√] Docker
    • Docker at /usr/bin/docker
    • Server 18.09.0 • API 1.39 (min. 1.12) • Client 1.39
    • Pull from registry OK

[-] DNS Tools
    X DNS Tools not installed.
      Go to https://dnstools.ninja/download/ for installation instructions

[-] vSphere connection
    X vSphere connection not configured.
      Run 'tidal login vsphere' to set it up.
```

### Update Tidal Tools

Periodically Tidal Tools checks if the newer version is available. It would
inform you about it as a message printed to your terminal or command prompt
output after any `tidal` command invocation:

```
Looks like you are running an older version of Tidal Tools.
Check https://get.tidal.sh for update instructions!
```

Also you can explicitly check for new Tidal Tools versions available by running
`tidal check-updates` or `tidal doctor` command.

### Default log file location {#logs-location}

To perform better diagnosis of any issues with Tidal Tools, some of the
underlying activities performed by Tidal Tools is written to the log file. If
you are having trouble with one of the Tidal Tools commands, you can reach us
at [support@tidalmigrations.com](mailto:support@tidalmigrations.com) and send
us your log file for us to investigate. 

The default locations of the log file are:

* `C:\Users\tidaluser\AppData\Roaming\tidal\tidal.log` on *Windows*
* `/home/tidaluser/.local/share/tidal/tidal.log` on *Linux*
* `/Users/tidaluser/Library/tidal/tidal.log` on *macOS*

Please note that log files are tuncated by default before the `tidal`
invocation. That means that the default log file contains entries specific to
the one particular `tidal` run.

### How to prevent log file from truncating {#keep-log}

The default log files truncation behavior may be not desirable in cases when it
is necessary to combine log entries of the several subsequent `tidal`
invocations. To prevent the existing log file from truncating you can utilize
`--keep-log` command line flag. When the `--keep-log` flag is used the log file
(default, or one specified with `--log-file`) won't be truncated before the
`tidal` command call.

### Docker installation {#docker-install}

Some of the Tidal Tools features (for example, `tidal analyze code`) depend on
Docker to be installed. To get the Docker installation instructions please
check the [Docker Documentation](https://docs.docker.com/install/).

### How to check if Docker actually works {#docker-run}

There are a few ways to check if your Docker installation actually works.

Open your terminal emulator or command prompt and run the command `docker run
hello-world`. The sample output should look like the following:

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
d1725b59e92d: Pull complete
Digest: sha256:0add3ace90ecb4adbf7777e9aacf18357296e799f81cabc9fde470971e499788
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
…
```

To explicitly check that your Docker installation is able to communicate with
Tidal Migrations container registry run the command `docker run
gcr.io/tidal-1529434400027/hello-world`. You should see the output similar to
the following:

```
Unable to find image 'gcr.io/tidal-1529434400027/hello-world:latest' locally
latest: Pulling from tidal-1529434400027/hello-world
9e91b00c0251: Pull complete
Digest: sha256:b60c2de90e0b5c4f7e74b84ca888e2fec1d288d47c99e48bd612e0eefeb604c5
Status: Downloaded newer image for gcr.io/tidal-1529434400027/hello-world:latest
Hello from Tidal Migrations!
```

Another option is to run `tidal doctor` and check the Docker section of the output.

## Windows specific troubleshooting {#windows}

### Setting up Docker for Windows to use Linux containers {#docker-linux-containers}

Docker for Windows supports both Linux containers and Windows containers,
however Tidal Tools work only if your Docker installation was switched to Linux
containers.

To check if your Docker installation was configured to use Linux containers
please check one of the following:

* Open Docker for Windows menu and check for the item **Switch to Windows
  containers**. If you can find it, that means that your Docker is configured
  to talk with Linux daemon, so no further actions are needed to be performed.
* However, if you see **Switch to Linux containers** in the Docker for Windows
  menu, that means that the Docker was configured to talk to Windows daemon.
  You need to click that menu item to switch to Linux containers.
* Running `tidal doctor` also checks if your Docker installation is configured
  to use Linux containers or not.

### Issues running Tidal Tools with PowerShell ISE {#powershell-ise}

Since PowerShell ISE only runs console apps that don't require user input some
of the Tidal Tools commands may work incorrect. It's recommended to use
PowerShell instead (i.e. `PowerShell.exe`, **not** `PowerShell_ise.exe`).

However if you really need to use PowerShell ISE you should make some
preparations. Most of the time Tidal Tools ask user for some input is when it
prompts for connection credentials. To prevent Tidal Tools from prompting you
should explicitly specify all the necessary connection information. It could be
done by either using `tidal config` command, or manually editing the
configuration file, or by setting up the appropriate environment variables.

### Windows directory separators in YAML files {#yaml-backslash}

Windows traditionally uses the backslash (`\`) to separate directories in file
paths. For example, `C:\Program Files\Tidal Software\tidal`. However, the
configuration and discovery plan language ([YAML](https://yaml.org/)) also uses
the backslash (`\`) as an escape character in [quoted
strings](https://yaml.org/spec/1.2/spec.html#id2776092). This can make it
awkward to write literal backslashes.

Generally it is OK to use forward slashes, because most of the time the Windows
file system APIs will accept **both** the backslash (`\`) and forward-slash
(`/`) in file paths. But when you use backslashes, you must pay extra attention
to keep them from being suppressed by YAML string quoting. That means that you
must escape the backslash character with another backslash (which is the escape
character), so the string must be as the following: `C:\\Program Files\\Tidal
Software\\tidal`.

## Linux troubleshooting {#linux}

### Manage Docker as a non-root user {#docker-non-root}

The Docker daemon binds to a Unix socket instead of a TCP port. By default that
Unix socket is owned by the user `root` and other users can only access it
using `sudo`. The Docker daemon always runs as the `root` user.

If you don't want to preface the `tidal analyze code` command with `sudo`,
create a Unix group called `docker` and add users to it. When the Docker daemon
starts, it creates a Unix socket accessible by members of the `docker` group.

To create the `docker` group and add your user:

1. Create the `docker` group.
```
$ sudo groupadd docker
```

2. Add your user to the `docker` group.
```
$ sudo usermod -aG docker $USER
```

3. Log out and log back in so that your group membership is re-evaluated. If
   testing on a virtual machine, it may be necessary to restart the virtual
   machine for changes to take effect. On a desktop Linux environment such as X
   Windows, log out of your session completely and then log back in.

4. Verify that you can run `docker` commands without `sudo`.
```
$ docker run hello-world
```
