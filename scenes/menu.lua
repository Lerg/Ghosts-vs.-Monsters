local composer = require('composer')
local widget = require('widget')
local sounds = require('libs.sounds')

local _W, _H = display.actualContentWidth, display.actualContentHeight
local _L, _T = display.screenOriginX, display.screenOriginY
local _R, _B = _L + _W, _T + _H
local _CX, _CY = display.contentCenterX, display.contentCenterY

local scene = composer.newScene()

local newLevelSelectionPopup = require('classes.level_selection_popup').newLevelSelectionPopup

function scene:create()
	local group = self.view

	local backgroundImage = display.newImageRect(group, 'images/mainmenu.png', 480, 320)
	backgroundImage.x, backgroundImage.y = _CX, _CY

	-- GHOST
	local ghost = display.newImageRect(group, 'images/menughost.png', 50, 62)
	ghost.x, ghost.y = _CX, _CY + 10

	transition.to(ghost, {time = 2000, y = _CY + 40, iterations = 0, transition = easing.continuousLoop})

	local playButton = widget.newButton({
		defaultFile = 'images/buttons/play.png',
		overFile = 'images/buttons/play-over.png',
		width = 146, height = 116,
		x = 320, y = _B + 116,
		onRelease = function()
			sounds.play('tap')
			local popup = newLevelSelectionPopup(group)
			popup.x, popup.y = _CX, -popup.height
			transition.to(popup, {time = 200, y = _CY})
		end
	})
	playButton.anchorX, playButton.anchorY = 0.5, 1
	group:insert(playButton)

	transition.to(playButton, {time = 800, y = _B, transition = easing.inExpo, onComplete = function(object)
		transition.to(object, {time = 800, x = 50, delta = true, transition = easing.outExpo})
	end})

	sounds.playStream('rainsound')
end

scene:addEventListener('create')

return scene
