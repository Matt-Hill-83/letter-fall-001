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
    print('wordLetters' .. ' - start');
    print(wordLetters);
    print('wordLetters' .. ' - end');

    local textLabel = Utils.getFirstDescendantByName(clickedLetter, "BlockChar")
                          .Text
    print('textLabel' .. ' - start');
    print(textLabel);
    print('textLabel' .. ' - end');

    for i, letter in ipairs(wordLetters) do
        print(letter.char);
        if letter.found ~= true and letter.char == textLabel then
            letter.found = true
            print("fouhd")
            print("fouhd")
            print("fouhd")
            print("fouhd")
            print("fouhd")
            clickedLetter:Destroy()
        end

    end

end

return module
