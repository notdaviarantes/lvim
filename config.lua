-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- definindo plugins
lvim.plugins = {
  { "Mofiqul/dracula.nvim" }, -- tema dos chads
  { "catppuccin/nvim" },      -- tema dos chads 2
  {
    "github/copilot.vim",
    event = "VeryLazy",
    config = function()
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_no_tab_map = true
    end,
  }, -- copilot precisa ter meu rei
  {
    'barrett-ruth/live-server.nvim',
    build = 'yarn global add live-server',
    config = true
  }, -- live server de meme
  {
    "tpope/vim-surround",
    init = function()
      vim.o.timeoutlen = 500
    end
  }, -- esse aqui basicamente facilita o processo de adicionar texto ao redor de palavras, abre no github pra ver como funciona
}

-- definindo o colorscheme padrão
lvim.colorscheme = "catppuccin-mocha"

-- janela transparente
lvim.transparent_window = true

-- habilitando a formatação ao salvar
lvim.format_on_save = {
  enabled = true
}

-- desabilita a linha do cursor
vim.opt.cursorline = false

-- ativando os números relativos
vim.opt.relativenumber = true

-- definindo formatadores de código
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { name = "prettier" },
}

-- desligando o mapeamento do tab para o cmp
lvim.builtin.cmp.mapping["<Tab>"] = nil
lvim.builtin.cmp.mapping["<S-Tab>"] = nil

-- buffers (janelas)
lvim.keys.normal_mode["[b"] = ":bprevious<CR>"
lvim.keys.normal_mode["]b"] = ":bnext<CR>"
lvim.keys.normal_mode["<leader>n"] = ":tabnew<CR>"

-- habilitando o control + s para salvar
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"

-- mover textos para cima ou para baixo
lvim.keys.visual_mode["J"] = ":m '>+1<CR>gv=gv"
lvim.keys.visual_mode["K"] = ":m '<-2<CR>gv=gv"

-- configurações de copiar e colar
lvim.keys.visual_mode["p"] = '"_dP'
lvim.keys.visual_mode["P"] = '"_dP'
lvim.keys.normal_mode["x"] = '"_x'

-- desabilitar o vim copiando para o clipboard do meu sistema (deixar separado é uma jogada de chad)
vim.opt.clipboard = ""

-- faz com que o cursor permaneça no mesmo lugar após usar J
lvim.keys.normal_mode["J"] = "mzJ`z"

-- line wrap: deixo desabilitado por padrão
vim.opt.wrap = false

-- mudando o estilo do cursor no modo normal para bloco
vim.opt.guicursor = "n-v-c:block"

-- quando eu me mover pela página usando control + d e control + u, o cursor permanece no mesmo lugar
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- quando eu pesquisar algum termo, meu cursor permanece sempre no meio
lvim.keys.normal_mode["n"] = "nzzzv"
lvim.keys.normal_mode["N"] = "Nzzzv"

-- copiar algo para o clipboard
lvim.keys.normal_mode["<leader>y"] = '"+y'
lvim.keys.visual_mode["<leader>y"] = '"+y'
lvim.keys.normal_mode["<leader>Y"] = '"+Y'

-- fazer com que o y não copie para o clipboard do meu sistema
lvim.keys.normal_mode["y"] = '"*y'
lvim.keys.visual_mode["y"] = '"*y'

-- deletar algo para o void
lvim.keys.normal_mode["<leader>d"] = '\"_d'
lvim.keys.visual_mode["<leader>d"] = '\"_d'

-- usar control j e control k para se mover pelo menu do telescope
lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = require("telescope.actions").move_selection_next
lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = require("telescope.actions").move_selection_previous
