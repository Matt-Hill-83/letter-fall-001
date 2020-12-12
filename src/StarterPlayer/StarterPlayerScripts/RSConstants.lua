local module = {
    buffer = 0,
    -- singleScene = true,
    singleScene = false,
    -- 
    entered = {value = false},
    baseWallHeight = 16,
    walkSpeed = 16,
    questWallHeight = 24,
    sceneHeight = 50
    -- 
}

module.dialogColors = {
    Color3.fromRGB(253, 158, 240), Color3.fromRGB(225, 253, 158),
    Color3.fromRGB(253, 228, 158), Color3.fromRGB(158, 253, 179),
    Color3.fromRGB(158, 215, 253)
}

local islandLength = 36
-- local bridgeLength = 31.1
-- local bridgeLength = 34
local bridgeBaseLength = 30
-- local bridgeBaseLength = 96
local bridgeOverlap = 2
local bridgeLength = bridgeBaseLength - 2 * bridgeOverlap

module.islandLength = islandLength
module.bridgeLength = bridgeLength
module.totalIslandLength = islandLength + bridgeLength

module.buttonLabels = {PrevPage = "Prev Page", NextPage = "Next Page"}

local raven = {
    displayName = "Raven",
    decalId = '5897424121',
    backgroundColorIdx = 1
}
local britta = {
    displayName = "Britta",
    decalId = '5897433108',
    backgroundColorIdx = 2
}

local mitzy02 = {
    displayName = "Mitzy Meow",
    decalId = '5976876671',
    backgroundColorIdx = 2
}

local vulcan = {
    displayName = "Vulcan",
    decalId = '5999464799',
    backgroundColorIdx = 1
}

module.characters = {

    raven05 = raven,
    raven04 = raven,
    raven = raven,
    britta = britta,
    britta01 = britta,
    britta04 = britta,

    fancyDudeFromFrance01 = {
        displayName = "fancyDudeFromFrance01",
        decalId = '5991276655',
        backgroundColorIdx = 1
    },
    goat01 = {
        displayName = "Goat",
        decalId = '6063417478',
        backgroundColorIdx = 1
    },
    robby01 = {
        displayName = "Robby",
        decalId = '5991273473',
        backgroundColorIdx = 1
    },
    waterfall = {
        displayName = "Waterfall",
        decalId = '5991339525',
        backgroundColorIdx = 1
    },
    cave = {
        displayName = "Cave",
        decalId = '5991342911',
        backgroundColorIdx = 1
    },
    hill = {
        displayName = "Hill",
        decalId = '5991342052',
        backgroundColorIdx = 1
    },
    lake = {
        displayName = "Lake",
        decalId = '5991341377',
        backgroundColorIdx = 1
    },
    log = {displayName = "Log", decalId = '5991341326', backgroundColorIdx = 1},
    pond = {
        displayName = "Pond",
        decalId = '5991340703',
        backgroundColorIdx = 1
    },
    pool = {
        displayName = "Pool",
        decalId = '5991340615',
        backgroundColorIdx = 1
    },
    swamp = {
        displayName = "Swamp",
        decalId = '5991343667',
        backgroundColorIdx = 1
    },
    bees = {
        displayName = "Bees",
        decalId = '5991343806',
        backgroundColorIdx = 1
    },
    cap = {displayName = "Cap", decalId = '5991343197', backgroundColorIdx = 1},
    castle = {
        displayName = "Castle",
        decalId = '5991343060',
        backgroundColorIdx = 1
    },
    chick01 = {
        displayName = "Chick",
        decalId = '6060376973',
        backgroundColorIdx = 1
    },
    coop = {
        displayName = "Coop",
        decalId = '5991342867',
        backgroundColorIdx = 1
    },
    cow01 = {
        displayName = "Cow",
        decalId = '6060376567',
        backgroundColorIdx = 1
    },
    girl09 = {
        displayName = "Girl",
        decalId = '5991275978',
        backgroundColorIdx = 1
    },
    lucky = {
        displayName = "Lucky",
        decalId = '5977954909',
        backgroundColorIdx = 3
    },
    lucky01 = {
        displayName = "Lucky",
        decalId = '5977954909',
        backgroundColorIdx = 3
    },
    mat = {displayName = "Mat", decalId = '5991341059', backgroundColorIdx = 1},
    mop = {displayName = "Mop", decalId = '5991340991', backgroundColorIdx = 1},
    pan = {displayName = "Pan", decalId = '5991340855', backgroundColorIdx = 1},
    slide = {
        displayName = "Slide",
        decalId = '5991340411',
        backgroundColorIdx = 1
    },
    swing = {
        displayName = "Swing",
        decalId = '5991340158',
        backgroundColorIdx = 1
    },

    stump = {
        displayName = "Stump",
        decalId = '5991340320',
        backgroundColorIdx = 1
    },
    bog = {displayName = "Bog", decalId = '5991343667', backgroundColorIdx = 1},
    home = {
        displayName = "Home",
        decalId = '5991341898',
        backgroundColorIdx = 1
    },
    bee = {displayName = "Bee", decalId = '5999465084', backgroundColorIdx = 1},
    elf = {displayName = "Elf", decalId = '5991266909', backgroundColorIdx = 4},
    bun = {displayName = "Bun", decalId = '5991343501', backgroundColorIdx = 1},
    dog01 = {
        displayName = "Dog",
        decalId = '5999464941',
        backgroundColorIdx = 1
    },
    dennisTheMenace = {
        displayName = "Dennis the Menace",
        decalId = '5999464873',
        backgroundColorIdx = 1
    },
    katieKooper01 = {
        displayName = "Katie Kooper",
        decalId = '5991267836',
        backgroundColorIdx = 1
    },
    troll01 = {
        displayName = "Troll01",
        decalId = '5999464489',
        backgroundColorIdx = 1
    },
    troll02 = {
        displayName = "Troll02",
        decalId = '5999464489',
        backgroundColorIdx = 3
    },
    rori = {
        displayName = "Rori",
        decalId = '5991267444',
        backgroundColorIdx = 4
    },
    vulcan = vulcan,
    vulcan01 = vulcan,

    -- 
    -- 
    -- 
    luke01 = {
        displayName = "Luke",
        decalId = '5998961085',
        backgroundColorIdx = 2
    },
    hudson01 = {
        displayName = "Hudson",
        decalId = '5998961874',
        backgroundColorIdx = 4
    },
    trollKing01 = {
        displayName = "Troll King",
        decalId = '5897428591',
        backgroundColorIdx = 3
    },
    trollKing = {
        displayName = "Troll King",
        decalId = '5897428591',
        backgroundColorIdx = 3
    },
    freckle = {
        displayName = "Freckle",
        decalId = '5897430768',
        backgroundColorIdx = 3
    },
    missyMeow01 = {
        displayName = "Missy Meow",
        decalId = '5898504226',
        backgroundColorIdx = 1
    },
    mitzyMeow01 = mitzy02,
    mitzy02 = mitzy02,
    kat = {displayName = "Kat", decalId = '5977951764', backgroundColorIdx = 3},
    liz2 = {displayName = "Liz", decalId = '5981806423', backgroundColorIdx = 2}
}

return module
