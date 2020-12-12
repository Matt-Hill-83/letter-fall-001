local module = {}
local Sss = game:GetService("ServerScriptService")

local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)

function addRemoteObjects()
    ConfigGame.configGame()

    -- 
end

module.addRemoteObjects = addRemoteObjects
return module

