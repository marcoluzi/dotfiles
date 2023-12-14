<div align="center">
<h1>dotfiles</h1>
<p><b>Dotfiles Setup Script for the WEBKINDER macOS Development Environment.</b></p>
</div>

## Requirements
- Fresh macOS installation

## Installation
- Download this repository and place it in your `~` folder and rename it to `.dotfiles`.
- `cd ~/.dotfiles` into the folder and run `./bootstrap.sh`

## Post-Installation Steps
### GitHub Access Token for WEBKINDER Yarn Packages
- Create a GitHub Access Token (classic) on [this](https://github.com/settings/tokens) page.
- Name it `WEBKINDER_YARN_PACKAGES`.
- Set expiration to `No expiration`.
- Check the scope `write:packages`.
- Copy the generated access token starting with `ghp_`
- Paste the access token into your `~/.dotfiles/5-dev-env/.npmrc` file. The final result should look like this:
```
@webkinder:registry=https://npm.pkg.github.com
//npm.pkg.github.com/:_authToken=ghp_************
```

### Allow no password login for phpmyadmin
- Open the config.inc.php file and set `$cfg['Servers'][$i]['AllowNoPassword']` to true.
```
vim $(brew --prefix phpmyadmin)/share/phpmyadmin/config.inc.php
```

phpmyadmin can now be accessed via the URL phpmyadmin.test in your browser. The username is equal to your computers username (`echo $USER`). The password field can be left empty.

### Install WK-CLI
- Open the [WK-CLI repository](https://github.com/webkinder/wk-cli) and follow the installation guide in the README.md file.

## Available aliases, functions and snippets
### Aliases
- `gaa` -> `git add --all`
- `bg` -> `git branch`
- `gbd` -> `git branch -d`
- `gcam` -> `git commit -am`
- `gcb` -> `git checkout -b`
- `gco` -> `git checkout`
- `glg` -> `git log --stat`
- `glgp` -> `git log --stat -p`
- `glgg` -> `git log --graph`
- `glgga` -> `git log --graph --decorate --all`
- `glgm` -> `git log --graph --max-count=10`
- `glo` -> `git log --oneline --decorate`
- `glol` -> `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset'`
- `glols` -> `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat`
- `glod` -> `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'`
- `glods` -> `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short`
- `glola` -> `git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all`
- `glog` -> `git log --oneline --decorate --graph`
- `gloga` -> `git log --oneline --decorate --graph --all`
- `gm` -> `git merge`
- `gsb` -> `git status -sb`
- `..` -> `cd ..`
- `...` -> `cd ../..`
- `....` -> `cd ../../..`
- `.....` -> `cd ../../../..`
- `ls` -> `ls $LS_OPTIONS -hFtr`
- `ll` -> `ls $LS_OPTIONS -lAhFtr`
- `l` -> `ls -lF`
- `la` -> `ls -lAF`
- `lsd` -> `ls -lF | grep --color=never '^d'`
- `grep` -> `grep --color=auto`
- `fgrep` -> `fgrep --color=auto`
- `egrep` -> `egrep --color=auto`
- `cgu` -> `composer global update`
- `vs` -> `valet secure`

### Functions
- `clean-db-backups` -> Deletes all DB backups created by wordmove, that are older than 30 days.
- `gcm` -> `git checkout` to the default branch of the repository.
- `ggl` -> `git pull` from the origin of the current branch.
- `ggp` -> `git push` to the origin of the current branch.
- `mvf-create` -> Create movefile.yml in the current directory.
- `pubkey` -> Copy your public ssh key to the clipboard.
- `repo <repo-name>` -> `cd` into the repo directory inside your `~/repos` folder. Autocompletes with folders one level deep within `~/repos/*/<repo-name>`. If `<repo-name>` is not set, this function `cd`s into the `~/repos/` folder.
- `update` -> Updates all brew, global yarn, global composer packages and Safari.
- `vup <php-version>` -> Change PHP Version with Laravel Valet. Example: `vup 8.2`
- `wml <env>` -> Runs `wordmove pull --all` with the selected environment. `<env>` can be omitted if only one environment is set in the movefile.yml.
- `wp-delete <folder-name>` -> Deletes a local WordPress installation in your `~/repos/valet` folder. Also deletes DB and SSL certs. Autocompletes with the folder name.
- `yci` -> Runs `yarn && composer i`
- `yp` -> Runs `yarn prod || yarn production || yarn build`
- `yw` -> Runs `yarn watch || yarn start || yarn dev`
- `ywm <env>` -> Runs `yp && wordmove push -t` with the selected environment. `<env>` can be omitted if only one environment is set in the movefile.yml.

### Snippets
- `bp-{xs/sm/md/lg/xl/xxl}-{up/down/only}` -> SCSS Snippet to create media-breakpoints.

Example:
`bp-md-up` -> `@include media-breakpoint-up(md) {}`
