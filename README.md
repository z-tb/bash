# bash
bash utilitiles I use often

# .bashrc.local
aliases, color prompt, some functions to make life easier. Place under `~/.bashrc.local` and give it 0644 or 0600 permissions. Has some debian-specific stuff you may need to modify such as the package update notification. To set-up:
```bash
chmod 0644 ~/.bashrc.local
```
Source `~/.bashrc.local` from `~/.bashrc` by adding this line to the bottom of `~/.bashrc`:
``` bash
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
```
If nothing happens...
  * Sourcing `~/.bashrc` in Bash is a little perplexing due to having _interactive_ and _login_ modes of the shell. Depending on which mode the shell is in.
    
Interactive Shell:
  * An interactive shell is one that has terminal "interaction" with the user. When an interactive shell starts, it reads and executes commands from `~/.bashrc`, if it exists.
    This allows customizations, aliases, functions, etc. defined in `~/.bashrc` to be available in the interactive shell session.

Login Shell:
  * A login shell is one that is started as the first process when a user logs in to the system.
    When a login shell starts, it reads and executes commands from initialization files in `/etc`, along with initialization files in $HOME.
    Some of the involved files are below. It's a little nuts.
    ```bash
    /etc/profile
    ~/.bash_profile
    ~/.bash_login
    ~/.profile
    ```
    If a `~/.bashrc` exists, it's usually sourced from one of the initialization files in $HOME (usually `~/.bash_profile`). Not all Linux distributions include this file so it can take some investigation to get things working.

The key differences are:

  * Interactive shells read ~/.bashrc directly, while login shells read it indirectly via ~/.bash_profile or similar.
    
  * Login shells have an additional set of initialization files (`/etc/profile`, `~/.bash_profile`, `~/.bash_login`, `~/.profile`) that are read before ~/.bashrc.

Sourcing `~/.bashrc` from login shell initialization files ensures its customizations are available in login sessions as well, but can cause performance issues.


To ensure that `~/.bashrc` is sourced with every bash shell, try:
    * Create or edit `~/.bash_profile` and add the following line at the end:

  ```bash
  [ -f ~/.bashrc ] && . ~/.bashrc
  ```

# system-wide configuration
To apply a system-wide bash prompt for all users, in a similar way to the per-user configuration above, copy bashrc.local to a /etc/bash (or similar location), and instead use this in your ~/.bashrc as shown below. This doesn't enable the prompt automatically for all users. You must export `LC_USE_PROM=1` to your remote environment before connecting.  This variable will be carried over to the connected system and will be evaluated true/false to enable the colored prompt:
```bash
[ -f /etc/bash/bashrc.local ] && . /etc/bash/bashrc.local
```
* The `ps1` file will need to be placed in `/etc/bash` instead of the per-user $HOME location.


# .vimrc
The included `.vimrc` file can be symlinked to customize the default settings for Vim (Very Irritating, man).
Key changes:
* setting the background color to dark.
* adjust tab size and indentation width to 3 spaces.
* converting tabs to spaces.
  * use this vim modeline in a Makefile if you need them.
  * `vim: syntax=make ts=8 sw=8 noet )`
* custom key mappings, allowing the F3 key to insert a formatted timestamp with the current date and user information. 
* Title bar is set to display the current hostname and filename.
* Status line shows the username, filename, and cursor position.
* Automatic adjustments for YAML files to use 2 spaces for indentation
* Custom cursor colors (orange in insert mode and red in normal mode)
* Search result highlighting, and modeline support to allow local options in files. 
