local UserInputService = game:GetService("UserInputService")
local CS = game:GetService("CollectionService")
local RS = game:GetService("ReplicatedStorage")
local remoteEvent2 = RS:WaitForChild("ClickBlockRE")

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local MAX_RAY_LENGTH = 5000

local function onInputBegan(input, gameProcessed)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        local raycastParams = RaycastParams.new()
        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
        raycastParams.FilterDescendantsInstances = CS:GetTagged("IgnoreClick")
        raycastParams.IgnoreWater = true
        local raycastResult = workspace:Raycast(mouse.UnitRay.Origin,
                                                mouse.UnitRay.Direction *
                                                    MAX_RAY_LENGTH,
                                                raycastParams)
        if raycastResult then
            local hitObject = raycastResult.Instance
            if CS:HasTag(hitObject, "LetterBlockInRack") then
                print("--------------------------->>" .. hitObject.Name)
                remoteEvent2:FireServer(hitObject)
            end
        else
            print("Nothing was hit!")
        end
    end
end
UserInputService.InputBegan:Connect(onInputBegan)
