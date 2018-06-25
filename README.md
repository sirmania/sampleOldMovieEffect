# About the plugin

This plugin adds old movie effects to your app like you see [here](https://youtu.be/MF41iBY9io4). Combine the old movie effects with [Corona's image effects](https://docs.coronalabs.com/guide/graphics/effects.html) to create an amazing retro feeling. In the demo video the old movie effects are used together with Corona's duotone effect.
There are 6 different, customizable effects:

1. Camera shake (shakes a display group to create an old projector feeling)
2. Hairs and imperfections
3. Shadows
4. Stains
5. Frame (vignette)
6. Vertical lines
 
---

### Adding the Plugin to your App

1. Activate the plugin at the Corona Marketplace
2. Add an entry into the plugins table of your project's build.settings file.


---

```
settings = {
  ['plugin.oldMovieEffect'] = {publisherId = 'no.dittdesign'},
}

```

---
## Require the plugin


---

```
local oldMovieEffect = require('plugin.oldMovieEffect')

```

---

### Effects
-
 
>####1. Camera shake (shakes a display group to create an old projector feeling)

```
		local shakeOptions = {
  			group = shakeGroup, -- shake this display group (Required)
  			frequency = 1000,   -- in milliseconds (Optional) Default is 1000
  			moveX = 2,          -- Move by number of pixels -10 moves it up. Default is -10
  			moveY = -10,        -- Move by number of pixels -10 moves it left. Default is 2
  			randomness = 16     -- 0 to 20 (0 triggers every time) Default is 16
		}

		oldMovieEffect.shakeCam(shakeOptions)
```


>####2. Hairs and imperfections


```
		local hairOptions = {
		  intensity = 300,  -- in milliseconds. Default is 300
		  frequency = 180,  -- in milliseconds. Default is 180
		  alpha1 = 0.1,     -- 0 to 1. Default is 0.1
		  alpha2 = 0.39,    -- 0 to 1. Default is 0.39
		  randomness = 12   -- 0 to 20 (0 triggers every time) Default is 12
		}

		local hair = oldMovieEffect.hair(hairOptions)
		shakeGroup:insert(hair) -- If you have added the shakeCam and want the effect to shake
```


>####3. Shadows

```
		local shadowOptions = {
		  intensity = 50,   -- in milliseconds. Default is 50
		  frequency = 800,  -- in milliseconds. Default is 800
		  alpha1 = 0.1,     -- 0 to 1. Default is 0.1
		  alpha2 = 0.49,    -- 0 to 1. Default is 0.49
		  randomness = 8    -- 0 to 20 (0 triggers every time) Default is 8
		}

		local shadow = oldMovieEffect.shadow(shadowOptions)
		shakeGroup:insert(shadow) -- If you have added the shakeCam and want the effect to shake
```


>####4. Stains

```
		local stainOptions = {
		  intensity = 50,   -- in milliseconds. Default is 50
		  frequency = 380,  -- in milliseconds. Default is 380
		  alpha1 = 0,       -- 0 to 1. Default is 0
		  alpha2 = 0.2,     -- 0 to 1. Default is 0.2
		  randomness = 12   -- 0 to 20 (0 triggers every time) Default is 12
		}

		local stains = oldMovieEffect.stains(stainOptions)
		shakeGroup:insert(stains) -- If you have added the shakeCam and want the effect to shake
```


>####5. Frame (vignette)

```
		local frameOptions = {
		  intensity = 80,   -- in milliseconds. Default is 80
		  frequency = 580,  -- in milliseconds. Default is 580
		  alpha1 = 0.6,     -- 0 to 1. Default is 0.6
		  alpha2 = 0.65,    -- 0 to 1. Default is 0.65
		  randomness = 16   -- 0 to 20 (0 triggers every time) Default is 16
		}

		local frame = oldMovieEffect.frame(frameOptions)
		shakeGroup:insert(frame) -- If you have added the shakeCam and want the effect to shake
```


>####6. Vertical lines

```
		local linesOptions = {
		  intensity = 100,   -- in milliseconds. Default is 50
		  frequency = 300,   -- in milliseconds. Default is 80
		  alpha1 = 0.15,     -- 0 to 1. Default is 0.15
		  alpha2 = 0,        -- 0 to 1. Default is 0
		  randomness = 10    -- 0 to 20 (0 triggers every time) Default is 18
		}

		local lines = oldMovieEffect.lines(linesOptions)
		shakeGroup:insert(lines) -- If you have added the shakeCam and want the effect to shake
```


>####To clean up the effects, add this function on scene change.

```
		oldMovieEffect.cleanUp()

```


---

### Have fun

You can use one or all of the old movie effects. Remember to try to combine the effects with [Corona's image effects](https://docs.coronalabs.com/guide/graphics/effects.html) to create an amazing retro feeling. 

Here are some image effects from Corona that could be used to age images:

-


```

          image.fill.effect = "filter.bloom"



          image.fill.effect = "filter.brightness"
          image.fill.effect.intensity = 0.4



          image.fill.effect = "filter.colorMatrix"
          image.fill.effect.coefficients =
          {
              0.3, 0, 0, 0,  --red coefficients
              0, 0.9, 0, 0,  --green coefficients
              0, 0, 0.8, 0,  --blue coefficients
              0, 0, 0, 0.8   --alpha coefficients
          }
          image.fill.effect.bias = { 0.6, 0.2, 0.2, 0.6 }



          image.fill.effect = "filter.colorPolynomial"
          image.fill.effect.coefficients =
          {
              0, 0, 1, 0,  --red coefficients
              0, 0, 1, 0,  --green coefficients
              0, 0.6, 0, 0,  --blue coefficients
              1, 1, 1, 1,   --alpha coefficients
          }



          image.fill.effect = "filter.contrast"
          image.fill.effect.contrast = 1.3



          image.fill.effect = "filter.desaturate"
          image.fill.effect.intensity = 0.8



          image.fill.effect = "filter.duotone"
          image.fill.effect.darkColor = { 0.1, 0, 0, 1 }
          image.fill.effect.lightColor = { 1, 0.9, 0.9, 1 }



          image.fill.effect = "filter.exposure"
          image.fill.effect.exposure = 0.9



          image.fill.effect = "filter.grayscale"



          image.fill.effect = "filter.median"



          image.fill.effect = "filter.levels"
          image.fill.effect.white = 1
          image.fill.effect.black = 0.1
          image.fill.effect.gamma = 0.9



          image.fill.effect = "filter.saturate"
          image.fill.effect.intensity = 1.5



          image.fill.effect = "filter.sepia"
          image.fill.effect.intensity = 0.8



          image.fill.effect = "filter.vignette"
          image.fill.effect.radius = 0.1

```


