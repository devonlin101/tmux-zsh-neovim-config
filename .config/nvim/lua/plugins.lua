-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function()
  use "lukas-reineke/indent-blankline.nvim"
  use 'lewis6991/gitsigns.nvim'
  use 'wbthomason/packer.nvim'
  use 'sainnhe/everforest'
  use {'neoclide/coc.nvim', branch = 'release'}
  use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
  use { 'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' }
}
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  --use "williamboman/nvim-lsp-installer"
  --use 'kyazdani42/nvim-web-devicons'
  --use 'windwp/nvim-autopairs'
  --use 'neovim/nvim-lspconfig'
  --use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  --use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  --use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  --use 'L3MON4D3/LuaSnip' -- Snippets plugin
--  use {                                              -- filesystem navigation
--    'kyazdani42/nvim-tree.lua',
 --   requires = 'kyazdani42/nvim-web-devicons',      -- filesystem icons
  --  tag = 'nightly'     --optional, updated every week. (see issue #1993)
  --}
  
end)


