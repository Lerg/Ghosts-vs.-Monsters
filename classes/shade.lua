local _M = {}

local _W, _H = display.actualContentWidth, display.actualContentHeight
local _L, _T = display.screenOriginX, display.screenOriginY
local _R, _B = _L + _W, _T + _H
local _CX, _CY = display.contentCenterX, display.contentCenterY

function _M.newShade(group)
	local shade = display.newRect(group, _CX, _CY, _W, _H)
	shade:setFillColor(0)
	shade.alpha = 0
	transition.to(shade, {time = 200, alpha = 0.75})

	function shade:tap()
		return true
	end
	shade:addEventListener('tap')

	function shade:touch()
		return true
	end
	shade:addEventListener('touch')

	return shade
end

return _M
