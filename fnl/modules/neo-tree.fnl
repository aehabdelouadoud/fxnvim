((. (require :neo-tree) :setup) {:buffers {:follow_current_file {:enabled true
                                                                 :leave_dirs_open false}
                                           :group_empty_dirs true
                                           :show_unloaded true
                                           :window {:mappings {:. :set_root
                                                               :<bs> :navigate_up
                                                               :bd :buffer_delete
                                                               :o {1 :show_help
                                                                   :config {:prefix_key :o
                                                                            :title "Order by"}
                                                                   :nowait false}
                                                               :oc {1 :order_by_created
                                                                    :nowait false}
                                                               :od {1 :order_by_diagnostics
                                                                    :nowait false}
                                                               :om {1 :order_by_modified
                                                                    :nowait false}
                                                               :on {1 :order_by_name
                                                                    :nowait false}
                                                               :os {1 :order_by_size
                                                                    :nowait false}
                                                               :ot {1 :order_by_type
                                                                    :nowait false}}}}
                                 :close_if_last_window false
                                 :commands {}
                                 :default_component_configs {:container {:enable_character_fade true}
                                                             :created {:enabled true
                                                                       :required_width 110}
                                                             :file_size {:enabled true
                                                                         :required_width 64}
                                                             :git_status {:symbols {:added ""
                                                                                    :conflict ""
                                                                                    :deleted "✖"
                                                                                    :ignored ""
                                                                                    :modified ""
                                                                                    :renamed "󰁕"
                                                                                    :staged ""
                                                                                    :unstaged "󰄱"
                                                                                    :untracked ""}}
                                                             :icon {:default "*"
                                                                    :folder_closed ""
                                                                    :folder_empty "󰜌"
                                                                    :folder_open ""
                                                                    :highlight :NeoTreeFileIcon
                                                                    :provider (fn [icon
                                                                                   node
                                                                                   state]
                                                                                (when (or (= node.type
                                                                                             :file)
                                                                                          (= node.type
                                                                                             :terminal))
                                                                                  (local (success web-devicons)
                                                                                         (pcall require
                                                                                                :nvim-web-devicons))
                                                                                  (local name
                                                                                         (or (and (= node.type
                                                                                                     :terminal)
                                                                                                  :terminal)
                                                                                             node.name))
                                                                                  (when success
                                                                                    (local (devicon hl)
                                                                                           (web-devicons.get_icon name))
                                                                                    (set icon.text
                                                                                         (or devicon
                                                                                             icon.text))
                                                                                    (set icon.highlight
                                                                                         (or hl
                                                                                             icon.highlight)))))}
                                                             :indent {:expander_collapsed ""
                                                                      :expander_expanded ""
                                                                      :expander_highlight :NeoTreeExpander
                                                                      :highlight :NeoTreeIndentMarker
                                                                      :indent_marker "│"
                                                                      :indent_size 2
                                                                      :last_indent_marker "└"
                                                                      :padding 1
                                                                      :with_expanders nil
                                                                      :with_markers false}
                                                             :last_modified {:enabled true
                                                                             :required_width 88}
                                                             :modified {:highlight :NeoTreeModified
                                                                        :symbol "[+]"}
                                                             :name {:highlight :NeoTreeFileName
                                                                    :trailing_slash false
                                                                    :use_git_status_colors true}
                                                             :symlink_target {:enabled false}
                                                             :type {:enabled true
                                                                    :required_width 122}}
                                 :enable_diagnostics true
                                 :enable_git_status true
                                 :filesystem {:commands {}
                                              :filtered_items {:always_show {}
                                                               :always_show_by_pattern {}
                                                               :hide_by_name {}
                                                               :hide_by_pattern {}
                                                               :hide_dotfiles true
                                                               :hide_gitignored true
                                                               :hide_hidden true
                                                               :never_show {}
                                                               :never_show_by_pattern {}
                                                               :visible false}
                                              :follow_current_file {:enabled false
                                                                    :leave_dirs_open false}
                                              :group_empty_dirs false
                                              :hijack_netrw_behavior :open_default
                                              :use_libuv_file_watcher false
                                              :window {:fuzzy_finder_mappings {:<C-n> :move_cursor_down
                                                                               :<C-p> :move_cursor_up
                                                                               :<down> :move_cursor_down
                                                                               :<up> :move_cursor_up}
                                                       :mappings {"#" :fuzzy_sorter
                                                                  :. :set_root
                                                                  :/ :fuzzy_finder
                                                                  :<bs> :navigate_up
                                                                  :<c-x> :clear_filter
                                                                  :D :fuzzy_finder_directory
                                                                  :H :toggle_hidden
                                                                  "[g" :prev_git_modified
                                                                  "]g" :next_git_modified
                                                                  :f :filter_on_submit
                                                                  :o {1 :show_help
                                                                      :config {:prefix_key :o
                                                                               :title "Order by"}
                                                                      :nowait false}
                                                                  :oc {1 :order_by_created
                                                                       :nowait false}
                                                                  :od {1 :order_by_diagnostics
                                                                       :nowait false}
                                                                  :og {1 :order_by_git_status
                                                                       :nowait false}
                                                                  :om {1 :order_by_modified
                                                                       :nowait false}
                                                                  :on {1 :order_by_name
                                                                       :nowait false}
                                                                  :os {1 :order_by_size
                                                                       :nowait false}
                                                                  :ot {1 :order_by_type
                                                                       :nowait false}}}}
                                 :git_status {:window {:mappings {:A :git_add_all
                                                                  :ga :git_add_file
                                                                  :gc :git_commit
                                                                  :gg :git_commit_and_push
                                                                  :gp :git_push
                                                                  :gr :git_revert_file
                                                                  :gu :git_unstage_file
                                                                  :o {1 :show_help
                                                                      :config {:prefix_key :o
                                                                               :title "Order by"}
                                                                      :nowait false}
                                                                  :oc {1 :order_by_created
                                                                       :nowait false}
                                                                  :od {1 :order_by_diagnostics
                                                                       :nowait false}
                                                                  :om {1 :order_by_modified
                                                                       :nowait false}
                                                                  :on {1 :order_by_name
                                                                       :nowait false}
                                                                  :os {1 :order_by_size
                                                                       :nowait false}
                                                                  :ot {1 :order_by_type
                                                                       :nowait false}}
                                                       :position :float}}
                                 :nesting_rules {}
                                 :open_files_do_not_replace_types [:terminal
                                                                   :trouble
                                                                   :qf]
                                 :popup_border_style :rounded
                                 :sort_case_insensitive false
                                 :sort_function nil
                                 :window {:mapping_options {:noremap true
                                                            :nowait true}
                                          :mappings {:< :prev_source
                                                     :<2-LeftMouse> :open
                                                     :<cr> :open
                                                     :<esc> :cancel
                                                     :<space> {1 :toggle_node
                                                               :nowait false}
                                                     :> :next_source
                                                     :? :show_help
                                                     :A :add_directory
                                                     :C :close_node
                                                     :P {1 :toggle_preview
                                                         :config {:use_float true
                                                                  :use_image_nvim true}}
                                                     :R :refresh
                                                     :S :open_split
                                                     :a {1 :add
                                                         :config {:show_path :none}}
                                                     :c :copy
                                                     :d :delete
                                                     :i :show_file_details
                                                     :l :focus_preview
                                                     :m :move
                                                     :p :paste_from_clipboard
                                                     :q :close_window
                                                     :r :rename
                                                     :s :open_vsplit
                                                     :t :open_tabnew
                                                     :w :open_with_window_picker
                                                     :x :cut_to_clipboard
                                                     :y :copy_to_clipboard
                                                     :z :close_all_nodes}
                                          :position :left
                                          :width 25}})
