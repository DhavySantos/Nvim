vim.g.mapleader = " ";

local opts = { noremap = true, silent = true };

-- Window Navigation
vim.keymap.set("n", "<leader>w", "<C-w>k", opts);
vim.keymap.set("n", "<leader>a", "<C-w>h", opts);
vim.keymap.set("n", "<leader>s", "<C-w>j", opts);
vim.keymap.set("n", "<leader>d", "<C-w>l", opts);

-- Buffer navigation
vim.keymap.set("n", "<leader>x", ":lua MiniBufremove.delete()<cr>", opts);
vim.keymap.set("n", "<leader>q", ":bprevious<CR>", opts);
vim.keymap.set("n", "<leader>e", ":bnext<CR>", opts);
