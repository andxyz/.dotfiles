#!/usr/bin/env bash
# set -x
# set -e
#
# I guess one needs to read about the craziness for profiling-zsh-startup-time
#
# https://kev.inburke.com/kevin/profiling-zsh-startup-time/
# https://github.com/raboof/zshprof
#
## Run in 2024 on osx 14.4.1
#
# brew install ocamlbuild ocaml-findlib
# cd /Users/andxyz/code/personal
# git clone 'git@github.com:andxyz/zshprof.git'
# cd zshprof
#
# ocamlfind ocamlopt -linkpkg -thread -package str Callgrind.ml ZshXtrace.ml ZshXtraceToCallgrind.ml -o zshprof.bin
# ./zshprof.bin < /tmp/zshprof.57612.log > /tmp/zsh.57612.callgrind
# brew install qcachegrind
# qcachegrind /tmp/zsh.*.callgrind
#
# a quick check
# time bash -li -c 'echo hi; exit;'
# time zsh -li -c 'echo hi; exit;'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROFILE_STARTUP=false
if [[ "$PROFILE_STARTUP" == true ]]; then
  # http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
  PS4=$'\\\011%D{%s%6.}\011%x\011%I\011%N\011%e\011'
  exec 3>&2 2> /tmp/zshprof.$$.log
  setopt xtrace prompt_subst
fi

# forcing paths on a mac when using interactive shell
export -- PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

[[ -f ~/.shell/path_envs ]]         && source ~/.shell/path_envs
[[ -f ~/.shell/path_envs_private ]] && source ~/.shell/path_envs_private

## for interactive shell
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_shell ]]   && source ~/.shell/config_interactive_shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_private ]] && source ~/.shell/config_interactive_private
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## for zsh interactive specific
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_interactive ]] && source ~/.zsh/zsh_interactive

# the following is a mac osx path fix for gifting my path env var to future apps when opening via finder or alfred or commandline
# launchctl setenv PATH ${PATH}

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
fi

## Show me what is listed in my PATH for interactive shells
if [[ "$PROFILE_STARTUP" == true ]]; then
  echo \
    """export -- PATH=${PATH}"""
fi



# https://tanguy.ortolo.eu/blog/article25/shrc

#
# note
#
# Bash
# At startup, depending on the case:
#
# run as a login shell (or with the option --login), it executes profile (or bash_profile instead if it exists (only user-specific version));
# run as an interactive, non-login shell, it executes bashrc (the system-wide version is called bash.bashrc).
# At exit, it executes ~/.bash_logout (the system-wide version is called bash.bash_logout).
#
# Note the funny (read: insane) non-login condition for executing bashrc: it is often worked around by having the profile execute bashrc anyway.
#
# Zsh
# Zsh always executes zshenv. Then, depending on the case:
#
# run as a login shell, it executes zprofile;
# run as an interactive, it executes zshrc;
# run as a login shell, it executes zlogin.
# At the end of a login session, it executes zlogout, but in reverse order,
# the user-specific file first,
# then the system-wide one,
# constituting a chiasmus with the zlogin files.
#

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/gcloud_sdk/path.zsh.inc" ]; then . "${HOME}/gcloud_sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/gcloud_sdk/completion.zsh.inc" ]; then . "${HOME}/gcloud_sdk/completion.zsh.inc"; fi
