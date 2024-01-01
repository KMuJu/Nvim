local colors = require("core.colors")

return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			local groups = colors.custom.groups
			local highlight_groups = colors.custom.highlight_groups
			require("rose-pine").setup({
				--- @usage 'auto'|'main'|'moon'|'dawn'
				variant = "moon",
				--- @usage 'main'|'moon'|'dawn'
				dark_variant = "moon",
				bold_vert_split = false,
				dim_nc_background = false,
				disable_background = false,
				disable_float_background = false,
				disable_italics = false,

				--- @usage string hex value or named color from rosepinetheme.com/palette
				groups = groups,

				-- Change specific vim highlight groups
				-- https://github.com/rose-pine/neovim/wiki/Recipes
				highlight_groups = highlight_groups,
			})

			local map = require("helpers.keys").map
			map("n", "<leader>cs", function()
				colors.switch()
				vim.cmd("Lazy reload rose-pine")
				vim.cmd.colorscheme(require("helpers.theme"))
                print("Switched colors")
			end, "Switch custom colorscheme")
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = true,
		opts = ...,
	},
}
