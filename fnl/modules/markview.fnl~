(local markview (require :markview))

(markview.setup {:callbacks {:on_enable (fn [_ win]
                                          (tset (. vim.wo win)
                                                :conceallevel 2)
                                          (tset (. vim.wo win)
                                                :concealcursor
                                                :c))}
                :preview {:hybrid_modes [:n :i]
                          :icon_provider "mini"
                          :modes [:n :no :c :i]}})	

