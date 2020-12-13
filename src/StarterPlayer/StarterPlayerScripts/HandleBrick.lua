local Sss = game:GetService("ServerScriptService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local CS = game:GetService("CollectionService")

local module = {buffer = 0}

function module.handleBrick(props)
    local player = props.player
    local clickedLetter = props.letterBlock

    -- local wordLetters = CS:GetTagged(Constants.tagNames.WordLetter)

    local wordLetters = LetterFall.getWordLetters()

    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text

    for i, letter in ipairs(wordLetters) do
        print(letter.char);
        if letter.found ~= true and letter.char == textLabel then
            letter.found = true

            LetterFall.colorLetterText({
                letterBlock = letter.instance,
                color = Color3.new(255, 0, 191)
            })

            clickedLetter:Destroy()
        end

    end

end

return module
