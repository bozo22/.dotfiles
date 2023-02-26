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

-- Save
keymap("n", "<leader>w", ":w<cr>", { desc = 'Save buffer' })

-- Tree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { desc = 'Toggle filetree' })
-- keymap("n", "<esc><esc>", ":silent! nohls<cr>", { desc = '' })

-- Telescope
keymap('n', '<leader>sr', require('telescope.builtin').oldfiles, { desc = '[S]earch [R]ecently opened Files' })
keymap('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch [B]uffers' })
keymap("n", "<leader>sp", "<cmd>lua require'telescope'.extensions.projects.projects(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", { desc = '[S]earch [P]rojects' })
keymap('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch [G]rep' })
keymap('n', '<leader><space>', require('telescope.builtin').live_grep, { desc = 'Search Grep' })
keymap('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
keymap('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<leader>/', require('telescope.builtin').current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer]' })

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
keymap('n', '<leader>k', '<Cmd>bd<CR>', { desc = '[K]ill buffer' })

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

-- Use leader for an alternative register
keymap("n", "<leader>d", '"ld')
keymap("n", "<leader>D", '"lD')
keymap("n", "<leader>c", '"lc')
keymap("n", "<leader>C", '"lC')
keymap("n", "<leader>s", '"ls')
keymap("n", "<leader>S", '"lS')
keymap("n", "<leader>x", '"lx')
keymap("n", "<leader>p", '"lp')
keymap("n", "<leader>p", '"lP')
keymap("n", "<leader>y", '"ly')
keymap("n", "<leader>Y", '"lY')

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

-- Use leader for an alternative register
keymap("v", "<leader>d", '"ld')
keymap("v", "<leader>D", '"lD')
keymap("v", "<leader>c", '"lc')
keymap("v", "<leader>C", '"lC')
keymap("v", "<leader>s", '"ls')
keymap("v", "<leader>S", '"lS')
keymap("v", "<leader>x", '"lx')
keymap("v", "<leader>p", '"lp')
keymap("v", "<leader>p", '"lP')
keymap("v", "<leader>y", '"ly')
keymap("v", "<leader>Y", '"lY')

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", { desc = '' })
-- keymap("x", "K", ":move '<-2<CR>gv-gv", { desc = '' })
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", { desc = 'Move text down' })
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", { desc = 'Move text up' })

-- Use leader for an alternative register
keymap("x", "<leader>d", '"ld')
keymap("x", "<leader>D", '"lD')
keymap("x", "<leader>c", '"lc')
keymap("x", "<leader>C", '"lC')
keymap("x", "<leader>s", '"ls')
keymap("x", "<leader>S", '"lS')
keymap("x", "<leader>x", '"lx')
keymap("x", "<leader>p", '"lp')
keymap("x", "<leader>p", '"lP')
keymap("x", "<leader>y", '"ly')
keymap("x", "<leader>Y", '"lY')

-- Terminal --
-- Resize with arrows
keymap("t", "<C-Up>", "<Cmd>:resize +2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Down>", "<Cmd>:resize -2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Left>", "<Cmd>:vertical resize -2<CR>", { desc = 'Resize window' })
keymap("t", "<C-Right>", "<Cmd>:vertical resize +2<CR>", { desc = 'Resize window' })

