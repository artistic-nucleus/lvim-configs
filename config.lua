--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

--load configs
-- require "user.todo_comments.lua"
require "user.plugins"

-- general
vim.opt.cmdheight = 1
lvim.log.level = "warn"
lvim.format_on_save = true
vim.g.edge_style = "aura"
vim.g.catppuccin_flavour = "latte" -- latte, frappe, macchiato, mocha
vim.g.edge_diagnostic_virtual_text = "colored"
lvim.colorscheme = "edge"
lvim.lsp.diagnostics.virtual_text = false
-- lvim.builtin.fancy_statusline = { active = true } -- enable/disable fancy statusline
-- if lvim.builtin.fancy_statusline.active then
-- require("user.lualine").config()
-- end
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble workspace_diagnostics<cr>", "Wordspace Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.dap.active = false
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.bufferline.options.always_show_bufferline = true
-- lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "cpp",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "css",
  "java",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "clangd" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skiipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
-- local formatters = require("lvim.lsp.null-ls.formatters")
-- formatters.setup({
-- { command = "stylua", filetypes = { "lua" } },
--   { command = "black", filetypes = { "python" } },
--   { command = "isort", filetypes = { "python" } },
--   {
--     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
--     command = "prettier",
--     ---@usage arguments to pass to the formatter
--     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
--     extra_args = { "--print-width", "100" },
--     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- })

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "cpplint", filetypes = { "c", "cpp" } },
  { command = "cppcheck", filetypes = { "cpp" }, args = { "--language=c++" } },
  -- { command = "flake8", filetypes = { "python" } },
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}

--clangd formatting setup
local clangd_flags = {
  "--fallback-style=google",
  "--background-index",
  "-j=12",
  "--all-scopes-completion",
  "--pch-storage=disk",
  "--clang-tidy",
  "--log=error",
  "--completion-style=detailed",
  "--header-insertion=iwyu",
  "--header-insertion-decorators",
  "--enable-config",
  "--offset-encoding=utf-16",
  "--ranking-model=heuristics",
  "--folding-ranges",
}

local clangd_bin = "clangd"

local opts = {
  cmd = { clangd_bin, unpack(clangd_flags) },
}
require("lvim.lsp.manager").setup("clangd", opts)


--setup for dapui
-- require("dapui").setup({
--     icons = { expanded = "▾", collapsed = "▸" },
--     mappings = {
--         -- Use a table to apply multiple mappings
--         expand = { "<CR>", "<2-LeftMouse>" },
--         open = "o",
--         remove = "d",
--         edit = "e",
--         repl = "r",
--     },
--     layouts = {
--         {
--             elements = {
--                 'breakpoints',
--                 'watches',
--                 -- 'scopes',
--                 -- 'stacks',
--             },
--             size = 40,
--             position = 'left',
--         },
--         {
--             elements = {
--                 'repl',
--                 -- 'console',
--             },
--             size = 10,
--             position = 'bottom',
--         },
--     },
-- })

--setup for dap
-- local dap = require("dap")
-- -- dap.defaults.fallback.terminal_win_cmd = '50vsplit new'
-- dap.adapters.lldb = {
--     type = 'executable',
--     command = '/usr/bin/lldb-vscode', -- adjust as needed, must be absolute path
--     name = 'lldb'
-- }
-- dap.configurations.cpp = {
--     {
--         name = "Launch file",
--         type = "lldb",
--         --type = "codelldb",
--         request = "launch",

--         program = function()
--             return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
--         end,

--         -- args = "1",
--         args = function()
--           local argument_string = vim.fn.input('Program arguments: ')
--           return vim.fn.split(argument_string, " ", true)
--         end,

--         cwd = "${workspaceFolder}",
--         -- stopOnEntry = true,
--     },
-- }
-- dap.configurations.c = dap.configurations.cpp

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--lsp_signature attach
lvim.lsp.on_attach_callback = function(client, bufnr)
  require("lsp_signature").on_attach()
end

--tab settings
vim.cmd("set tabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set expandtab")
-- vim.cmd("set smarttab")
vim.cmd("set autoindent")
vim.cmd 'set softtabstop=2'
vim.cmd("set wrap")
vim.cmd("set foldmethod=indent")
vim.api.nvim_exec([[autocmd! FileType TelescopeResults setlocal nofoldenable]], false)

--custom keybindings
--general
lvim.keys.normal_mode["<leader>z"] = "za"
--keybindings for code runner
vim.keymap.set("n", "<leader>R", "<cmd>wa<CR><cmd>RunCode<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>r", "<cmd>w<CR><cmd>RunFile<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rp", "<cmd>wa<CR><cmd>RunProject<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
vim.keymap.set("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })

--hack to toggle colorscheme
lvim.keys.normal_mode["<F7>"] = "<cmd>Catppuccin latte<CR>"
lvim.keys.normal_mode["<F6>"] = "<cmd>Catppuccin frappe<CR><cmd>colorscheme edge<CR>"

--tab switch buffer
lvim.keys.normal_mode["<S-l>"] = "<cmd>BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = "<cmd>BufferLineCyclePrev<CR>"

--for todo function
vim.keymap.set("n", "<leader>tf", ':exe ":TodoQuickFix cwd=" .. fnameescape(expand("%:p"))<CR>')
vim.keymap.set("n", "<leader>td", ':exe ":TodoQuickFix cwd=" .. fnameescape(expand("%:h"))<CR>')
