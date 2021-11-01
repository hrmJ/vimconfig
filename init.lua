--[[

My nvim conf in lua.
============================

## Some useful sources: 

- https://vonheikemen.github.io/devlog/tools/configuring-neovim-using-lua/

- https://jdhao.github.io/2021/07/11/from_vim_plug_to_packer/

## Some requirements:

treesitter: libstdc++-static (at least fedora)
treesitter: gcc-c++

--]]

require('keys')
require('bootstrap-packer')
require('plugins')
require('search-options')
require('generic-options')
require('telescope-config')
require('treesitter-config')
require('cmp-config')
require('colors')
