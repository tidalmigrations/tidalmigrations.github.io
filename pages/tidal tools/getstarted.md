---
title: Getting Started with Tidal-Tools
keywords: install, login
last_updated: Feb 13, 2018
summary: "Get started working with Tidal Tools"
sidebar: tidal_toolsbar
permalink: tidal-tools.html
folder: tidaltools
---

Here we outline how to get started working with Tidal Tools via the command line.

## Downloading & Installing {#install}

Tidal Tools is a cross platform CLI utility that you can use to discover and analyze your applications.
[Easily install Tidal Tools](https://get.tidal.sh.) on your operating system.

## Using Tidal Tools
To get started, from a new terminal or Powershell prompt, simply run:

`` tidal ``
To see what you can do with the tidal checkout some of our other articles about creating sync jobs or analyzing your applications via their URLs.

## Connecting to the API
Once you have Tidal Tools installed you need to configure access to the API.

The credentials can be defined via a config file or via environment variables. If a config file is present it will be used, if it is not present environment variables will be used.
You can also utlise the `tidal login` command.

### Tidal Login command {#login}
You can authenticate with the API using the command: `tidal login`. The login command varifies the user's identity using the authentication methods. This should provide and store an access token for you. 
The lifetime of the access token is 8 hours. Once it is expired, the user must login again. 

We recommend that you utilise this command as it doesn't store your password. If you must the store the password, you can authenticate using the methods below.



### Configuration file

Alternatively, you can use the `tidal config` command to interactively set your credentials.

For example, you can set your username and password with the two following commands:

``` tidal config set tidal.email [set your email] ```

``` tidal config set tidal.password [set your password] ```

And you can set the URL with the following command:

``` tidal config set tidal.url https://demo.tidalmg.com ```

Your credentials will be stored in a configuration file such as:

```
tidal: 
  email: my_user_name_here 
  password: my_secure_password_here 
  url: https://my_instance_name_here.tidalmg.com
  ```

On macOS the config file is located: ```Library/Preferences/tidal/config.yaml```

On Linux systems it is: ```$HOME/.config/tidal/config.yaml```

And on Windows it is: ```%AppData%\tidal\config.yaml```

### Environment Variables
If you use environment variables these variables need to be set:

- TIDAL_EMAIL
- TIDAL_PASSWORD
- TIDAL_URL

### Dynamically
Alternatively you can pass in your credentials on each request as command line arguments using the following flags:

``` --tidal-email youremail@address.here ```

``` --tidal-password your_secure_password ```

``` --tidal-url https://yoursubdomain.tidalmg.com ```

## Testing connectivity and authentication
Once you have set your credentials you can test your connectivity and authentication to the API with the ping command: 

``` tidal ping ```

If you receive an error you can use the --debug flag to see what the issue is:

``` tidal ping --debug ```

### Using a Proxy
If you need to use a proxy, you can specify it with the https_proxy variable.

On macOS and Linux you would run:

``` export https_proxy=1.1.1.1:123 ```

and on Windows:

``` set https_proxy=1.1.1.1:123 ```

Of course replacing 1.1.1.1 with your proxy IP address and 123 with the port number.

Once you have this set, you should be able to run ```tidal ping``` successfully. Remember that you will need to set this for every new terminal session you start.
