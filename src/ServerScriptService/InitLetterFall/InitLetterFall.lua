local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local module = {}

local ConfigGame = require(Sss.Source.InitLetterFall.ConfigGame)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local TargetWord = require(Sss.Source.TargetWord.TargetWord)
local HandleBrick2 = require(SP.Source.StarterPlayerScripts.HandleBrick2)

HandleBrick2.initClickHandler()

function initLetterFall()
    ConfigGame.configGame()
    LetterFall.initLetterRack()
    TargetWord.initWord()
    -- LetterFall.createBalls()

    -- 
end

module.initLetterFall = initLetterFall
return module

