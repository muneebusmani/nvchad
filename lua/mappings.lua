require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local merge = function(a, b)
  local c = {}
  for k, v in pairs(a) do c[k] = v end
  for k, v in pairs(b) do c[k] = v end
  return c
end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>ms", "<cmd> Mason <cr>", { desc = "Open Mason" })
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, merge(opts, { desc = "Find Files" }))
map('n', '<leader>fg', builtin.live_grep, merge(opts, { desc = "Find Text" }))
map('n', '<leader>fb', builtin.buffers, merge(opts, { desc = "Find Buffers" }))
map('n', '<leader>fh', builtin.help_tags, merge(opts, { desc = "Open Manual" }))
map('n', '<leader>fcc', builtin.commands, merge(opts, { desc = "Open Commands List" }))
map('n', '<leader>fch', builtin.command_history, merge(opts, { desc = "Open Command History" }))

-- Telescope Git (only works if in a git repo)
map('n', '<leader>fch', builtin.command_history, merge(opts, { desc = "Open Command History" }))

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Modify Lines
map({ "n", "i" }, "<C-f>", "<cmd> dd <cr>", merge(opts, { desc = "Delete Line" }))
map({ "n", "i" }, "<C-d>", "<cmd> t. <cr>", merge(opts, { desc = "Copy Line Down" }))
