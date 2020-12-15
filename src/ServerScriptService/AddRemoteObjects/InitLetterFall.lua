local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local module = {}

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
-- local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)
local TargetWord = require(Sss.Source.TargetWord.TargetWord)
local HandleBrick2 = require(SP.Source.StarterPlayerScripts.HandleBrick2)

HandleBrick2.initClickHandler()

function addRemoteObjects()
    ConfigGame.configGame()
    LetterFall.initLetterRack()
    TargetWord.initWord()
    -- LetterFall.createBalls()

    -- 
end

module.addRemoteObjects = addRemoteObjects
return module

