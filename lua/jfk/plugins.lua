local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "sharkdp/fd" 
  use "nvim-treesitter/nvim-treesitter" 
  use "BurntSushi/ripgrep"
  use "junegunn/fzf.vim"
  use "junegunn/fzf"
  use 'williamboman/mason.nvim'    
  use 'williamboman/mason-lspconfig.nvim'
   
  --RUST 
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'
  use 'rust-lang/rust.vim'
  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'junegunn/vim-easy-align' --align columns
  -- Completion framework:
  use 'hrsh7th/nvim-cmp' 

  -- LSP completion source:
  use 'hrsh7th/cmp-nvim-lsp'

  -- Useful completion sources:
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/cmp-vsnip'                             
  use 'hrsh7th/cmp-path'                              
  use 'hrsh7th/cmp-buffer'                            

 -- Rust Syntax Colours
  use 'tanvirtin/monokai.nvim'
  use {'neoclide/coc.nvim', branch = 'release'}

  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-media-files.nvim'

  use { "ellisonleao/gruvbox.nvim" }

  --Statusbar
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

 require("mason").setup()

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
