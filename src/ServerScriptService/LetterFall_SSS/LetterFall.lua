local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.LetterFall_SSS.Utils)
local CS = game:GetService("CollectionService")

local module = {
    wordLetters = {},
    words = {
        {'C', 'A', 'T'}, {'B', 'A', 'T'}, {'H', 'A', 'T'}, {'M', 'A', 'T'},
        {'P', 'A', 'T'}, {'R', 'A', 'T'}, {'S', 'A', 'T'}
    },
    lastWordIndex = 1,
    tagNames = {WordLetter = "WordLetter", LetterBlock = "LetterBlock"}
}

function colorLetterText(props)
    local color = props.color
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do
        label.TextColor3 = color or Color3.new(255, 0, 191)

    end
end

function applyLetterText(props)
    local char = props.char
    local letterBlock = props.letterBlock

    local textLabels = Utils.getDescendantsByName(letterBlock, "BlockChar")
    for i, label in ipairs(textLabels) do label.Text = char end
end

function createBalls(props)
    local ball = CS:GetTagged("FluidBall")
    if ball[1] then
        for count = 1, 10 do
            local newBall = ball[1]:Clone()
            newBall.Parent = workspace
            newBall.CFrame = newBall.CFrame + Vector3.new(0.1, 1, 0.1)
        end
    end
end

function getLetterFolder()
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    local letterFolder = Utils.getOrCreateFolder(
                             {name = "LetterFolder", parent = runtimeFolder})
    return letterFolder
end

function initLetterRack(props)
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local letterFolder = getLetterFolder()

    local numRow = 18
    local numCol = 8

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }
    local lettersFromWords = {}
    for wordIndex, word in ipairs(module.words) do
        for letterIndex, letter in ipairs(word) do
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            table.insert(lettersFromWords, letter)
            -- 
        end
    end

    function genRandom(min, max)
        local rand = min + math.random() * (max - min)
        return math.ceil(rand)
    end

    local columnBaseTemplates = CS:GetTagged("ColumnBaseTemplate")
    local columnBaseTemplate = columnBaseTemplates[1]

    local newLetters = {}
    local spacingFactor = 1.08
    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Parent = letterFolder
        newColumnBase.Name = "columnBase-" .. colIndex

        local z = newColumnBase.Size.Z * (colIndex - 1) * spacingFactor
        local letterPositioner = CS:GetTagged("RackLetterBlockPositioner")

        if letterPositioner and letterPositioner[1] then
            newColumnBase.CFrame = letterPositioner[1].CFrame *
                                       CFrame.new(Vector3.new(-z, 0, 0))
        end

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")

        for rowIndex = 1, numRow do
            -- local char = letters[(colIndex % #letters) + 1]
            local test = genRandom(1, #lettersFromWords)
            local char = lettersFromWords[test]

            local newLetter = letterTemplate:Clone()
            newLetter.Parent = newColumnBase

            newLetter.Name = "newLetter-" .. char
            CS:AddTag(newLetter, module.tagNames.LetterBlock)

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            newLetter.CFrame = newLetter.CFrame *
                                   CFrame.new(Vector3.new(0, y, 0))

            applyLetterText({letterBlock = newLetter, char = char})
            table.insert(newLetters, newLetter)
        end
        letterTemplate:Destroy()
    end
    -- columnBaseTemplate:Destroy()
end

module.colorLetterText = colorLetterText
module.createBalls = createBalls
module.initLetterRack = initLetterRack
module.applyLetterText = applyLetterText

return module
