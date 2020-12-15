local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)
local CS = game:GetService("CollectionService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

local module = {}

function getWordFolder()
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    return (Utils.getOrCreateFolder({
        name = "WordFolder",
        parent = runtimeFolder
    }))
end

function initWord(props)
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local wordFolder = getWordFolder()
    local word = LetterFall.words[LetterFall.lastWordIndex]

    for i, letter in ipairs(LetterFall.wordLetters) do
        if letter.instance then letter.instance:Destroy() end
        LetterFall.wordLetters[i] = nil
    end
    Utils.clearTable(LetterFall.wordLetters)

    function genRandom(min, max) return min + math.random() * (max - min) end

    local wordBox = Utils.getFirstDescendantByName(letterFallFolder, "WordBox")
    local letterBlock = Utils.getFirstDescendantByName(wordBox,
                                                       "LetterBlockTemplate")

    local letterPositioner = Utils.getFirstDescendantByName(wordBox,
                                                            "LetterPositioner")

    local spacingFactor = 1.05

    for letterIndex, letter in ipairs(word) do
        local newLetter = letterBlock:Clone()
        newLetter.Parent = wordFolder
        newLetter.Name = "wordLetter-" .. letterIndex
        local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
        newLetter.CFrame = letterPositioner.CFrame *
                               CFrame.new(Vector3.new(0, 0, z))

        CS:AddTag(newLetter, Constants.tagNames.WordLetter)

        LetterFall.applyLetterText({letterBlock = newLetter, char = letter})
        LetterFall.colorLetterText({
            letterBlock = newLetter,
            color = Color3.new(255, 0, 191)
        })

        table.insert(LetterFall.wordLetters,
                     {char = letter, found = false, instance = newLetter})
    end
end

module.initWord = initWord
module.getWordFolder = getWordFolder

return module
