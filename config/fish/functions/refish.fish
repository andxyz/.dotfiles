# reboot fish shell
function refish
  exec /usr/local/bin/fish --init-command='set -gx TERM xterm-ghostty;' --login --interactive
end
