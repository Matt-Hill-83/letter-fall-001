local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local module = {}

local ConfigGame = require(Sss.Source.LetterFall_SSS.ConfigGame)
local LetterFall = require(Sss.Source.LetterFall_SSS.LetterFall)
local TargetWord = require(Sss.Source.LetterFall_SSS.TargetWord)
local HandleBrick2 = require(Sss.Source.LetterFall_SSS.HandleBrick3)

HandleBrick2.initClickHandler()

function initLetterFall()
    ConfigGame.configGame()
    LetterFall.initLetterRack()
    TargetWord.initWord()
    -- LetterFall.createBalls()
end

module.initLetterFall = initLetterFall
return module

