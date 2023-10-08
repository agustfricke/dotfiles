vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

-- nuevo!
-- para mover cuando esta el visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- la J se queda en su luegar 
vim.keymap.set("n", "J", "mzJ`z")

-- subir y bajar el cursor siempre al medio 
vim.keymap.set("n", "<C-j>", "<C-d>zz")
vim.keymap.set("n", "<C-k>", "<C-u>zz")
-- al buscar tambien se va a quedar al medio
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- para guardar lo que copiaste y pegaste en el buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
