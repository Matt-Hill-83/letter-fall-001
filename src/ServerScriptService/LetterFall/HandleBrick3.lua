local module = {}
local Sss = game:GetService("ServerScriptService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local TargetWord = require(Sss.Source.LetterFall.TargetWord)
local Utils = require(Sss.Source.LetterFall.Utils)

local CS = game:GetService("CollectionService")

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = ReplicatedStorage:WaitForChild("ClickBlockRE")

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

function module.initClickHandler(player, clickedLetter)
    remoteEvent.OnServerEvent:Connect(handleBrick)
end

function handleBrick(player, clickedLetter)
    local wordLetters = LetterFall.wordLetters

    local part = CS:GetTagged("BallPitBottom")
    if part[1] then part[1]:Destroy() end

    for i, letter in ipairs(wordLetters) do
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true

            LetterFall.colorLetterText({
                letterBlock = letter.instance,
                color = Color3.fromRGB(113, 17, 161)
            })

            clickedLetter:Destroy()
            local wordComplete = isWordComplete(wordLetters)
            if wordComplete then
                LetterFall.lastWordIndex = LetterFall.lastWordIndex + 1
                TargetWord.initWord()
            end
            break
        end
    end
end

return module
