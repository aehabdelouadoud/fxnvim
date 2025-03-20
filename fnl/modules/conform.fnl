(local conform (require :conform))
(conform.setup {:format_on_save {:async false
               :lsp_fallback true
               :timeout_ms 500}
               :formatters_by_ft {:css [:prettier]
               :graphql [:prettier]
               :html [:prettier]
               :javascript [:prettier]
               :javascriptreact [:prettier]
               :json [:prettier]
               :lua [:stylua]
               :markdown [:prettier]
               :python [:isort :black]
               :svelte [:prettier]
               :typescript [:prettier]
               :typescriptreact [:prettier]
               :yaml [:prettier]}})
(vim.keymap.set [:n :v] :<leader>mp
                (fn []
                  (conform.format {:async false
                                  :lsp_fallback true
                                  :timeout_ms 500}))
                {:desc "Format file or range (in visual mode)"})

