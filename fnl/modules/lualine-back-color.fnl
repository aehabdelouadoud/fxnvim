;; LINK: https://github.com/nvim-lualine/lualine.nvim

(local lualine (require :lualine))

(local gruvbox-material {:color2   "#504945"
                         :color3   "#32302f"
                         :color4   "#a89984"
                         :blue   "#7daea3"
                         :green  "#a9b665"
                         :orange "#d8a657"
                         :violet "#d3869b"
                         :cyan   "#8ec07c"
                         :red    "#ea6962"
                         :bg       "#282828"
                         :fg2      "#ddc7a1"})

(local oxocarbon {:color2   "#161616"
                  :color3   "#262626"
                  :color4   "#393939"
                  :blue   "#78a9ff"
                  :green  "#42be65"
                  :orange "#82cfff"
                  :violet "#ff7eb6"
                  :cyan   "#3ddbd9"
                  :red    "#ee5396"
                  :bg       "#161616"
                  :fg2      "#dde1e6"})

(local colors oxocarbon)

(local conditions
       {:buffer_not_empty (fn []
                            (not= (vim.fn.empty (vim.fn.expand "%:t")) 1))
       :check_git_workspace (fn []
                              (local filepath (vim.fn.expand "%:p:h"))
                              (local gitdir
                                     (vim.fn.finddir :.git (.. filepath ";")))
                              (and (and gitdir (> (length gitdir) 0))
                                   (< (length gitdir) (length filepath))))
       :hide_in_width (fn [] (> (vim.fn.winwidth 0) 80))})
(local config { 
       :inactive_sections {:lualine_a {}
                           :lualine_b {}
                           :lualine_c {}
                           :lualine_x {}
                           :lualine_y {}
                           :lualine_z {}}
       :sections {:lualine_a {}
                  :lualine_b {}
                  :lualine_c {}
                  :lualine_x {}
                  :lualine_y {}
                  :lualine_z {}}

       :options {:component_separators ""
                 :section_separators   ""
                 :theme {:inactive {:c {:bg colors.bg :fg colors.fg}}
                         :normal   {:c {:bg colors.bg :fg colors.fg}}}
                 :disabled_filetypes {:statusline [ "dashboard"
                                                    "alpha"
                                                    "oil"
                                                    "neo-tree" ]}}})

(fn ins-left [component] (table.insert config.sections.lualine_c component))

(fn ins-right [component] (table.insert config.sections.lualine_x component))

; (ins-left {1 (fn [] "▊")
;           :color {:fg colors.fg2}
;           :padding {:left 0 :right 1}})

(ins-left {1 (fn [] "")
          :color (fn []
                   (local mode-color
                          {"\019" colors.orange
                          "\022"  colors.blue
                          :!      colors.fg2
                          :R      colors.violet
                          :Rv     colors.violet
                          :S      colors.orange
                          :V      colors.blue
                          :c      colors.magenta
                          :ce     colors.fg2
                          :cv     colors.fg2
                          :i      colors.green
                          :ic     colors.yellow
                          :n      colors.fg2
                          :no     colors.fg2
                          :r      colors.cyan
                          :r?     colors.cyan
                          :rm     colors.cyan
                          :s      colors.orange
                          :t      colors.fg2
                          :v      colors.blue})
                   {:fg (. mode-color (vim.fn.mode))})
          :padding {:right 1}})

; (ins-left {1 :filesize :cond conditions.buffer_not_empty})

(ins-left {1 :filename
          :color {:fg colors.magenta :gui :bold}
          :symbols {
                :modified ""; 
                :readonly ""; 
                :unnamed ""
                :newfile ""}
          :cond conditions.buffer_not_empty})

; (ins-left [:location])

; (ins-left {1 :progress :color {:fg colors.fg :gui :bold}})

(ins-left {1 :diagnostics
          :diagnostics_color {:error {:fg colors.red}
                              :hint  {:fg colors.blue}
                              :info  {:fg colors.cyan}
                              :warn  {:fg colors.yellow}}
          :sources [:nvim_diagnostic]
          :symbols {:error " " :hint " " :info " " :warn " "}})

(ins-left [(fn [] "%=")])

(ins-left {1 (fn []
               (let [msg "No Active Lsp"
                         buf-ft (vim.api.nvim_buf_get_option 0 :filetype)
                         clients (vim.lsp.get_active_clients)]
                 (when (= (next clients) nil) (lua "return msg"))
                 (each [_ client (ipairs clients)]
                   (local filetypes client.config.filetypes)
                   (when (and filetypes
                              (not= (vim.fn.index filetypes buf-ft) (- 1)))
                     (let [___antifnl_rtn_1___ client.name]
                       (lua "return ___antifnl_rtn_1___"))))
                 msg))
          :color {:fg colors.color4 :gui :bold}
          :icon " :"})

; 

; {1 (fn [] (.. "Lines: " (vim.fn.line "$")))
;  :color {:fg :green :gui :bold}
;  :cond conditions.hide_in_width
;  :fmt string.upper}
;
(ins-right {1 (fn [] (.. " " (vim.fn.line "$"))) 
              :color {:fg colors.blue}
              :cond  conditions.buffer_not_empty})

; (ins-right {1 "o:encoding"
;               :color {:fg colors.green :gui :bold}
;               :cond  conditions.hide_in_width
;               :fmt   string.upper})

; (ins-right {1 :fileformat
;               :color         {:fg colors.green :gui :bold}
;               :fmt           string.upper
;               :icons_enabled false})

(ins-right {1 :branch :color {:fg colors.violet :gui :bold} :icon ""}) ;     

(ins-right {1 :diff
              :cond conditions.hide_in_width
              :diff_color {:added    {:fg colors.green}
                           :modified {:fg colors.orange}
                           :removed  {:fg colors.red}}
              :symbols {:added " " :modified "󰝤 " :removed " "}})

; (ins-right {1 (fn [] "▊") :color {:fg colors.fg2} :padding {:left 1}})

(lualine.setup config)	

