-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- include the Corona "storyboard" module (this is of course optional)
local composer = require( "composer" )

-- load scene1 where the old movie effect is used
composer.gotoScene( "scene1" )
