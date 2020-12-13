local module = {buffer = 0}

function module.handleBrick(props)
    local player = props.player
    local letterBlock = props.letterBlock

    letterBlock:Destroy()

end

return module
