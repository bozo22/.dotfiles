-- local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("", "<Space>", "<Nop>", {silent = true})
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = 'Move to the window on the left'})
keymap("n", "<C-j>", "<C-w>j", { desc = 'Move to the window below'})
keymap("n", "<C-k>", "<C-w>k", { desc = 'Move to the window above'})
keymap("n", "<C-l>", "<C-w>l", { desc = 'Move to the window on the right'})

-- Close window
keymap("n", "<leader>qq", ":q<cr>", { desc = 'Close window' })

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = 'Toggle filetree' })
-- keymap("n", "<esc><esc>", ":silent! nohls<cr>", { desc = '' })

-- Telescope
keymap('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap("n", "<leader>sp", "<cmd>lua require'telescope'.extensions.projects.projects(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", { desc = '[S]earch [P]rojects' })
keymap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sd', require('telescope.builtin').live_grep, { desc = '[S]earch [D]irectory' })
keymap('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
keymap('n', '<leader>sD', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = 'Resize window' })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = 'Resize window' })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = 'Resize window' })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = 'Resize window' })

-- Navigate buffers
keymap('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Navigate to previous buffer' })
keymap('n', '<S-l>', '<Cmd>BufferNext<CR>', { desc = 'Navigate to next bufffer' })

-- Reorder buffers
keymap('n', '<A-h>', '<Cmd>BufferMovePrevious<CR>', { desc = 'Reorder buffer to the left' })
keymap('n', '<A-l>', '<Cmd>BufferMoveNext<CR>', { desc = 'Reorder buffer to the right' })

-- Close buffer
keymap('n', '<leader>c', '<Cmd>BufferClose<CR>', { desc = '[C]lose buffer' })

-- Vertical split
keymap('n', '<leader>v', ':vsp<CR>', { desc = '[V]ertical split' })

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", { desc = 'Indent left' })
keymap("v", ">", ">gv", { desc = 'Indent right' })

-- Use tab for tabbing
keymap("v", "<S-TAB>", "<gv", { desc = 'Indent left' })
keymap("v", "<TAB>", ">gv", { desc = 'Indent right' })

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", { desc = 'Move text down' })
keymap("v", "<A-k>", ":m .-2<CR>==", { desc = 'Move text up' })
keymap("v", "p", '"_dP', { desc = '[P]aste' })

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = '' })
-- keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = '' })
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = 'Move text down' })
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = 'Move text up' })
