local Sss = game:GetService("ServerScriptService")
local Utils = require(Sss.Source.Utils.U001GeneralUtils)

local module = {}

function initLetterFall(props)
    local letterFallFolder = Utils.getFirstDescendantByName(workspace,
                                                            "LetterFallFolder")
    local runtimeFolder = Utils.getOrCreateFolder(
                              {
            name = "RuntimeFolder",
            parent = letterFallFolder
        })

    local letterFolder = Utils.getOrCreateFolder(
                             {name = "LetterFolder", parent = runtimeFolder})

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

    local spacingFactor = 1.05
    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Parent = letterFolder

        newColumnBase.Name = "columnBase-" .. colIndex
        newColumnBase.Anchored = true

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

            local handle = Utils.getFirstDescendantByName(newLetter, "Handle")
            local letterAttachment = Utils.getFirstDescendantByName(newLetter,
                                                                    "Att-Handle")
            handle.Name = "letter-" .. char

            letterAttachment.Name = letterAttachment.Name .. "-R" .. rowIndex ..
                                        "-C" .. colIndex

            local y = handle.Size.Y * (rowIndex - 1) * spacingFactor
            handle.CFrame = handle.CFrame * CFrame.new(Vector3.new(0, y, 0))

            local textLabels = Utils.getDescendantsByName(handle, "BlockChar")
            for i, label in ipairs(textLabels) do label.Text = char end
        end
        letterTool:Destroy()
    end
    columnBaseTemplate:Destroy()

end

module.initLetterFall = initLetterFall

return module
