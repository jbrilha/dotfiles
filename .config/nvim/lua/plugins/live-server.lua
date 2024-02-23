return {
    'barrett-ruth/live-server.nvim',
    config = function ()
        require('live-server').setup({
            args = { }
        })
        return true
    end
}


