local Sss = game:GetService("ServerScriptService")
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local Utils = require(Sss.Source.Utils.U001GeneralUtils)
local Constants = require(Sss.Source.Constants.Constants)

local CS = game:GetService("CollectionService")

local module = {buffer = 0}

function isWordComplete(props) end
function isDesiredLetter(letter, clickedLetter)
    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    return letter.found ~= true and letter.char == textLabel
end

function module.handleBrick(props)
    local player = props.player
    local clickedLetter = props.letterBlock

    local wordLetters = LetterFall.getWordLetters()

    for i, letter in ipairs(wordLetters) do
        print('letter' .. ' - start');
        print(letter);
        print('letter' .. ' - end');
        if isDesiredLetter(letter, clickedLetter) then
            letter.found = true

            LetterFall.colorLetterText({
                letterBlock = letter.instance,
                color = Color3.new(255, 0, 191)
            })

            clickedLetter:Destroy()
            -- break out of for loop
            break
        end

    end

end

return module
