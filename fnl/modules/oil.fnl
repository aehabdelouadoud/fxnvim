(local oil (require :oil))

(oil.setup {:default_file_explorer true
            :keymaps      {:q           "actions.close"}
            :view_options {:show_hidden true}
            :win_options  {:signcolumn  "number"}})

