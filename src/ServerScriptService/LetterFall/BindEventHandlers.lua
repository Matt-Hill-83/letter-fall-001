local ReplicatedStorage = game:GetService("ReplicatedStorage")

local module = {}
function module.bindClickBlock()
    local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEventTest")
    local function onCreatePart(player) end
    remoteEvent.OnServerEvent:Connect(onCreatePart)
end

return module
