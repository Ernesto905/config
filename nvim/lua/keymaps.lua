-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys
vim.keymap.set('n', '<left>', '<cmd>echo "Aww, widdle baby can\'t move?!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Aww, widdle baby can\'t move?!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Aww, widdle baby can\'t move?!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Aww, widdle baby can\'t move?!!"<CR>')

-- Make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
