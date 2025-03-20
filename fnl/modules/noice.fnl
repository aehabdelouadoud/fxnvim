(local noice (require :noice))

(noice.setup {:cmdline {:enabled true
                        :format {:cmdline {:icon ""
                                           :lang :vim
                                           :pattern "^:"}
                                 :filter {:icon "$"
                                          :lang :bash
                                          :pattern "^:%s*!"}
                                 :help {:icon ""
                                        :pattern "^:%s*he?l?p?%s+"}
                                 :input {:icon "󰥻 "
                                         :view :cmdline_input}
                                 :lua {:icon ""
                                       :lang :lua
                                       :pattern ["^:%s*lua%s+"
                                                 "^:%s*lua%s*=%s*"
                                                 "^:%s*=%s*"]}
                                 :search_down {:icon " "
                                               :kind :search
                                               :lang :regex
                                               :pattern "^/"}
                                 :search_up {:icon " "
                                             :kind :search
                                             :lang :regex
                                             :pattern "^%?"}}
                        :opts {}
                        :view :cmdline_popup}

             :lsp {:message {
                      :enabled true
                      :view :mini}
                   :signature {:enabled false}}
             :messages {:enabled true
                        :view         :mini
                        :view_error   :mini
                        :view_history :mini
                        :view_search  :mini
                        :view_warn    :mini}
             :notify {:enabled true
                      :view :mini}
             :views {:cmdline_popup {:position {:col "50%"
                                                :row 1}
                                     :size {:width "50%"}}
                     :mini {:align     :center
                            :position {:col "100%"
                                       :row "95%"}
                            :timeout 7000}}})

