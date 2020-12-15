local module = {}

local Sss = game:GetService("ServerScriptService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local CS = game:GetService("CollectionService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
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

function handleBrick(player, clickedLetter)
    local wordLetters = LetterFall.getWordLetters()

    local part = CS:GetTagged("BallPitBottom")
    if part[1] then part[1]:Destroy() end
    -- LetterFall.anchorLetters()

    for i, letter in ipairs(wordLetters) do
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
            end
            break
        end

    end

end

remoteEvent.OnServerEvent:Connect(handleBrick)

return module
