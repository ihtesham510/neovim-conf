return {
  'nvim-treesitter/nvim-treesitter',
  event = 'User BaseDefered',
  version = '*',
  branch = 'master',
  cmd = {
    'TSBufDisable',
    'TSBufEnable',
    'TSBufToggle',
    'TSDisable',
    'TSEnable',
    'TSToggle',
    'TSInstall',
    'TSInstallInfo',
    'TSInstallSync',
    'TSModuleInfo',
    'TSUninstall',
    'TSUpdate',
    'TSUpdateSync',
  },
  build = ':TSUpdate',
  opts = {
    auto_install = true,

    highlight = {
      enable = true,
    },
    matchup = {
      enable = true,
      enable_quotes = true,
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require('nvim-treesitter.configs').setup(opts)
  end,
}
