local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local module = {}

local ConfigGame = require(Sss.Source.LetterFall.ConfigGame)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local TargetWord = require(Sss.Source.LetterFall.TargetWord)
local HandleBrick2 = require(Sss.Source.LetterFall.HandleBrick3)
local BindEventHandlers = require(Sss.Source.LetterFall.BindEventHandlers)

HandleBrick2.initClickHandler()

function initLetterFall()
    BindEventHandlers.bindClickBlock()
    ConfigGame.configGame()
    LetterFall.initLetterRack()
    TargetWord.initWord()
    -- LetterFall.createBalls()

    -- 
end

module.initLetterFall = initLetterFall
return module

