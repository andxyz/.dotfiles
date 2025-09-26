function zln
  set session_name (basename (pwd))

  set session_exists (zellij list-sessions | grep -w $session_name)

  if test -z "$session_exists"
    echo "Session '$session_name' does not exist. Creating a new session..."
    zellij attach --create $session_name
  else
    zellij attach $session_name
  end
end
