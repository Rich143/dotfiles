hs.loadSpoon("ShiftIt")
spoon.ShiftIt:bindHotkeys(
{
  left = {{'alt'}, 'left' },
  right = {{'alt'}, 'right' },
  up = {{'alt'}, 'up' },
  down = {{'alt'}, 'down' },
  upleft = {{'alt'}, '1' },
  upright = {{'alt'}, '2' },
  botleft = {{'alt'}, '3' },
  botright = {{'alt'}, '4' },
  maximum = {{'alt'}, 'm' },
  toggleFullScreen = {{'alt'}, 'f' },
  toggleZoom = {{'alt'}, 'z' },
  center = {{'alt'}, 'c' },
  nextScreen = {{'alt'}, 'n' },
  previousScreen = {{'alt'}, 'p' },
  resizeOut = {{'alt'}, '=' },
  resizeIn = {{'alt'}, '-' }
}
)

-- Move to thirds of screen
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 3)
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + 2 * (max.w / 3)
  f.y = max.y
  f.w = max.w / 3
  f.h = max.h
  win:setFrame(f)
end)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
  hs.reload()
end)
hs.alert.show("Config loaded")
