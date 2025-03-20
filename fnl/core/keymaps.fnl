(import-macros {: map!} :hibiscus.vim)

;; Open oil
(map! [:n] "-" (. (require :oil) :open) "Open parent directory")
(map! [:n] "<space>-" (. (require :oil) :toggle_float) "Open parent directory")

;; Splits mapping.
(map! [:n] "<Leader>w" ":w<CR>" "Save file")
(map! [:n] "<C-m>" ":Maximize<CR>" "Toggle maximizing split")
(map! [:n] "<Leader>z" ":ZenMode<CR>" "Toggle Zen Mode")
(map! [:n] "<Leader>r" ":RunCode<CR>" "Run code")

; (map! [:n] "<leader>t" ":ToggleTerm direction=float<CR>" "Toggle floating terminal")
(map! [:n] "<leader>t" ":ToggleTerm<CR>" "Toggle floating terminal")

(map! [:n] "<leader>a" ":AerialOpen float<CR>" "Toggle floating terminal")

; (map! [:n] "<localleader>s" ":sp<CR>" "Open horizontal split")
; (map! [:n] "<localleader>w" ":vs<CR>" "Open vertical split")

(map! [:n] "s" ":HopWord<CR>"  "Jump to a word with Hop")
(map! [:n] "<leader>s" ":lua require(\"lsp_lines\").toggle()<CR>"  "Toggle lsp_lines")
(map! [:n] "<C-H-CR>" ":ToggleTerm direction=float<CR>" "Toggle lsp_lines")

(map! [:n] "<leader><leader>"  ":Telescope buffers<CR>" "Telescope buffers")
; (map! [:n] "<leader>lb" ":Telescope recall theme=ivy<CR>" "Telescope buffers")
; (map! [:n] "<leader>tb" ":RecallToggle<CR>" "Telescope buffers")

(map! [:n] "<leader>mx" ":MaximizerToggle!<CR>" "Telescope buffers")

(map! [:v] "p" "\"_dP" "Paste without losing text")

(map! [:i] "jj" "<Esc>" "Exit insert mode with jj")

; Dealing with splits
; Moving between splits
(map! [:n] "<C-k>" ":wincmd k<CR>" "Move to the split above")
(map! [:n] "<C-j>" ":wincmd j<CR>" "Move to the split below")
(map! [:n] "<C-h>" ":wincmd h<CR>" "Move to the split on the left")
(map! [:n] "<C-l>" ":wincmd l<CR>" "Move to the split on the right")

; Scaling splits
(map! [:n] "<C-S-K>" ":resize +1<CR>" "Increase window height")
(map! [:n] "<C-S-J>" ":resize -1<CR>" "Decrease window height")
(map! [:n] "<C-S-L>" ":vertical resize +1<CR>" "Increase window width")
(map! [:n] "<C-S-H>" ":vertical resize -1<CR>" "Decrease window width")

; Moving splits
(map! [:n] "<A-d>" "<Cmd>WinShift left<CR>"  "Move current split to the left")
(map! [:n] "<A-f>" "<Cmd>WinShift down<CR>"  "Move current split down")
(map! [:n] "<A-s>" "<Cmd>WinShift up<CR>"    "Move current split up")
(map! [:n] "<A-g>" "<Cmd>WinShift right<CR>" "Move current split to the right")

; Create new splits
(map! [:n] "<leader>h" ":sp<CR>" "Open new horizontal split")
(map! [:n] "<leader>v" ":vs<CR>" "Open new vertical split")

; Folding
(map! [:n] "zO" ":lua require('ufo').openAllFolds()<CR>"  "Open all folds")
(map! [:n] "zC" ":lua require('ufo').closeAllFolds()<CR>" "Close all folds")

(map! [:n] "\\" ":Neotree toggle<CR>" "Open neotree")

; (map! [:n] "<leader>a" ":EasyColor<CR>" "Color Picker")

(map! [:n] "<A-k>" ":MoveLine -1<CR>" "Move line Up")
(map! [:n] "<A-j>" ":MoveLine 1<CR>"  "Move line Down")

(map! [:v] "<A-k>" ":MoveBlock -1<CR>" "Move block Up")
(map! [:v] "<A-j>" ":MoveBlock 1<CR>"  "Move block Down")

(local dropbar-api (require :dropbar.api))
(vim.keymap.set :n "<Leader>;" dropbar-api.pick
                {:desc "Pick symbols in winbar"})	

(map! [:n] "<Leader>;" ":lua require(\"dropbar.api\").pick()<CR>"  "Pick symbols in winbar")

; (vim.keymap.set :n "[;" dropbar-api.goto_context_start
;                 {:desc "Go to start of current context"})
; (vim.keymap.set :n "];" dropbar-api.select_next_context
;                 {:desc "Select next context"})	

; vim.keymap.set('v', '<A-j>', ':<CR>', opts)
; vim.keymap.set('v', '<A-k>', '', opts)

; local opts = { noremap = true, silent = true }
; -- Normal-mode commands
; vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
; vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
; vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
; vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)
; vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
; vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)
;
; -- Visual-mode commands
; vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
; vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
; vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
; vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)

; (map! [:n] "<CTRL><CR>" ":EasyColor<CR>" "Color Picker")

; Some keybindings for normal mode.
(vim.api.nvim_set_keymap :i :<C-l> :<Right> {:noremap true :silent true})
(vim.api.nvim_set_keymap :i :<C-h> :<Left> {:noremap true :silent true})
(vim.api.nvim_set_keymap :i :<C-k> :<UP> {:noremap true :silent true})
(vim.api.nvim_set_keymap :i :<C-j> :<DOWN> {:noremap true :silent true})
; (vim.api.nvim_set_keymap :i :<C-BS> :<C-w> {:noremap true :silent true})
; (vim.api.nvim_set_keymap :i :<C-a> :<Home> {:noremap true :silent true})
; (vim.api.nvim_set_keymap :i :<C-e> :<End> {:noremap true :silent true})	

