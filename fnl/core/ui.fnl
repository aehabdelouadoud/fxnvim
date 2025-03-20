; NOTE: Coloscheme settings
(vim.cmd "let g:gruvbox_material_background = 'soft'")
(vim.cmd "colorscheme gruvbox-material")
(set vim.opt.laststatus 3)

(local retrofire {:base00 "#292828"
                  :base01 "#32302f"
                  :base02 "#504945"
                  :base03 "#665c54"
                  :base04 "#D6B593" ; #D6B593
                  :base05 "#ddc7a1"
                  :base06 "#ebdbb2"
                  :base07 "#fbf1c7"
                  :base08 "#ea6962"
                  :base09 "#e78a4e"
                  :base0A "#d8a657"
                  :base0B "#a9b665"
                  :base0C "#89b482"
                  :base0D "#7daea3"
                  :base0E "#d3869b"
                  :base0F "#bd6f3e"})

; NOTE: My custom highlights
(vim.api.nvim_set_hl 0 "FloatBorder"                     {:fg retrofire.base0A})
(vim.api.nvim_set_hl 0 "@lisp_punctuation_right.bracket" {:fg retrofire.base03})
(vim.api.nvim_set_hl 0 "@conceal"                        {:fg retrofire.base0A})
(vim.api.nvim_set_hl 0 "@tag"                            {:fg retrofire.base0A})
(vim.api.nvim_set_hl 0 "@string"                         {:fg retrofire.base04})
(vim.api.nvim_set_hl 0 "@macro"                          {:fg retrofire.base0D})
(vim.api.nvim_set_hl 0 "@function.builtin.asm"           {:fg retrofire.base0A})

; (vim.api.nvim_set_hl 0 "@variable" {:fg "#EAA159"})
; (vim.api.nvim_set_hl 0 "NeoTreeNormalNC" {:fg "#32302F"})
; (vim.api.nvim_set_hl 0 "NeoTreeNormal" {:fg "#32302F"})
; (vim.api.nvim_set_hl 0 "@lisp_punctuation_left.bracket" {:fg "#D2A256"})

