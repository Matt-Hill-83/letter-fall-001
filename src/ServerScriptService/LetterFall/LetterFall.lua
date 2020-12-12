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

    local numRow = 6
    local numCol = 6

    local letters = {'C', 'A', 'T'}

    local allLetters = {
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N',
        'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'
    }

    function genRandom(min, max) return min + math.random() * (max - min) end

    local columnBaseTemplate = Utils.getFirstDescendantByName(letterFallFolder,
                                                              "ColumnBase")

    for colIndex = 1, numCol do
        local newColumnBase = columnBaseTemplate:Clone()
        newColumnBase.Parent = runtimeFolder
        newColumnBase.Name = "letter-" .. colIndex .. "xxx"

        local columnAttachment = Utils.getFirstDescendantByName(newColumnBase,
                                                                "Att-ColumnBase")
        columnAttachment.Name = columnAttachment.Name .. "-C" .. colIndex ..
                                    "xxx"
        local z = newColumnBase.Size.Z * (colIndex - 1)
        newColumnBase.CFrame = newColumnBase.CFrame *
                                   CFrame.new(Vector3.new(0, 0, z))

        local letterTemplate = Utils.getFirstDescendantByName(newColumnBase,
                                                              "LetterTemplate")

        for rowIndex = 1, numRow do
            local char = letters[(colIndex % #letters) + 1]
            local test = genRandom(1, 26)
            local newLetterTemplate = letterTemplate:Clone()
            newLetterTemplate.Parent = newColumnBase

            local handle = Utils.getFirstDescendantByName(newLetterTemplate,
                                                          "Handle")
            local letterAttachment = Utils.getFirstDescendantByName(
                                         newLetterTemplate, "Att-Handle")
            handle.Name = "letter-" .. char .. "-yyy"

            letterAttachment.Name = letterAttachment.Name .. "-R" .. rowIndex ..
                                        "-C" .. colIndex .. "zzz"

            local y = handle.Size.Y * (rowIndex - 1)

            handle.CFrame = handle.CFrame * CFrame.new(Vector3.new(0, y, 0))

            local textLabels = Utils.getDescendantsByName(handle, "BlockChar")
            for i, label in ipairs(textLabels) do label.Text = char end

        end
        letterTemplate:Destroy()
    end
    columnBaseTemplate:Destroy()

end
module.initLetterFall = initLetterFall

return module
