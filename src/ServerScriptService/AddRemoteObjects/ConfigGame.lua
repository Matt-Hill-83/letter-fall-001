local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local collectionService = game:GetService("CollectionService")

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
    local testLabBase = Utils.getFirstDescendantByName(workspace, "TestLabBase")
    testLabBase:Destroy()

    local taggedPartsTransparent = collectionService:GetTagged("Transparent")

    for i, item in ipairs(taggedPartsTransparent) do
        Utils.setItemAndChildrenPropsByInst(
            {
                item = item,
                props = {Transparency = 1, CanCollide = false, Anchored = true}
            })
    end

    local itemsToHideAtRuntine = {'QuestsOrigin', 'TerrainBase'}
    for i, item in ipairs(itemsToHideAtRuntine) do
        Utils.hideItemAndChildrenByName({name = item, hide = true})
    end

    Utils.setItemAndChildrenPropsByName({
        name = "DockWalls",
        props = {Transparency = 1}
    })

end
function module.configGame()
    -- setVisibility()
    -- configPlayers()
end

return module
