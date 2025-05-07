return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false,
  opts = {
    provider = "openai",
    openai = {
      endpoint = "https://api.openai.com/v1",
      api_key_name = "cmd:op read op://private/OpenAI/password -n",
      model = "gpt-4.1-mini",   -- your desired model (or use gpt-4o, etc.)
      timeout = 300000,         -- timeout in milliseconds
      temperature = 0,          -- adjust if needed
      max_tokens = 4096,
      reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
    },
    claude = {
      api_key_name = "cmd:op read op://private/anthropic/password -n",
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219",
      timeout = 300000,
      temperature = 0,
      max_tokens = 4096,
    },
    gemini = {
      api_key_name = "cmd:op read op://private/google-gemini/password -n",
    },
    behaviour = {
      enable_claude_text_editor_tool_mode = true,
    },
    hints = {
      enabled = false,
    },
  },
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
