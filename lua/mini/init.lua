-- MIT License Copyright (c) 2021 Evgeni Chasnovski

-- Documentation ==============================================================
---@brief [[
--- |mini.nvim| is a collection of minimal, independent, and fast Lua modules
--- dedicated to improve Neovim (version 0.5 and higher) experience. Each
--- module can be considered as a separate sub-plugin.
---
--- # General principles
---
--- - <Design>. Each module is designed to solve a particular problem targeting
---   balance between feature-richness (handling as many edge-cases as
---   possible) and simplicity of implementation/support. Granted, not all of
---   them ended up with the same balance, but it is the goal nevertheless.
--- - <Independence>. Modules are independent of each other and can be run
---   without external dependencies. Although some of them may need
---   dependencies for full experience.
--- - <Structure>. Each module is a submodule for a placeholder "mini" module. So,
---   for example, "surround" module should be referred to as "mini.surround".
---   As later will be explained, this plugin can also be referred to
---   as "MiniSurround".
--- - <Setup>:
---     - Each module (if needed) should be setup separately with<br>
---       `require(<name of module>).setup({})`
---       (possibly replace {} with your config table or omit to use defaults).
---       You can supply only values which differ from defaults, which will be
---       used for the rest ones.
---     - Call to module's `setup()` always creates a global Lua object with
---       coherent camel-case name: `require('mini.surround').setup()` creates
---       `_G.MiniSurround`. This allows for a simpler usage of plugin
---       functionality: instead of `require('mini.surround')` use
---       `MiniSurround` (or manually `:lua MiniSurround.*` in command line);
---       available from `v:lua` like `v:lua.MiniSurround`. Considering this,
---       "module" and "Lua object" names can be used interchangeably:
---       'mini.surround' and 'MiniSurround' will mean the same thing.
---     - Each supplied `config` table (after extending with default values) is
---       stored in `config` field of global object. Like `MiniSurround.config`.
---     - Values of `config`, which affect runtime activity, can be changed on
---       the fly to have effect. For example, `MiniSurround.config.n_lines`
---       can be changed during runtime; but changing
---       `MiniSurround.config.mappings` won't have any effect (as mappings are
---       created once during `setup()`).
--- - <Disabling>. Each module's core functionality can be disabled globally or
---   buffer-locally by creating appropriate global or buffer-scoped variables
---   with |v:true| value. For example:
--- <pre>
---     - To disable `MiniSurround` globally run `:let g:minisurround_disable=v:true`.
---     - To disable `MiniSurround` for current buffer run `:let b:minisurround_disable=v:true`.
---     - To toggle `MiniSurround` globally (disable if enabled, enable if
---       disabled) use of Lua is more appropriate:
---       `:lua vim.g.minisurround_disable = not vim.g.minisurround_disable`.
--- </pre>
--- - <Highlight groups>. Appearance of module's output is controlled by
---   certain highlight group (see |highlight-groups|). To customize them, use
---   |highlight| command. Note: currently not many Neovim themes support this
---   plugin's highlight groups; fixing this situation is highly appreciated.
---   To see a more calibrated look, use |MiniBase16| or plugin's colorscheme
---   `minischeme`.
--- - <Stability>. Each module upon release is considered to be relatively
---   stable: both in terms of setup and functionality. Any
---   non-bugfix backward-incompatible change will be released gradually as
---   much as possible.
---
--- # List of modules
---
--- - |MiniBase16| - fast implementation of base16 theme for manually supplied
---   palette. Has unique palette generator which needs only background and
---   foreground colors.
--- - |MiniBufremove| - buffer removing (unshow, delete, wipeout) while saving
---   window layout.
--- - |MiniComment| - fast and familiar per-line code commenting.
--- - |MiniCompletion| - async (with customizable 'debounce' delay) 'two-stage
---   chain completion': first builtin LSP, then configurable fallback. Also
---   has functionality for completion item info and function signature (both
---   in floating window appearing after customizable delay).
--- - |MiniCursorword| - automatic highlighting of word under cursor (displayed
---   after customizable delay).
--- - |MiniFuzzy| - functions for fast and simple fuzzy matching. It has
---   not only functions to perform fuzzy matching of one string to others, but
---   also a sorter for |telescope.nvim|.
--- - |MiniJump| - minimal and fast module for smarter jumping to a single
---   character.
--- - |MiniMisc| - collection of miscellaneous useful functions. Like `put()`
---   and `put_text()` which print Lua objects to command line and current
---   buffer respectively.
--- - |MiniPairs| - autopairs plugin which has minimal defaults and
---   functionality to do per-key expression mappings.
--- - |MiniSessions| - session management (read, write, delete) which works
---   using |mksession|. Implements both global (from configured directory) and
---   local (from current directory) sessions.
--- - |MiniStarter| - minimal, fast, and flexible start screen. Displayed items
---   are fully customizable both in terms of what they do and how they look
---   (with reasonable defaults). Item selection can be done using prefix query
---   with instant visual feedback.
--- - |MiniStatusline| - minimal and fast statusline. Has ability to use custom
---   content supplied with concise function (using module's provided section
---   functions) along with builtin default. For full experience needs [Nerd
---   font](https://www.nerdfonts.com/),
---   [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) plugin, and
---   [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)
---   plugin (but works without any them).
--- - |MiniSurround| - fast surround plugin. Add, delete, replace, find,
---   highlight surrounding (like pair of parenthesis, quotes, etc.). Has
---   special "function call", "tag", and "interactive" surroundings. Supports
---   dot-repeatability, textobject, motions.
--- - |MiniTabline| - minimal tabline which shows listed (see 'buflisted')
---   buffers in case of one tab and falls back to default otherwise. For full
---   experience needs
---   [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons).
--- - |MiniTrailspace| - automatic highlighting of trailing whitespace with
---   functionality to remove it.
---
--- # Plugin colorscheme
---
--- This plugin comes with an official colorscheme named `minischeme`. This is
--- a |MiniBase16| theme created with faster version of the following Lua code:
--- `require('mini.base16').setup({palette = palette, name = 'minischeme', use_cterm = true})`
--- where `palette` is:
--- - For dark 'background': `require('mini.base16').mini_palette('#112641', '#e2e98f', 75)`
--- - For light 'background': `require('mini.base16').mini_palette('#e2e5ca', '#002a83', 75)`
---
--- Activate it as a regular |colorscheme|.
---@brief ]]
---@tag mini.nvim

vim.notify([[Do not `require('mini')` directly. Setup every module separately.]])

return {}
