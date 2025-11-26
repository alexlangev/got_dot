return {
    { -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        version = false, -- last release is way too old and doesn't work on Windows
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs', -- Sets main module to use for opts
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
        opts = {
            ensure_installed = { 
                'bash', 
                'c',
                'css',
                'csv',
                'diff',
                'dockerfile',
                'git_config',
                'gitcommit',
                'git_rebase',
                'gitignore',
                'gitattributes',
                'go',
                'gomod',
                'gowork',
                'gosum',
                'graphql',
                'html',
                'java',
                'javadoc',
                'javascript',
                'jq',
                'json',
                'lua',
                'luadoc',
                'make',
                'markdown',
                'markdown_inline',
                'nix',
                'python',
                'query',
                'solidity',
                'sql',
                'tmux',
                'tsx',
                'typescript',
                'typst',
                'vim',
                'vimdoc',
                'xml',
                'yaml'
            },
            -- Autoinstall languages that are not installed
            auto_install = true,
            highlight = {
                enable = true,
                -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                --  If you are experiencing weird indenting issues, add the language to
                --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
        },
    }
}
