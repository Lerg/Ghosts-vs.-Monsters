local composer = require('composer')

local _W, _H = display.actualContentWidth, display.actualContentHeight
local _L, _T = display.screenOriginX, display.screenOriginY
local _R, _B = _L + _W, _T + _H
local _CX, _CY = display.contentCenterX, display.contentCenterY

local scene = composer.newScene()

function scene:create()
    local loadingImage = display.newImageRect(self.view, 'images/loading.png', 480, 320)
    loadingImage.x, loadingImage.y = _CX, _CY
end

function scene:show(event)
    if event.phase == 'will' then
        composer.loadScene('scenes.game', {params = event.params})
    elseif event.phase == 'did' then
        timer.performWithDelay(500, function()
            composer.gotoScene('scenes.game', {params = event.params})
        end)
    end
end

scene:addEventListener('create')
scene:addEventListener('show')

return scene
