-- dashboard-nvim_config 

local M = {}

function M.setup()	
	require("dashboard").setup({
    theme = 'hyper',
    config = {
      week_header = {
       enable = true,
      },
      shortcut = {
        { 
        	desc = 'update',
         key = 'u',
        	group = '@property', 
        action = 'UpdateRemotePlugins | PlugInstall | PlugUpdate',
          },
        {
          desc = 'files',
          key = 'f',
          group = 'Label',
          action = 'Telescope find_files',
        },
      },
    },
  })
end

return M
