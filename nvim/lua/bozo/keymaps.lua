local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close window
keymap("n", "<leader>q", ":q<cr>", opts)

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
-- keymap("n", "<esc><esc>", ":silent! nohls<cr>", opts)

-- Telescope
keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap('n', '<S-h>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<S-l>', '<Cmd>BufferNext<CR>', opts)

-- Reorder buffers
keymap('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', opts)
keymap('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', opts)

-- Close buffer
keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Vertical split
keymap('n', '<leader>s', ':vsp<CR>', opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Use tab for tabbing
keymap("v", "<S-TAB>", "<gv", opts)
keymap("v", "<TAB>", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
