local module = {}
local Sss = game:GetService("ServerScriptService")

local Utils = require(Sss.Source.Utils.U001GeneralUtils)
-- local Constants = require(Sss.Source.Constants.Constants)
local ConfigGame = require(Sss.Source.AddRemoteObjects.ConfigGame)
local LetterFall = require(Sss.Source.LetterFall.LetterFall)

function addRemoteObjects()
    ConfigGame.configGame()
    LetterFall.initLetterFall()

    -- 
end

module.addRemoteObjects = addRemoteObjects
return module

