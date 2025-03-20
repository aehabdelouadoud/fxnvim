(local lint (require :lint))
(set lint.linters_by_ft {:javascript      [:eslint_d]
                         :javascriptreact [:eslint_d]
                         :svelte          [:eslint_d]
                         :typescript      [:eslint_d]
                         ; :python          [:pylint  ]
                         :typescriptreact [:eslint_d]})

(local lint-augroup (vim.api.nvim_create_augroup :lint {:clear true}))

(vim.api.nvim_create_autocmd [:BufEnter
                              :BufWritePost
                              :InsertLeave]
                             {:callback (fn []
                                          (lint.try_lint))
                              :group lint-augroup})

(vim.keymap.set :n :<leader>l (fn [] (lint.try_lint))
                {:desc "Trigger linting for current file"})

