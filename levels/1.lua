local _M = {}

local levelObjects = require('classes.level_objects')

function _M.build(onMonsterPostCollision)
    local levelGroup = display.newGroup()
    local monsterCount = 2

    -- FIRST VERTICAL SLAB
    local vSlab1 = display.newImageRect( 'images/vertical-stone.png', 28, 58 )
    vSlab1.x = 600; vSlab1.y = 215
    vSlab1.myName = 'stone'

    physics.addBody( vSlab1, 'dynamic', { density=levelObjects.stoneDensity, bounce=0, friction=0.5, shape=levelObjects.vSlabShape } )
    levelGroup:insert( vSlab1 )

    -- SECOND VERTICAL SLAB
    local vSlab2 = display.newImageRect( 'images/vertical-stone.png', 28, 58 )
    vSlab2.x = 646; vSlab2.y = 215
    vSlab2.myName = 'stone'

    physics.addBody( vSlab2, 'dynamic', { density=levelObjects.stoneDensity, bounce=0, friction=0.5, shape=levelObjects.vSlabShape } )
    levelGroup:insert( vSlab2 )

    -- FIRST VERTICAL PLANK
    local vPlank1 = display.newImageRect( 'images/vertical-wood.png', 14, 98 )
    vPlank1.x = 623; vPlank1.y = 215
    vPlank1.myName = 'wood'

    physics.addBody( vPlank1, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.vPlankShape } )
    levelGroup:insert( vPlank1 )

    -- SECOND VERTICAL PLANK
    local vPlank2 = display.newImageRect( 'images/vertical-wood.png', 14, 98 )
    vPlank2.x = 723; vPlank2.y = 215
    vPlank2.myName = 'wood'

    physics.addBody( vPlank2, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.vPlankShape } )
    levelGroup:insert( vPlank2 )

    -- THIRD VERTICAL PLANK
    local vPlank3 = display.newImageRect( 'images/vertical-wood.png', 14, 98 )
    vPlank3.x = 821; vPlank3.y = 215
    vPlank3.myName = 'wood'

    physics.addBody( vPlank3, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.vPlankShape } )
    levelGroup:insert( vPlank3 )

    -- SECOND VERTICAL SLAB STACK
    local vSlab3 = display.newImageRect( 'images/vertical-stone.png', 28, 58 )
    vSlab3.x = 800; vSlab3.y = 215
    vSlab3.myName = 'stone'

    physics.addBody( vSlab3, 'dynamic', { density=levelObjects.stoneDensity, bounce=0, friction=0.5, shape=levelObjects.vSlabShape } )
    levelGroup:insert( vSlab3 )

    local vSlab4 = display.newImageRect( 'images/vertical-stone.png', 28, 58 )
    vSlab4.x = 843; vSlab4.y = 215
    vSlab4.myName = 'stone'

    physics.addBody( vSlab4, 'dynamic', { density=levelObjects.stoneDensity, bounce=0, friction=0.5, shape=levelObjects.vSlabShape } )
    levelGroup:insert( vSlab4 )

    -- HORIZONTAL PLANK 1
    local hPlank1 = display.newImageRect( 'images/horizontal-wood.png', 98, 14 )
    hPlank1.x = 674; hPlank1.y = 162
    hPlank1.myName = 'wood'

    physics.addBody( hPlank1, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.hPlankShape } )
    levelGroup:insert( hPlank1 )

    -- HORIZONTAL PLANK 2
    local hPlank2 = display.newImageRect( 'images/horizontal-wood.png', 98, 14 )
    hPlank2.x = 772; hPlank2.y = 162
    hPlank2.myName = 'wood'

    physics.addBody( hPlank2, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.hPlankShape } )
    levelGroup:insert( hPlank2 )

    local hPlank4 = display.newImageRect( 'images/horizontal-wood.png', 98, 14 )
    hPlank4.x = 723; hPlank4.y = 143
    hPlank4.myName = 'wood'

    physics.addBody( hPlank4, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.hPlankShape } )
    levelGroup:insert( hPlank4 )

    -- TOP TOMBSTONES
    local tombStone1 = display.newImageRect( 'images/tombstone.png', 38, 46 )
    tombStone1.x = 650; tombStone1.y = 128
    tombStone1.myName = 'tomb'

    physics.addBody( tombStone1, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.tombShape } )
    levelGroup:insert( tombStone1 )

    local tombStone2 = display.newImageRect( 'images/tombstone.png', 38, 46 )
    tombStone2.x = 796; tombStone2.y = 128
    tombStone2.myName = 'tomb'

    physics.addBody( tombStone2, 'dynamic', { density=levelObjects.woodDensity, bounce=0, friction=0.5, shape=levelObjects.tombShape } )
    levelGroup:insert( tombStone2 )

    -- MONSTERS
    local monster1 = display.newImageRect( 'images/monster.png', 26, 30 )
    monster1.x = 745; monster1.y = 125
    monster1.myName = 'monster'
    monster1.isHit = false

    physics.addBody( monster1, 'dynamic', { density=levelObjects.monsterDensity, bounce=0, friction=0.5, shape=levelObjects.monsterShape } )
    levelGroup:insert( monster1 )

    monster1.postCollision = onMonsterPostCollision
    monster1:addEventListener( 'postCollision', monster1 )

    local monster2 = display.newImageRect( 'images/monster.png', 26, 30 )
    monster2.x = 700; monster2.y = 125
    monster2.myName = 'monster'
    monster2.isHit = false

    monster2.postCollision = onMonsterPostCollision
    monster2:addEventListener( 'postCollision', monster2 )

    physics.addBody( monster2, 'dynamic', { density=levelObjects.monsterDensity, bounce=0, friction=0.5, shape=levelObjects.monsterShape } )
    levelGroup:insert( monster2 )

    return levelGroup, monsterCount
end

return _M
