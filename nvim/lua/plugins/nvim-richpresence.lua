return {
  {
    "andweeb/presence.nvim",  -- Correct plugin name
    lazy=false,
    config = function()
      require("presence"):setup({
        auto_update = true,               -- Automatically update Discord status
        neovim_image_text = "Neovim IDE", -- Hover text for Neovim image
        main_image = "file",              -- Main image for the Discord presence
        editing_text = "Editing %s",      -- Text displayed while editing
        file_explorer_text = "Browsing %s", -- Text displayed while in a file explorer
        line_number_text = "Line %s/%s",  -- Show current line / total lines
      })
    end,
  },
}

