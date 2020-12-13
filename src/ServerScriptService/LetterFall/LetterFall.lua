local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function anchorLetters()
    local letterFolder = getLetterFolder()
    local newLetters =
        Utils.getDescendantsByNameMatch(letterFolder, "newLetter")

    for i, letter in ipairs(newLetters) do
        print(letter.Name);
        letter.Anchored = true
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

    local numRow = 6
    local numCol = 8

    local letters = {'C', 'A', 'T'}

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }

    function genRandom(min, max) return min + math.random() * (max - min) end

    local columnBaseTemplate = Utils.getFirstDescendantByName(letterFallFolder,
                                                              "ColumnBase")

    local newLetters = {}
    local spacingFactor = 1.05
    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Parent = letterFolder
        newColumnBase.Name = "columnBase-" .. colIndex

        local columnAttachment = Utils.getFirstDescendantByName(newColumnBase,
                                                                "Att-ColumnBase")
        columnAttachment.Name = columnAttachment.Name .. "-C" .. colIndex

        local z = newColumnBase.Size.Z * (colIndex - 1) * spacingFactor
        newColumnBase.CFrame = newColumnBase.CFrame *
                                   CFrame.new(Vector3.new(0, 0, z))

        local letterTool = Utils.getFirstDescendantByName(newColumnBase,
                                                          "LetterTool")

        for rowIndex = 1, numRow do
            local char = letters[(colIndex % #letters) + 1]
            local test = genRandom(1, 26)
            local newLetter = letterTool:Clone()
            newLetter.Parent = newColumnBase

            local letterAttachment = Utils.getFirstDescendantByName(newLetter,
                                                                    "Att-Handle")
            newLetter.Name = "newLetter-" .. char

            letterAttachment.Name = letterAttachment.Name .. "-R" .. rowIndex ..
                                        "-C" .. colIndex

            local y = newLetter.Size.Y * (rowIndex - 1) * spacingFactor
            newLetter.CFrame = newLetter.CFrame *
                                   CFrame.new(Vector3.new(0, y, 0))

            local textLabels =
                Utils.getDescendantsByName(newLetter, "BlockChar")
            for i, label in ipairs(textLabels) do label.Text = char end
            table.insert(newLetters, newLetter)
        end
        letterTool:Destroy()
    end
    columnBaseTemplate:Destroy()
    -- initWord()
end

function initWord(props)
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local letterFolder = getLetterFolder()

    local word = {'C', 'A', 'T'}

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }

    function genRandom(min, max) return min + math.random() * (max - min) end

    local letterRack = Utils.getFirstDescendantByName(letterFallFolder,
                                                      "LetterRack")

    local letterBlock =
        Utils.getFirstDescendantByName(letterRack, "LetterBlock")

    local newLetters = {}
    local spacingFactor = 1.05

    for letterIndex, letter in ipairs(word) do
        print('letter' .. ' - start');
        print(letter);
        print('letter' .. ' - end');
        local newLetter = letterBlock:Clone()
        newLetter.Parent = letterFolder
        newLetter.Name = "wordLetter-" .. letterIndex
        local z = newLetter.Size.Z * (letterIndex - 1) * spacingFactor
        newLetter.CFrame = newLetter.CFrame * CFrame.new(Vector3.new(0, 0, z))

        local textLabels = Utils.getDescendantsByName(newLetter, "BlockChar")
        for i, label in ipairs(textLabels) do
            label.Text = letter
            label.TextColor3 = Color3.new(117, 85, 255)
            -- 
        end

    end
    letterBlock:Destroy()

end

module.initLetterRack = initLetterRack
module.initWord = initWord
module.anchorLetters = anchorLetters

return module
