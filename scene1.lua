-----------------------------------------------------------------------------------------
--
-- Scene1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

local oldMovieEffect = require('plugin.oldMovieEffect')

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------

local centerX = display.contentCenterX
local centerY = display.contentCenterY
local screenWidth = display.actualContentWidth
local screenHeight = display.actualContentHeight


-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen


------------- old movie effects START -------------

      local shakeGroup = display.newGroup()  --- To use shakeCam you need a display group to shake
      sceneGroup:insert(shakeGroup)

      local shakeOptions = {
        group = shakeGroup, -- shake this group (Required)
        frequency = 1000,   -- in milliseconds (Optional) Default is 1000
        moveX = 2,          -- Move by number of pixels -10 moves it up. Default is 2
        moveY = -10,        -- Move by number of pixels -10 moves it left. Default is -10
        randomness = 16     -- 0 to 20 (0 triggers every time) Default is 16
      }
      oldMovieEffect.shakeCam(shakeOptions) -- Camera shake (shakes a display group to create an old projector feeling)


      -- adds an image to see the effects better
          local image = display.newImageRect("image.jpg", screenWidth, screenHeight )
          image.x = centerX
          image.y = centerY
          shakeGroup:insert(image) -- add the image to tha shakeGroup so the image shakes

      -- one of Coronas fantastic image filters that you find here: https://docs.coronalabs.com/guide/graphics/effects.html
          image.fill.effect = "filter.duotone"
                image.fill.effect.darkColor = { 0.1, 0, 0, 1 }
                image.fill.effect.lightColor = { 1, 0.9, 0.9, 1 }



      local hairOptions = {
        intensity = 300, -- in milliseconds. Default is 300
        frequency = 180, -- in milliseconds. Default is 180
        alpha1 = 0.1,   -- 0 to 1. Default is 0.1
        alpha2 = 0.39,  -- 0 to 1. Default is 0.39
        randomness = 12 -- 0 to 20 (0 triggers every time) Default is 12
      }
      local hair = oldMovieEffect.hair(hairOptions) -- adds hairs and imperfections
      shakeGroup:insert(hair)


      local shadowOptions = {
        intensity = 50, -- in milliseconds. Default is 50
        frequency = 800, -- in milliseconds. Default is 800
        alpha1 = 0.1,   -- 0 to 1. Default is 0.1
        alpha2 = 0.49,  -- 0 to 1. Default is 0.49
        randomness = 8 -- 0 to 20 (0 triggers every time) Default is 8
      }
      local shadow = oldMovieEffect.shadow(shadowOptions) -- adds shadows
      shakeGroup:insert(shadow)


      local stainOptions = {
        intensity = 50, -- in milliseconds. Default is 50
        frequency = 380, -- in milliseconds. Default is 380
        alpha1 = 0,      -- 0 to 1. Default is 0
        alpha2 = 0.2,    -- 0 to 1. Default is 0.2
        randomness = 12 -- 0 to 20 (0 triggers every time) Default is 12
      }
      local stains = oldMovieEffect.stains(stainOptions) -- adds stains
      shakeGroup:insert(stains)


      local frameOptions = {
        intensity = 80, -- in milliseconds. Default is 80
        frequency = 580, -- in milliseconds. Default is 580
        alpha1 = 0.6, -- 0 to 1. Default is 0.6
        alpha2 = 0.65,   -- 0 to 1. Default is 0.65
        randomness = 16 -- 0 to 20 (0 triggers every time) Default is 16
      }
      local frame = oldMovieEffect.frame(frameOptions) -- adds a frame (vignette)
      shakeGroup:insert(frame)


      local linesOptions = {
        intensity = 50, -- in milliseconds. Default is 50
        frequency = 300, -- in milliseconds. Default is 80
        alpha1 = 0.15, -- 0 to 1. Default is 0.15
        alpha2 = 0, -- 0 to 1. Default is 0
        randomness = 10 -- 0 to 20 (0 triggers every time) Default is 18
      }
      local lines = oldMovieEffect.lines(linesOptions) -- adds vertical lines
      shakeGroup:insert(lines)


      --[[
      !!!!!!!!! REMEMBER TO ADD THE FOLLOWING FUNCTION ON SCENE CHANGE !!!!!!!!!

      oldMovieEffect.cleanUp()
      ]]

------------- old movie effects END -------------



end



-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --composer.removeHidden()
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

        oldMovieEffect.cleanUp() -- cleans up the effects


    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
