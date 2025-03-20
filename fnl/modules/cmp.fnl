; Set up the 'cmp' plugin
(local cmp (require :cmp))
; Set up the 'luasnip' plugin
(local luasnip (require :luasnip))	

((. (require :luasnip.loaders.from_vscode) :lazy_load))	

; General setup for 'cmp'
(cmp.setup {:mapping (cmp.mapping.preset.insert {; Map <C-k> to select previous item
                                                :<C-k> (cmp.mapping.select_prev_item)
                                                ; Map <C-k> to select next item
                                                :<C-j> (cmp.mapping.select_next_item)
                                                ; Trigger completion menu
                                                :<C-Space> (cmp.mapping.complete)
                                                ; Scroll up in documentation
                                                :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                ; Abort completion
                                                :<C-e> (cmp.mapping.abort)
                                                ; Scroll down in documentation
                                                :<C-f> (cmp.mapping.scroll_docs 4)
                                                ; Confirm selection (use <TAB> to select the first item)
                                                :<TAB> (cmp.mapping.confirm {:select true})
                                                :<CR> (cmp.mapping (fn [fallback]
                                                                     (if (cmp.visible)
                                                                         (if (luasnip.expandable)
                                                                             (luasnip.expand)
                                                                             (cmp.confirm {:select true}))
                                                                         (fallback))))
                                                :<S-Tab> (cmp.mapping (fn [fallback]
                                                                        (if (cmp.visible)
                                                                            (cmp.select_prev_item)
                                                                            (luasnip.locally_jumpable (- 1))
                                                                            (luasnip.jump (- 1)) (fallback)))
                                                                      [:i :s])
                                                :<Tab> (cmp.mapping (fn [fallback]
                                                                      (if (cmp.visible) (cmp.select_next_item)
                                                                          (luasnip.locally_jumpable 1) (luasnip.jump 1)
                                                                          (fallback)))
                                                                    [:i :s])})
           ; Snippet expansion (using luasnip)
           :snippet [{:expand (fn [args]
                                 ((. (require :luasnip) :lsp_expand) args.body))}]
           ; Completion sources configuration
           :sources (cmp.config.sources [{:name :nvim_lsp}
                                         ; {:name :copilot}
                                         {:name :luasnip}
                                         {:name :buffer}
                                         {:name :path}
                                         ; {:name :cmp_ai}
                                         {:name :spell
                                                :option {:enable_in_context (fn [] true)
                                                :keep_all_entries false
                                                :preselect_correct_word true}}])
           :experimental {:ghost_text true}

           ; Configure completion window
           :formatting {:fields [:kind
                                 :abbr
                                 :menu]
                        :format (fn [entry vim-item]
                                  (local kind
                                         (((. (require :lspkind) :cmp_format) {:maxwidth 50
                                                                               :mode
                                                                               :symbol_text}) entry
                                          vim-item))
                                  (local strings
                                         (vim.split kind.kind "%s" {:trimempty true}))
                                         (set kind.kind (.. " " (or (. strings 1) "") " "))
                                         (set kind.menu (.. "    (" (or (. strings 2) "") ")"))
                                  kind)}
           :window {:completion {:col_offset (- 3)
           :side_padding 0
           :winhighlight "Normal:Pmenu,FloatBorder:Pmenu,Search:None"}}})	

; Setup completion for command-line mode (search commands)
(cmp.setup.cmdline "/" {:mapping (cmp.mapping.preset.cmdline)
                   ; Source for buffer completions
                   :sources [{:name :buffer}]})	

; Setup completion for command-line mode (commands)
(cmp.setup.cmdline ":"
                   {:mapping (cmp.mapping.preset.cmdline)
                   ; Sources for path and command-line commands
                   :sources (cmp.config.sources [{:name :path}]
                                                [{:name :cmdline
                                                        :option {:ignore_cmds [:Man
                                                                                "!"]}}])})	


