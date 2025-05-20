-- Definir líder para espaço
vim.g.mapleader = " "

-- Atalhos úteis
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("i", "jk", "<Esc>") -- sair do modo insert com "jk"
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")


-- Mostrar números e números relativos
vim.opt.number = true
-- vim.opt.relativenumber = true

-- Indentação e tabulação
vim.opt.tabstop = 2        -- número de espaços que um tab representa
vim.opt.shiftwidth = 2     -- número de espaços ao fazer indentação
vim.opt.expandtab = true   -- usa espaços em vez de tabs
vim.opt.smartindent = true

-- Aparência
vim.opt.termguicolors = true
vim.opt.cursorline = true     -- destaca a linha atual
vim.opt.signcolumn = "yes"    -- sempre mostrar coluna de sinais (diagnósticos, git, etc)
vim.opt.wrap = false          -- não quebrar linhas automaticamente
vim.cmd("colorscheme tokyonight")

-- Pesquisa
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- Interface
vim.opt.scrolloff = 8         -- manter 8 linhas de margem ao rolar
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true     -- novas janelas horizontais abaixo
vim.opt.splitright = true     -- novas janelas verticais à direita
vim.opt.mouse = "a"           -- habilitar mouse
vim.opt.clipboard = "unnamedplus" -- usar clipboard do sistema

-- Desabilitar backup/swap/undo files (opcional)
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.undofile = true       -- manter histórico de undo entre sessões

-- Status line simples (sem plugins)
vim.opt.laststatus = 2
vim.opt.ruler = true

-- Tempo de resposta para mapeamentos
vim.opt.timeoutlen = 500

-- Reduz delay do modo insert para comandos como ESC
vim.opt.ttimeoutlen = 0

