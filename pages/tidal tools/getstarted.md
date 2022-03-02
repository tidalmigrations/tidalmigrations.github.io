---
title: Getting Started with Tidal Tools
keywords: install, login, connect, configuration, proxy, environment
last_updated: April 23, 2020
summary: "Get started working with Tidal Tools"
sidebar: main_sidebar
permalink: tidal-tools.html
folder: tidaltools
---

{% include note.html content="This page describes general installation and
configuration instructions for Tidal Tools. If you are looking for specific AWS
usage instructions please refer to [Getting Started with Tidal Tools on
AWS](tidal-tools-aws.html) guide." %}

Here we outline how to get started working with Tidal Tools via the command
line.

## Downloading & Installing {#install}

Tidal Tools is a cross platform CLI utility that you can use to discover and
analyze your applications. [Easily install Tidal Tools](https://get.tidal.sh)
on your operating system.

If you are looking for a full walkthrough of the steps, you can watch a brief
video on how to install it on [Windows, Linux](https://www.youtube.com/watch?v=t86W7BokqGM) or [macOS](https://www.youtube.com/watch?v=DyHT0mtPcfE).

If you'd prefer to use a cloud shell, you can watch how to get setup in the [AWS](https://www.youtube.com/watch?v=YpX64_uU-Oo),
[Azure](https://www.youtube.com/watch?v=N_o_GSSY0zg) or [Google](https://www.youtube.com/watch?v=lHO5sk54ceo) cloud shells.

### Dependencies

If you plan to use the `tidal analyze code` command to analyze your source code
or `tidal analyze db` to analyze your databases, you will need to install
Docker Community Edition. To install Docker on your system you can check
[Docker's documentation directly](https://docs.docker.com/install/). Once
installed you can [verify it is installed and working
correctly](/troubleshooting.html) with the command `tidal doctor`.

Docker for Windows supports both Linux containers and Windows containers,
however **Tidal Tools works when your Docker installation is set to use
Linux containers**. [Set up Docker for Windows to use Linux
containers](/troubleshooting.html#docker-linux-containers).

## Using Tidal Tools

To get started, from a new terminal or Powershell prompt, simply run:

```
tidal
```

To see what you can do with the tidal checkout some of our other articles about
creating sync jobs or analyzing your applications via their URLs.

## Connecting to the API

Once you have Tidal Tools installed you need to configure access to the API.
[Register for a free account](https://get.tidalmg.com/) with Tidal Migrations
to get the connection details.

There are several ways to authenticate with the Tidal Migrations API, we
recommend the first one, `tidal login`, because your password is never
persisted to disk.

### Tidal Login command {#login}

To authenticate with the API type `tidal login` and follow the prompts. This
should provide and store an access token for you that gives you access for 8
hours. Once it is expired, the user must login again and obtain another token.

**We recommend that you utilise this command because it doesn't store your
password.** If you must store the password, you can authenticate using the
methods below.

### Alternative authentication methods

#### Configuration file


Alternatively, you can use the `tidal config` command to manually set your
credentials.

Only your Tidal Migrations password and vSphere password are encrypted using AES 256 bit encryption.

For example, you can set your username, password and URL with the three
following commands:

```
tidal config set tidal.email [set your email]
tidal config set tidal.password [set your password]
tidal config set tidal.url https://demo.tidalmg.com
```

Your credentials will be stored in a configuration file such as:

```
tidal:
  email: my_user_name_here
  password: my_secure_password_here
  url: https://my_instance_name_here.tidalmg.com
```
{% include note.html content="Your configuration file is not encrypted. Only your Tidal Migrations password and vSphere password are encrypted using AES 256 bit encryption." %}

On macOS the config file is located:
`$HOME/Library/Preferences/tidal/config.yaml`

On Linux systems it is: `$HOME/.config/tidal/config.yaml`

And on Windows it is: `%AppData%\tidal\config.yaml`

#### Environment Variables

You can specify your credentials as environment variables. If so, these
variables need to be set:

- `TIDAL_EMAIL`
- `TIDAL_PASSWORD`
- `TIDAL_URL`

#### Dynamically

Alternatively you can pass in your credentials on each request as command line
arguments using the following flags:

```
--tidal-email youremail@address.here
--tidal-password your_secure_password
--tidal-url https://yoursubdomain.tidalmg.com
```

## Testing connectivity and authentication

Once you have set your credentials you can test your connectivity and
authentication to the API with the ping command:

```
tidal ping
```

### Using a Proxy

If you need to use a proxy, you can specify it with the `https_proxy` variable.

On macOS and Linux you would run:

```
export https_proxy=1.1.1.1:123
```

and on Windows:

```
set https_proxy=1.1.1.1:123
```

Of course replacing `1.1.1.1` with your proxy IP address and `123` with the
port number.

Once you have this set, you should be able to run `tidal ping` successfully.
Remember that you will need to set this for every new terminal session you
start.
