(fn hide-winbar-tabs []
  ((. (require :lualine) :hide) {:place [:tabline :winbar] :unhide false}))

{1 :folke/zen-mode.nvim
 :config (fn []
           (vim.keymap.set :n :<leader>zz
                           (fn []
                             (hide-winbar-tabs)
                             ((. (require :zen-mode) :setup) {:on_close (fn []
                                                                          ((. (require :lualine)
                                                                              :hide) {:unhide true})
                                                                          (vim.cmd "echo 'ZenMode closed'"))
                                                              :on_open (fn []
                                                                         (vim.cmd "echo 'ZenMode opened'"))
                                                              :window {:options {}
                                                                       :width 110}})
                             ((. (require :zen-mode) :toggle))
                             (set vim.wo.number true)
                             (set vim.wo.rnu true))))}	
