local _M = {}

local composer = require('composer')
local widget = require('widget')
local sounds = require('libs.sounds')

local newShade = require('classes.shade').newShade

function _M.newLevelSelectionPopup(group)
	local shade = newShade(group)

	local popup = display.newGroup()
	group:insert(popup)

	local backgroundImage = display.newImageRect(popup, 'images/levelselection.png', 328, 194)

	local function onLevelButtonRelease(event)
		sounds.play('tap')
		composer.gotoScene('scenes.reloadgame', {params = event.target.id})
	end

	for i = 1, composer.getVariable('levelCount') do
		local levelButton = widget.newButton({
			id = i,
			defaultFile = 'images/buttons/level' .. i .. '.png',
			overFile = 'images/buttons/level' .. i .. '-over.png',
			width = 114, height = 114,
			x = 74 * ((i - 1) * 2 - 1), y = 16,
			onRelease = onLevelButtonRelease
		})
		popup:insert(levelButton)
	end

	local closeButton = widget.newButton({
		defaultFile = 'images/buttons/close.png',
		overFile = 'images/buttons/close-over.png',
		width = 44, height = 44,
		x = backgroundImage.width / 2, y = -backgroundImage.height / 2,
		onRelease = function()
			sounds.play('tap')
			shade:removeSelf()
			popup:removeSelf()
		end
	})
	popup:insert(closeButton)

	return popup
end

return _M
