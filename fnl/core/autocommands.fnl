; Disable mini.indentscope in some file types.
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [] (set vim.b.miniindentscope_disable true))
                             :pattern ["dashboard" ;; NOTE: List files you wanna disable mini indentscope here.
                                       "lazy"
                                       "mason"]})

; Fix the problem of: lsp-lines virtual text doubling in lazy.nvim.
(vim.api.nvim_create_autocmd :WinEnter
                             {:callback (fn [] (local floating
                                                 (not= (. (vim.api.nvim_win_get_config 0) :relative) ""))
                                              (vim.diagnostic.config {:virtual_lines (not floating)
                                                                      :virtual_text floating}))})

; Disable folding in some buffers ex: Neotree.
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn []
                                          ((. (require :ufo) :detach))
                                          (set vim.opt_local.foldenable false)
                                          (set vim.opt_local.foldcolumn :0))
                              :pattern [:nvcheatsheet :neo-tree :aerial :leetcode.nvim]})

; Disable line number in some file types.
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [] (set vim.opt_local.number false)
                                          (set vim.opt_local.relativenumber
                                               false))
                              :pattern :oil})

; Disable folding in certain file types
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn []
                                          (set vim.opt_local.foldmethod :manual)
                                          (set vim.opt_local.foldenable false))
                              :pattern [:oil :neo-tree]})

; Disable expanding tab to spaces in certain files
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [] (set vim.opt.expandtab false))
                             :pattern ["cmake"]})

; Enable wrapping in certain files
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn [] (set vim.opt.wrap true))
                             :pattern ["tex"]})

; just fixes the issue of (when i move lsp-lines gets on, and that's a bit annoying)
(fn sync-lsp-lines-on-split-change []
  (let [lsp-lines-on false]
    (fn set-lsp-lines []
      ((. (require :lsp_lines) :toggle)))

    (vim.api.nvim_create_autocmd :WinEnter {:callback set-lsp-lines})))
(sync-lsp-lines-on-split-change)	; lsp-lines

; Disable colorcolumn for a specfic filetype
(vim.api.nvim_create_autocmd :FileType
                             {:callback (fn []
                                          (set vim.opt_local.colorcolumn ""))
                              :pattern [:markdown
                                        :text
                                        :json 
                                        :dashboard 
                                        :lazy 
                                        :mason 
                                        :neeotree 
                                        :leetcode.nvim
                                        :aerial
                                        :nvcheatsheet
                                        :oil 
                                        :fennel]})

; Enable normal mode in inactive

; TODO: Fix this one

; (set vim.o.updatetime 2000)
; (vim.api.nvim_create_autocmd :FileType
;                              {:callback (fn []
;                                           (vim.api.nvim_create_autocmd :CursorHoldI
;                                                                        {:buffer 0
;                                                                         :callback (fn []
;                                                                                     (vim.cmd :stopinsert))}))
;                               :pattern [:toggleterm :fennel]})	

; Experimental

(vim.api.nvim_create_autocmd :User
                             {:callback (fn []
                                          ((. (require :dropbar.api) :toggle) false))
                              :pattern :ZenMode
                              :callback :On_open})
(vim.api.nvim_create_autocmd :User
                             {:callback (fn []
                                          ((. (require :dropbar.api) :toggle) true))
                              :pattern :ZenMode
                              :callback :On_close})	

; Preserve Folds When Entering Command Mode
(vim.api.nvim_create_autocmd :CmdlineEnter {:command "normal! zx" :pattern "*"})	

