# bash
bash utilitiles I use often

# .bashrc.local
aliases, color prompt, some functions to make life easier. Place under `~/.bashrc.local` and give it 0644 or 0600 permissions:
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
