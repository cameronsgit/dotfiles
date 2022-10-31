return require('packer').startup(
    function(use)
        use { 'L3MON4D3/LuaSnip' }
        use { 'hrsh7th/cmp-path' }
        use { 'hrsh7th/nvim-cmp' }
        use { 'hrsh7th/cmp-buffer' }
        use { 'hrsh7th/cmp-cmdline' }
        use { 'hrsh7th/cmp-nvim-lsp' }
        use { 'neovim/nvim-lspconfig' }
        use { 'carlsmedstad/vim-bicep' }
        use { 'wbthomason/packer.nvim' }
        use { 'saadparwaiz1/cmp_luasnip' }
        use { 'sainnhe/gruvbox-material' }
        use { 'christoomey/vim-tmux-navigator' }
        use { 'nvim-treesitter/nvim-treesitter' }
        use { 'williamboman/nvim-lsp-installer' }
        use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
        use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
        use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
              "nvim-lua/plenary.nvim",
              "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
              "MunifTanjim/nui.nvim",
            }
        }
    end
)
