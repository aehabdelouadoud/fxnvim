((. (require :incline) :setup) {:hide {:cursorline false
                                       :focused_win true
                                       :only_win true}
                               :render (fn [props]
                                          (local filename
                                                 (vim.fn.fnamemodify (vim.api.nvim_buf_get_name props.buf)
                                                                     ":t"))
                                          (local (ft-icon ft-color)
                                                 ((. (require :nvim-web-devicons)
                                                     :get_icon_color) filename))
                                          (local modified
                                                 (or (and (. (. vim.bo
                                                                props.buf)
                                                             :modified)
                                                          "bold,italic")
                                                     :italic))

                                          (fn get-git-diff []
                                            (local icons
                                                   {:added " "
                                                   :changed " "
                                                   :removed " "})
                                            (tset icons :changed
                                                  icons.modified)
                                            (local signs
                                                   (. (. vim.b
                                                         props.buf)
                                                      :gitsigns_status_dict))
                                            (local labels {})
                                            (when (= signs nil)
                                              (lua "return labels"))
                                            (each [name icon (pairs icons)]
                                              (when (and (tonumber (. signs
                                                                      name))
                                                         (> (. signs
                                                               name)
                                                            0))
                                                (table.insert labels
                                                              {1 (.. icon
                                                                     (. signs
                                                                        name)
                                                                     " ")
                                                              :group (.. :Diff
                                                                         name)})))
                                            (when (> (length labels)
                                                     0)
                                              (table.insert labels
                                                            [" "]))
                                            labels)

                                          (fn get-diagnostic-label []
                                            (local icons
                                                   {:error ""
                                                   :hint ""
                                                   :info ""
                                                   :warn ""})
                                            (local label {})
                                            (each [severity icon (pairs icons)]
                                              (local n
                                                     (length (vim.diagnostic.get props.buf
                                                                                 {:severity (. vim.diagnostic.severity
                                                                                               (string.upper severity))})))
                                              (when (> n 0)
                                                (table.insert label
                                                              {1 (.. icon
                                                                     " "
                                                                     n
                                                                     " ")
                                                              :group (.. :DiagnosticSign
                                                                         severity)})))
                                            (when (> (length label)
                                                     0)
                                              (table.insert label
                                                            [" "]))
                                            label)

                                          (fn get-window-number [win]
                                            (let [windows (vim.api.nvim_list_wins)]
                                              (each [i w (ipairs windows)] (when (= w win) (lua "return i")))
                                              (- 1)))
                                          (local win props.win)

                                          (local buffer
                                                 [[(get-diagnostic-label)]
                                                  [(get-git-diff)]
                                                  {1 (.. (or ft-icon
                                                             "")
                                                         " ")
                                                  :guibg :none
                                                  :guifg ft-color}
                                                  {1 (.. filename
                                                         " ")
                                                  :gui modified}
                                                  {1 (.. "  " ;;  ⧉  
                                                         (get-window-number win)) ;; split index
                                                  ; :group :NormalFloat
                                                  ; :guibg :none
                                                  ; :guifg :#cccccc
                                                  }])
                                          buffer)})
