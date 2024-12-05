vim.g.mapleader = ';'
vim.cmd("filetype plugin indent on")
vim.cmd("syntax enable")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    }
})
require("mason-lspconfig").setup()
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Enable telescope theme
vim.g.gruvbox_baby_telescope_theme = 1

-- Enable transparent mode
vim.g.gruvbox_baby_transparent_mode = 1

-- Load the colorscheme
vim.cmd[[colorscheme gruvbox-baby]]

local rt = require("rust-tools")
rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
    texthl = opts.name,
    text = opts.text,
    numhl = ''
  })
end

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})

--Set completeopt to have a better completion experience
-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHold
vim.opt.shortmess = vim.opt.shortmess + { c = true}
vim.api.nvim_set_option('updatetime', 300) 

-- Fixed column for diagnostics to appear
-- Show autodiagnostic popup on cursor hover_range
-- Goto previous / next diagnostic warning / error 
-- Show inlay_hints more frequently 
vim.cmd([[
set signcolumn=number
set number
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

local telescope = require('telescope')
telescope.setup({
  defaults = {
    borderchars = {
      prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
      results = { " " },
      preview = { " " },
    },
  }
})

vim.opt.conceallevel = 2

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").rust_analyzer.setup {
	capabilities = capabilities
}
vim.keymap.set('n', 'e', 'j', { noremap = true })
vim.keymap.set('n', 'o', 'k', { noremap = true })
vim.keymap.set('n', 'i', 'l', { noremap = true })
vim.keymap.set('n', 'n', '<Left>')
 local configs = require("nvim-treesitter.configs")
 configs.setup({
          ensure_installed = { "c", "lua", "markdown", "markdown_inline", "rust", "javascript", "html", "latex", "cpp", "vimdoc", "vim", "bash", "fish", "json", "go", "git_rebase", "gitattributes", "gitcommit", "gitignore", "toml", "yaml", "css", "make", "python", "regex", "ssh_config"},
          sync_install = false,
          indent = { enable = true },
  })

vim.g.vimtex_view_method = 'zathura'
