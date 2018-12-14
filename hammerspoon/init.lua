-- http://www.hammerspoon.org/go/
-- https://www.hammerspoon.org/docs/hs.keycodes.html
-- http://www.hammerspoon.org/docs/hs.spotify.html#playpause

--
-- Spotify commands
--

hs.hotkey.bind({"cmd", "ctrl"}, "home", function()
  hs.spotify.playpause()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "pageup", function()
  hs.spotify.previous()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "pagedown", function()
  hs.spotify.next()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Left", function()
  hs.spotify.rw()
end)

hs.hotkey.bind({"cmd", "ctrl"}, "Right", function()
  hs.spotify.ff()
end)

--
-- Change Volume commands
--

function changeVolume(diff)
  return function()
    local current = hs.audiodevice.defaultOutputDevice():volume()
    local new = math.min(100, math.max(0, math.floor(current + diff)))
    if new > 0 then
      hs.audiodevice.defaultOutputDevice():setMuted(false)
    end
    hs.alert.closeAll(0.0)
    hs.alert.show("Volume " .. new .. "%", {}, 0.5)
    hs.audiodevice.defaultOutputDevice():setVolume(new)
  end
end

hs.hotkey.bind({'cmd', 'ctrl'}, 'Down', changeVolume(-3))
hs.hotkey.bind({'cmd', 'ctrl'}, 'Up', changeVolume(3))
