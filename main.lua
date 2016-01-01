--
-- Abstract: Ghosts Vs Monsters sample project
-- Designed and created by Jonathan and Biffy Beebe of Beebe Games exclusively for Ansca, Inc.
-- http://beebegamesonline.appspot.com/
--
-- Remastered version

-- Version: 2.0
--
-- Sample code is MIT licensed, see http://developer.anscamobile.com/code/license
-- Copyright (C) 2010 ANSCA Inc. All Rights Reserved.

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- Fix
easing.continuousLoop = function(t, tMax, start, delta)
	local interval = t / tMax
	if interval < 0.5 then
		return start + delta * interval * 2
	else
		return start + delta * (1 - interval) * 2
	end
end

local composer = require('composer')
composer.recycleOnSceneChange = true
composer.setVariable('levelCount', 2)

local sounds = require('libs.sounds')
sounds.isSoundOn = true
sounds.isMusicOn = true

-- TODO: add loading.png
-- Load and show Main Menu scene
composer.gotoScene('scenes.menu')
