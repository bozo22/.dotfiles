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
keymap("n", "<leader>q", ":q<cr>", { desc = 'Close window' })

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
-- keymap('n', '<S-h>', '<Cmd>BufferPrevious<CR>', { desc = 'Navigate to previous buffer' })
-- keymap('n', '<S-l>', '<Cmd>BufferNext<CR>', { desc = 'Navigate to next bufffer' })
keymap('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Navigate to previous buffer' })
keymap('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', { desc = 'Navigate to next bufffer' })

-- Reorder buffers
keymap('n', '<A-h>', '<Cmd>BufferLineMovePrev<CR>', { desc = 'Reorder buffer to the left' })
keymap('n', '<A-l>', '<Cmd>BufferLineMoveNext<CR>', { desc = 'Reorder buffer to the right' })

-- Close buffer
keymap('n', '<leader>c', '<Cmd>bd<CR>', { desc = '[C]lose buffer' })

-- Vertical split
keymap('n', '<leader>v', ':vsp<CR>', { desc = '[V]ertical split' })

-- Send current line to terminal
keymap('n', '<leader>j', ':ToggleTermSendCurrentLine<CR>', { desc = 'Send current line to terminal' })

-- Center cursor
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "J", "mzJ`z")

-- Delete without yank
keymap("n", "<leader>d", '"_d')
keymap("n", "<leader>D", '"_D')
keymap("n", "<leader>c", '"_c')
keymap("n", "<leader>C", '"_C')
keymap("n", "<leader>s", '"_s')
keymap("n", "<leader>S", '"_S')
keymap("n", "<leader>x", '"_x')

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

-- Send visual selection to terminal
keymap('v', '<leader>j', ':ToggleTermSendVisualSelection<CR>', { desc = 'Send selection to terminal' })

-- Delete without yank
keymap("v", "<leader>d", '"_d')
keymap("v", "<leader>D", '"_D')
keymap("v", "<leader>c", '"_c')
keymap("v", "<leader>C", '"_C')
keymap("v", "<leader>s", '"_s')
keymap("v", "<leader>S", '"_S')
keymap("v", "<leader>x", '"_x')

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = '' })
-- keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = '' })
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = 'Move text down' })
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = 'Move text up' })

-- Delete without yank
keymap("x", "<leader>d", '"_d')
keymap("x", "<leader>D", '"_D')
keymap("x", "<leader>c", '"_c')
keymap("x", "<leader>C", '"_C')
keymap("x", "<leader>s", '"_s')
keymap("x", "<leader>S", '"_S')
keymap("x", "<leader>x", '"_x')

-- Terminal --
-- Resize with arrows
keymap("t", "<C-Up>", "<Cmd>:resize +2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Down>", "<Cmd>:resize -2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Left>", "<Cmd>:vertical resize -2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Right>", "<Cmd>:vertical resize +2<CR>", { desc = 'Resize window' })

