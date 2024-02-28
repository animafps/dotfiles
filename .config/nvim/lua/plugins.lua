return {
 {"epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown", 
  dependencies = {
	"nvim-lua/plenary.nvim",
   },
   opts = {
     workspaces = {
       {
         name = "main",
         path = "~/Main",
       },
     },
    },
 },
 "hrsh7th/nvim-cmp",
 "nvim-telescope/telescope.nvim",
 {"nvim-treesitter/nvim-treesitter",
   opts = {
	   ensure_installed = { "markdown", "markdown_inline", "lua", "c", "rust", "ssh_config", "git_config", "git_rebase", "gitcommit", "gitignore", "toml", "latex"},
           highlight = {
    	   	enable = true,
  	   },
	}
 },
 "williamboman/mason.nvim",
 "williamboman/mason-lspconfig.nvim",
 "neovim/nvim-lspconfig",
 "simrat39/rust-tools.nvim",
 "hrsh7th/cmp-buffer",
 "hrsh7th/cmp-nvim-lsp",
 "hrsh7th/cmp-nvim-lsp-signature-help",
 "hrsh7th/cmp-nvim-lua",
 "hrsh7th/cmp-path",
 "hrsh7th/cmp-vsnip",
 "hrsh7th/vim-vsnip",
 "luisiacc/gruvbox-baby",
 {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
 },
 "lervag/vimtex",
 "rafamadriz/friendly-snippets",
 }
