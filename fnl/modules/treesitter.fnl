(local configs (require :nvim-treesitter.configs))

(configs.setup { :ensure_installed [ :query ;; Required by InspectTree.
                                     ;; noice.
                                     :vim 
                                     :regex
                                     ;; For highlighting stuff in noice.
                                     :bash
                                     :markdown
                                     :markdown_inline
                                     ;; Markview - https://github.com/OXY2DEV/markview.nvim#-requirements 
                                     :html
                                     ;; Can be deleted.
                                     :scheme
                                     :json
                                     :jsonc
                                     :csv
                                     :c
                                     :cpp
                                     :doxygen
                                     :lua
                                     :fennel
                                     :python
                                     :vimdoc]
               :highlight {:enable true}
               :indent {:enable true}
               :sync_install false
               :auto_install true
               })

