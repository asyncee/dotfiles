local M = {}

M.treesitter = {
  ensure_installed = {
    "go",
    "python",
    "lua",
    "vim",
    "css",
    "html",
    "javascript",
    "json",
    "markdown",
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "gopls",
    "pyright",
    "black",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

M.alpha = {
  header = {
    val = { "" },
  },
  buttons = {
    type = "group",
    val = {
      button("f", "  Find file", ":Telescope find_files <CR>"),
      button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      button("p", "  Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
      button("s", "  Load session", ":SessionManager load_session<CR>"),
      button("r", "  Recent files", ":Telescope oldfiles <CR>"),
      button("c", "  Config", ":e ~/.config/nvim/init.lua <CR>"),
      button("q", "  Quit", ":qa<CR>"),
    },
    opts = {
      spacing = 1,
    },
  },
}

--- Delete the selected buffer or all the buffers selected using multi selection.
---@param prompt_bufnr number: The prompt bufnr
local delete_buffer = function(prompt_bufnr)
  local action_state = require "telescope.actions.state"
  local current_picker = action_state.get_current_picker(prompt_bufnr)
  local bufdelete = require "bufdelete"
  current_picker:delete_selection(function(selection)
    local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"
    local ok = pcall(bufdelete.bufdelete, selection.bufnr, force)
    return ok
  end)
end

M.telescope = {
  pickers = {
    buffers = {
      mappings = {
        -- Delete buffer with dd in normal mode
        n = {
          ["dd"] = delete_buffer,
        },
        -- Delete buffer with control-d in insert mode
        i = {
          ["<C-d>"] = delete_buffer,
        },
      },
    },
  },
}

return M
