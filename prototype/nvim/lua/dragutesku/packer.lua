-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use { 'nvim-tree/nvim-web-devicons' }
  -- Theming
  use 'folke/tokyonight.nvim'

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  -- Autopairs
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  -- File Explorer
  use({
    'ms-jpq/chadtree',
    event = 'VimEnter',
    run = 'python3 -m chadtree deps --nvim'
  })

  use('glepnir/dashboard-nvim')
  -- Harpoon
  use('theprimeagen/harpoon')

  -- UndoTree
  use('mbbill/undotree')

  -- Fugitive
  use('tpope/vim-fugitive')

  -- GitSigns (
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
  }
  -- Git
  use { 'dinhhuy258/git.nvim' }

  -- Editor Config plugin
  use { 'editorconfig/editorconfig-vim' }

  -- Indent BlankLine(https://github.com/lukas-reineke/indent-blankline.nvim)
  use "lukas-reineke/indent-blankline.nvim"

  -- LuaLine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Comment
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- install without yarn or npm
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  --  Markdown Preview
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
    ft = { "markdown" },
  })

  -- Prettier & Null-ls
  use('jose-elias-alvarez/null-ls.nvim')
  use('MunifTanjim/prettier.nvim')

  -- Mason
  use {
    'williamboman/mason.nvim',
    requires = {
      { 'neovim/nvim-lspconfig' },             -- Required (LSP SERVERS)
      { 'williamboman/mason-lspconfig.nvim' }, -- Required (LSP SERVERS)
      { 'mfussenegger/nvim-dap' },             -- Required (DAP SERVERS)
      { 'mfussenegger/nvim-lint' },            -- Required (LINTERS)
      { 'mhartington/formatter.nvim' },        -- Required (FORMATERS)


      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },         -- Required
      { 'hrsh7th/cmp-nvim-lsp' },     -- Required
      { 'hrsh7th/cmp-buffer' },       -- Optional
      { 'hrsh7th/cmp-path' },         -- Optional
      { 'saadparwaiz1/cmp_luasnip' }, -- Optional
      { 'hrsh7th/cmp-nvim-lua' },     -- Optional

      -- Snippets
      { 'L3MON4D3/LuaSnip' },             -- Required
      { 'rafamadriz/friendly-snippets' }, -- Optional
    }
  }
end)
