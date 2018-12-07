#!/usr/bin/env zsh
# set -x
# set -e
#
# I guess one needs to read about the craziness for profiling-zsh-startup-time
#
# https://kev.inburke.com/kevin/profiling-zsh-startup-time/
# https://github.com/raboof/zshprof
#
# cd /Users/andxyz/code/zshprof
# ocamlfind ocamlopt -linkpkg -thread -package str Callgrind.ml ZshXtrace.ml ZshXtraceToCallgrind.ml -o zshprof.bin
# ./zshprof.bin < /tmp/zshprof.57612.log > /tmp/zsh.57612.callgrind
# brew install qcachegrind --with-graphviz
# qcachegrind /tmp/zsh.*.callgrind
#
# a quick check
# time bash -li -c 'echo hi; exit;'
# time zsh -li -c 'echo hi; exit;'

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
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_shell ]]   && source ~/.shell/config_interactive_shell
[ -n "$PS1" ] && [[ -f ~/.shell/config_interactive_private ]] && source ~/.shell/config_interactive_private
[[ -f ~/.shell/config_ssh_agent ]]  && source ~/.shell/config_ssh_agent
[[ -f ~/.shell/aliases ]]           && source ~/.shell/aliases
[[ -f ~/.shell/aliases_private ]]   && source ~/.shell/aliases_private
[[ -f ~/.shell/functions ]]         && source ~/.shell/functions
[[ -f ~/.shell/functions_private ]] && source ~/.shell/functions_private
[[ -f ~/.shell/ruby_rails_tricks.sh ]] && source ~/.shell/ruby_rails_tricks.sh

## for zsh interactive specific
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_interactive ]]     && source ~/.zsh/zsh_interactive
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_completion ]]      && source ~/.zsh/zsh_completion
[ -n "$PS1" ] && [[ -f ~/.zsh/zsh_functions_private ]] && source ~/.zsh/zsh_functions_private

# the following is a mac osx path fix for gifting my path env var to future apps when opening via finder or alfred or commandline
# launchctl setenv PATH $PATH

# Entirety of my startup file... then
if [[ "$PROFILE_STARTUP" == true ]]; then
  unsetopt xtrace
  exec 2>&3 3>&-
fi

echo \
"""export -- PATH=
$PATH"""
