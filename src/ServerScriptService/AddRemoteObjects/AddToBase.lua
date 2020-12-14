local SP = game:GetService("StarterPlayer")
local Sss = game:GetService("ServerScriptService")
local module = {}

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
-- local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)
local HandleBrick2 = require(SP.Source.StarterPlayerScripts.HandleBrick2)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

-- HandleBrick2.onCreatePart()

function addRemoteObjects()
    ConfigGame.configGame()
    LetterFall.initLetterRack()
    LetterFall.initWord()
    -- LetterFall.anchorLetters()

    -- 
end

module.addRemoteObjects = addRemoteObjects
return module

