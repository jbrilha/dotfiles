return {
    "eatgrass/maven.nvim",
    cmd = { "Maven", "MavenExec" },
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
        require('maven').setup({
            executable = "mvn",
            cwd = nil, -- work directory, default to `vim.fn.getcwd()`
            settings = nil, -- specify the settings file or use the default settings
            commands = { -- add custom goals to the command list
                { cmd = { "clean", "compile" }, desc = "clean then compile" },
            },
        })
    end
}
