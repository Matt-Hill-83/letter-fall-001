local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.LetterFall.Utils)

local CS = game:GetService("CollectionService")

local module = {}
function configPlayers()
    local Players = game:GetService("Players")
    Players.RespawnTime = 0

    local function onCharacterAdded(character)
        character:WaitForChild("Humanoid").WalkSpeed = 30
    end

    local function onPlayerAdded(player)
        player.CharacterAdded:Connect(onCharacterAdded)
    end

    Players.PlayerAdded:Connect(onPlayerAdded)

end

function setVisibility()
    Utils.setPropsByTag({tag = "Transparent", props = {Transparency = 1}})
end

function module.configGame()
    setVisibility()
    configPlayers()
end

return module
