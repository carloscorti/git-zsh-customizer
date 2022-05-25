# git-zsh-customizer

.zshrc script to customize your zsh (not bash) terminal with git features

Git Terminal
![alt text](/screenshots/GitTerminal.png)

No Git Terminal
![alt text](/screenshots/NoGitTerminal.png)

## Features

- Local Git branch detection support
- Local Git branch state support (untracked, unstaged, staged)
- Branch highlight for specific branch
- zsh terminal prompt line color customization
- zsh terminal prompt line folder path customization

## Getting Started

### Installing

To set up this exact customization just downloaad this .zshrc file and copy the script (in between `#### terminal customization start` and `#### terminal customization end`) and the end of your .zshrc file (usually at the root level of your user folder, like /User/your-user-name/.zshrc (~ starting from user folder)) and save.

## Further customization

If you want to change the custmoozation here you have some hints

### Change colors

Colors are in between `%F{color}%--somnething-here--f% `, so everytime you want to change a color, just replace color for wichever color you want. [Here you have color references ](https://www.tweaking4all.com/software/macosx-software/xterm-color-cheat-sheet/)

#### Example

```
local USER_NAME='%B%F{red}%n%f%b'
local FOLDER_PATH='%B%F{84}%20~%f%b'
```

### Highlighted texts backgrounds

Same as only colors, background colors can also be chnaged, you can idenfify bacKground highlight as `%K{color}%--somnething-here--k% `. Again [here you have color references ](https://www.tweaking4all.com/software/macosx-software/xterm-color-cheat-sheet/) just in case

#### Example

```
echo "%F{white}on branch -> %K{229} %B%F{232}"%1v"%f%b %k"
```

### Icons

Icons are just Unicode emojis, [here you can find a lot of them](https://unicode.org/emoji/charts/full-emoji-list.html). In order to change any, just replace the Unicode reference

#### Example

```
local SKULL_ICON=$'\U1F480'
local GIT_UNSTAGED_ICON=$'\U274C'
local GIT_UNTRACKED_FILES_ICON=$'\U1F69C'
local GIT_STAGED_ICON=$'\U2705'
```

### Add or change banch with diferent text highlight

As it is the script, what you can do is add or change branches to have s differential highlighted text (in case you want to have another differential highlighted text with a third color, you need to and another elif statement to the script on `vcs_info_wrapper_branch_name` function).

#### Change branch for diferent text highlight

On `vcs_info_wrapper_branch_name` function, setup the specific branch name you whant to have differential highlighted text

```
vcs_info_wrapper_branch_name() {
  if [[ "${vcs_info_msg_0_}" == "" ]]; then
    echo ""
  elif [[ ${psvar[1]} == "BRANCH-YOU-WHANT-HERE" ]]; then
    echo "%F{white}on branch -> %K{9} %B%F{232}"%1v"%f%b %k"
  else
    echo "%F{white}on branch -> %K{229} %B%F{232}"%1v"%f%b %k"
  fi
}
```

#### Add branch for diferent text highlight

On `vcs_info_wrapper_branch_name` function, add an OR (`||`) condition for the specific branch name you whant to also have differential highlighted text

```
vcs_info_wrapper_branch_name() {
  if [[ "${vcs_info_msg_0_}" == "" ]]; then
    echo ""
  elif [[ ${psvar[1]} == "BRANCH-YOU-WHANT-HERE" || ${psvar[1]} == "OTHER-BRANCH-YOU-WHANT-HERE" ]]; then
    echo "%F{white}on branch -> %K{9} %B%F{232}"%1v"%f%b %k"
  else
    echo "%F{white}on branch -> %K{229} %B%F{232}"%1v"%f%b %k"
  fi
}
```

## Built With

- Love

## References

### Oficial documentetion

- https://unicode.org/emoji/charts/full-emoji-list.html
- https://zsh.sourceforge.io/Doc/Release/User-Contributions.html
- https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
- https://github.com/zsh-users/zsh/blob/master/Misc/vcs_info-examples

### External references

- https://www.tweaking4all.com/software/macosx-software/xterm-color-cheat-sheet/
- https://www.tweaking4all.com/software/macosx-software/customize-zsh-prompt/
- https://www.youtube.com/watch?v=XVSZAwTXtAs
- https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
- https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
- https://www.makeuseof.com/customize-zsh-prompt-macos-terminal/
- https://stackoverflow.com/questions/64093788/different-zsh-terminal-prompt-when-outside-git-directory/64094551#64094551
- https://stackoverflow.com/questions/69357323/is-it-possible-to-format-the-colour-of-parts-of-my-git-branch-name-inside-the-pr
- https://stackoverflow.com/questions/229551/how-to-check-if-a-string-contains-a-substring-in-bash
- https://misc.flogisoft.com/bash/tip_colors_and_formatting
- https://timothybasanov.com/2016/04/23/zsh-prompt-and-vcs_info.html

## Author

- **Carlos Corti**
