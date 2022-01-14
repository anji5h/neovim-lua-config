local opts = {noremap = true, silent = true}

local term_opts = {silent = true}

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- file explorer
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<C-down>", "<C-w>j", opts)
keymap("n", "<C-left>", "<C-w>h", opts)
keymap("n", "<C-up>", "<C-w>k", opts)
keymap("n", "<C-right>", "<C-w>l", opts)

-- Naviagate buffers
keymap("n", "<S-right>", ":bnext<CR>", opts)
keymap("n", "<S-left>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-down>", ":m .+1<CR>==", opts)
keymap("n", "<A-up>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-left>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-down>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-up>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-right>", "<C-\\><C-N><C-w>l", term_opts)

-- Command --
-- Menu navigation
keymap("c", "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', {expr = true, noremap = true})
keymap("c", "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', {expr = true, noremap = true})

--Better save and exit
keymap("n", "<C-q>", ":q!<CR>", opts)
keymap("n", "<C-s>", ":w<CR>", opts)
keymap("n", "<C-c>", "<ESC>", opts)

--cut,copy,paste
keymap("n", "<C-c>", "yy", opts)
keymap("n", "<C-v>", "p", opts)
keymap("n", "<C-x>", "dd", opts)

--tabline
-- Move to previous/next
keymap("n", "<A-right>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<A-left>", ":BufferLineCyclePrev<CR>", opts)

--telescope
keymap("n", "<Leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<Leader>fw", ":Telescope buffers<CR>", opts)
keymap("n", "<Leader>ft", ":Telescope live_grep<CR>", opts)

--comments
keymap("n", "<C-_>", ":CommentToggle<CR>", opts)

--format code
keymap("n", "<C-A-l>", ":lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)
