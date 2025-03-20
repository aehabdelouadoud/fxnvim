(local telescope (require :telescope))

(telescope.setup {:defaults {:prompt_prefix "   "               ;   
                                   :selection_caret "  "
                                   :sorting_strategy :ascending
                                   :layout_strategy  :horizontal
                                   :layout_config {:height 0.8
                                                   :width  0.8
                                                   :prompt_position :top}}
                                                   :pickers {:colorscheme {:enable_preview :true}}})

