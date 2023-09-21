local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
  
local packer_bootstrap = ensure_packer()
    return require('packer').startup(function(use)
        use 'wbthomason/packer.nvim'
        -- My plugins here
        -- use 'foo1/bar1.nvim'
        -- use 'foo2/bar2.nvim'
        use {
            'Exafunction/codeium.vim',
            config = function ()
                -- Change '<C-g>' here to any keycode you like.
                -- vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
                -- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
                -- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
                -- vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
            end
        }
        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or, branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
        }
        use { "catppuccin/nvim", as = "catppuccin" }
        use ('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'})
        use ('nvim-treesitter/playground')
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional
            },
        }
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                --- Uncomment these if you want to manage LSP servers from neovim
                -- {'williamboman/mason.nvim'},
                -- {'williamboman/mason-lspconfig.nvim'},
            
                -- LSP Support
                {'neovim/nvim-lspconfig'},
                -- Autocompletion
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'L3MON4D3/LuaSnip'},
            }
        }
        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
