local M = {}

M.plugin_name = {
  n = {
    ["<Leader>km"] = { "<cmd>Legendary keymaps<CR>", "Show keymaps" },
  },
}

M.disabled = {
  n = {
    ["<leader>wK"] = "",
    ["<leader>wk"] = "",
  },
}

return M
