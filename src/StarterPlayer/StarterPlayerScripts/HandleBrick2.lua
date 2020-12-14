local module = {}

local Sss = game:GetService("ServerScriptService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local CS = game:GetService("CollectionService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")
local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEventTest")

function isDesiredLetter(letter, clickedLetter)
    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    return letter.found ~= true and letter.char == textLabel
end

function isWordComplete(wordLetters)

    for i, word in ipairs(wordLetters) do
        if not word.found then
            -- 
            return false
        end
    end
    return true
end

function handleBrick(props)
    local player = props.player
    local clickedLetter = props.letterBlock
    local wordLetters = LetterFall.getWordLetters()

    print('clickedLetter' .. ' - start');
    print(clickedLetter);
    print('clickedLetter' .. ' - end');

    for i, letter in ipairs(wordLetters) do
        print('letter' .. ' - start----------------');
        print(letter);
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true

            LetterFall.colorLetterText({
                letterBlock = letter.instance,
                color = Color3.new(255, 0, 191)
            })

            clickedLetter:Destroy()
            local wordComplete = isWordComplete(wordLetters)
            if wordComplete then
                LetterFall.lastWordIndex = LetterFall.lastWordIndex + 1
                LetterFall.initWord()
                print('wordComplete' .. ' ------------------------ start');
                print(wordComplete);
            end
            break
        end

    end

end

-- Create a new part
local function onCreatePart(player)
    print(player.Name .. " fired the remote event")
    -- local newPart = Instance.new("Part")
    -- newPart.BrickColor = partColor
    -- newPart.Position = partPos
    -- newPart.Parent = workspace
end

print('remoteEvent' .. ' - start');
print(remoteEvent);
print('remoteEvent' .. ' - end');
-- Call "onCreatePart()" when the client fires the remote event
-- remoteEvent.OnServerEvent:Connect(handleBrick)
remoteEvent.OnServerEvent:Connect(onCreatePart)

module.onCreatePart = onCreatePart
return module
