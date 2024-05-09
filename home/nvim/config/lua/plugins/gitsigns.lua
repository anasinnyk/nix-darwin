return {
  "lewis6991/gitsigns.nvim", -- Adds git related signs to the gutter, as well as utilities for managing changes
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
    },
  },
}

