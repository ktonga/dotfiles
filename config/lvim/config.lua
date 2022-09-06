-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "vscode"

lvim.leader = "space"
vim.g.maplocalleader = ","

-- unmap a default keymapping
lvim.keys.visual_block_mode["J"] = false
lvim.keys.visual_block_mode["K"] = false

-- add your own keymapping
lvim.keys.insert_mode["jk"] = "<esc>"
lvim.keys.normal_mode["<C-s>"] = ":wa<cr>"
lvim.keys.normal_mode["<Backspace>"] = "<C-^>"
lvim.keys.normal_mode["<Leader><Tab>"] = "<cmd>lua require('telescope.builtin').buffers({sort_mru = true})<CR>"
lvim.keys.normal_mode["<Leader>sg"] = "<cmd>lua require('telescope.builtin').grep_string({word_match = '-w'})<CR>"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.normal_mode["<S-h>"] = nil
lvim.keys.normal_mode["<S-l>"] = nil
lvim.keys.visual_mode["<S-l>"] = nil
lvim.keys.normal_mode["<Left>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<Right>"] = ":BufferLineCycleNext<CR>"
-- Harpoon
lvim.keys.normal_mode["<Leader>m"] = "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>"
lvim.keys.normal_mode["<Leader>0"] = "<cmd>lua require('harpoon.mark').add_file()<CR>"
lvim.keys.normal_mode["<Leader>1"] = "<cmd>lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<Leader>2"] = "<cmd>lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<Leader>3"] = "<cmd>lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<Leader>4"] = "<cmd>lua require('harpoon.ui').nav_file(4)<CR>"
lvim.keys.normal_mode["<Leader>5"] = "<cmd>lua require('harpoon.ui').nav_file(5)<CR>"
lvim.keys.normal_mode["<Leader>6"] = "<cmd>lua require('harpoon.ui').nav_file(6)<CR>"

vim.api.nvim_set_keymap("", "H", "^", { noremap = true })
vim.api.nvim_set_keymap("", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "L", "g_", { noremap = true })

vim.g.gitblame_enabled = 0

lvim.builtin.terminal.open_mapping = "<C-t>"
lvim.builtin.terminal.shell = "fish"
lvim.builtin.which_key.mappings["P"] = { "<Cmd>Telescope projects<CR>", "Projects" }

lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults.layout_config = {
  prompt_position = 'top',
  height = 0.80,
  width = 0.90
}

-- Spectre
lvim.builtin.which_key.mappings["S"] = { "<Cmd>lua require('spectre').open()<CR>", "Search & Replace" }
-- search current word
lvim.keys.normal_mode["<Leader>sw"] = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
lvim.keys.visual_mode["<Leader>sw"] = "<cmd>lua require('spectre').open_visual()<CR>"

-- unmap a default keymapping
-- lvim.keys.normal_mode["S-h"] = ""
-- lvim.keys.normal_mode["S-l"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
-- lvim.builtin.which_key.mappings["t"] = {
--   name = "+Trouble",
--   r = { "<cmd>Trouble lsp_references<cr>", "References" },
--   f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
--   d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
--   q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
--   l = { "<cmd>Trouble loclist<cr>", "LocationList" },
--   w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
-- }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
-- lvim.builtin.nvimtree.show_icons.git = 0
lvim.builtin.nvimtree.setup.view.width = 50

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "fish",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "scala",
  "haskell",
  "yaml",
  "sql"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

lvim.builtin.project.manual_mode = true

-- generic LSP settings
-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- set a formatter if you want to override the default lsp one (if it exists)
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   }
-- }
-- set an additional linter
-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   }
-- }

vim.opt_global.completeopt = { "menu", "noinsert", "noselect" }
-- vim.opt_global.shortmess:remove("F"):append("c")

-- Additional Plugins
lvim.plugins = {
  { "Mofiqul/vscode.nvim" },
  { "tpope/vim-repeat" },
  { "tpope/vim-abolish" },
  { "tpope/vim-unimpaired" },
  { "tpope/vim-surround",             keys = { "c", "d", "y" } },
  { "bkad/CamelCaseMotion" },
  { "wellle/targets.vim" },
  { "michaeljsmith/vim-indent-object" },
  { "AndrewRadev/linediff.vim" },
  { "junegunn/vim-easy-align" },
  { "ThePrimeagen/harpoon" },
  { "mbbill/undotree" },
  {
    "vim-scripts/ReplaceWithRegister",
    init = function()
      vim.cmd([[
          nmap <Leader>r  <Plug>ReplaceWithRegisterOperator
          nmap <Leader>rr <Plug>ReplaceWithRegisterLine
          xmap <Leader>r  <Plug>ReplaceWithRegisterVisual
      ]])
    end,
  },
  {
    "scalameta/nvim-metals",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    init = function()
      require("diffview").setup({
        view = {
          merge_tool = {
            layout = "diff4_mixed",
          }
        }
      })
    end
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd("highlight default link gitblame SpecialComment")
    end,
  },
  {
    "windwp/nvim-spectre",
    init = function()
      require("spectre").setup()
    end,
  },
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require('git-conflict').setup()
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" }
  }
}

local bufmap = function(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, { noremap = true })
end

local lsp_mappings = function()
  bufmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
  bufmap("gD", "<cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap("gI", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  bufmap("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
  bufmap("gl", "<cmd>lua require'lvim.lsp.handlers'.show_line_diagnostics()<CR>")
  bufmap("[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false, border = lvim.lsp.popup_border }<CR>")
  bufmap("]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false, border = lvim.lsp.popup_border }<CR>")
  bufmap("<localleader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  bufmap("<localleader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
  bufmap("<localleader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  bufmap("<localleader>ws", '<cmd>lua require"metals".worksheet_hover()<CR>')
  bufmap("<localleader>a", '<cmd>lua require"metals".open_all_diagnostics()<CR>')
  bufmap("<localleader>d", "<cmd>lua vim.diagnostic.setloclist()<CR>") -- buffer diagnostics only
  bufmap("<localleader>tt", [[<cmd>lua require("metals.tvp").toggle_tree_view()<CR>]])
  bufmap("<localleader>tr", [[<cmd>lua require("metals.tvp").reveal_in_tree()<CR>]])
end

local metals_config = require("metals").bare_config()
print(metals_config)

metals_config.settings = {
  -- bloopVersion = "1.5.7",
  serverVersion = "latest.snapshot",
  showImplicitArguments = true,
  showInferredType = true,
  excludedPackages = {},
}
metals_config.init_options.statusBarProvider = "on"
metals_config.on_attach = lsp_mappings

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

-- Need for symbol highlights to work correctly
vim.cmd([[
  hi! link LspReferenceText CursorColumn
  hi! link LspReferenceRead CursorColumn
  hi! link LspReferenceWrite CursorColumn
]])

-- lvim.plugins = {
--     {"folke/tokyonight.nvim"},
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "FileType", "scala,sbt", "lua require(\"metals\").initialize_or_attach({})" }
-- }
-- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },

vim.opt.shell = "/bin/sh"

-- WhichKey popup delay
vim.opt.timeoutlen = 500

vim.opt_global.inccommand = "split"

vim.cmd([[call camelcasemotion#CreateMotionMappings("<localleader>")]])
