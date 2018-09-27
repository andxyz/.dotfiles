-- http://www.hammerspoon.org/docs/hs.spotify.html#playpause
-- http://www.hammerspoon.org/go/
-- https://www.hammerspoon.org/docs/hs.keycodes.html

hs.hotkey.bind({"cmd", "alt"}, "home", function()
  hs.spotify.playpause()
end)

hs.hotkey.bind({"cmd", "alt"}, "pageup", function()
  hs.spotify.previous()
end)

hs.hotkey.bind({"cmd", "alt"}, "pagedown", function()
  hs.spotify.next()
end)
