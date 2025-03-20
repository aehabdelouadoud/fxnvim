(require :core.settings)
(local lazy (require :lazy))

(lazy.setup [
;                                  ╭──────────────╮
;                                  │ Core Plugins │
;                                  ╰──────────────╯

[
{1 :udayvir-singh/tangerine.nvim
   :desc     "Tangerine provides a painless way to add fennel to your config - https://github.com/udayvir-singh/tangerine.nvim"
   :lazy     false
   :priority 1000}

{1 :udayvir-singh/hibiscus.nvim
   :desc  "Highly opinionated macros to elegantly write your neovim config - https://github.com/udayvir-singh/hibiscus.nvim"
   :event :VeryLazy}
]

;                                     ╭────╮
;                                     │ UI │
;                                     ╰────╯

; Colorscheme
:sainnhe/gruvbox-material
:aehabdelouadoud/nebulae.nvim

{1 :nvim-lualine/lualine.nvim
   :dependencies [:nvim-tree/nvim-web-devicons
                  :ofseed/copilot-status.nvim ]
   :event        :VeryLazy
   :init         (fn []
                   (require :modules.lualine))}

{1 :folke/noice.nvim
   :dependencies [{1 :MunifTanjim/nui.nvim
                     :event :VeryLazy}]
   :config (fn [] (require :modules.noice))
   :event  :VeryLazy}

{1 :nvimdev/dashboard-nvim
   :dependencies  [:nvim-tree/nvim-web-devicons
                   {1 :folke/persistence.nvim ;; Not a dependency for the plugin itself but used for it.
                      :event :VeryLazy
                      :config true}]
   :event :VimEnter
   :config (fn [] (require :modules.dashboard))}

{1 :stevearc/oil.nvim
   :dependencies [{1 :echasnovski/mini.icons :opts {}}]
   :config       (fn [] (require :modules.oil))
   :cmd          :Oil}

{1 :luukvbaal/statuscol.nvim
   :Lazy false
   :config (fn [] (require :modules.statuscol))}

;                              ╭───────────────────╮
;                              │ Useful utilities. │
;                              ╰───────────────────╯

{1 :kylechui/nvim-surround
   :config (fn [] ((. (require :nvim-surround) :setup) {}))
   :event :VeryLazy
   :version "*"}

; :szw/vim-maximizer
{1 :declancm/maximize.nvim :config true}	
:sindrets/winshift.nvim

; TODO: Find an alternative

; {1 :ecthelionvi/NeoView.nvim ;; plugin that allows users to save and restore their views and cursor positions across sessions. (archived but still works) https://github.com/ecthelionvi/NeoView.nvim
;    :config true}

{1 :brenoprata10/nvim-highlight-colors ;; https://github.com/brenoprata10/nvim-highlight-colors
   :event :VeryLazy
   :opts {:render :virtual}}

{1 :RRethy/vim-illuminate
:config (fn []
          (require :modules.vim-illuminate))}

:folke/which-key.nvim

{1 :akinsho/toggleterm.nvim
   :version "*"
   :event   :VeryLazy
   :config  true}	

{1 :numToStr/Comment.nvim
   :event  :InsertEnter
   :config true}	

{1 :danymat/neogen
   :opts { :snippet_engine :luasnip}}	

{1 :jesseleite/vim-noh ;; A vim plugin for automatically clearing search highlighting when cursor is moved.
   :event :VeryLazy}

{1 :folke/todo-comments.nvim
   :event        :BufReadPost
   :config true
   :dependencies [:nvim-lua/plenary.nvim
                  {1 :folke/trouble.nvim
                     :config true}]}

{1 :echasnovski/mini.align
   :event :VeryLazy}

{1 :dstein64/vim-startuptime
   :event  :VeryLazy}

{1 :windwp/nvim-autopairs
   :config true
   :event  :InsertEnter}	

{1 :smoka7/hop.nvim :opts {:keys :etovxqpdygfblzhckisuran} :version "*"}

{1 :smoka7/multicursors.nvim
   :cmd [:MCstart :MCvisual :MCclear :MCpattern :MCvisualPattern :MCunderCursor]
   :dependencies :nvimtools/hydra.nvim
   :event :BufReadPost
   :keys [{1 :<Leader>c
           2 :<cmd>MCunderCursor<cr>
          :desc "Create a selection for selected text or word under the cursor"
          :mode [:v :n]}]
   :config true}	


;                                 ╭────────────╮
;                                 │ Telescope. │
;                                 ╰────────────╯

{1 :nvim-telescope/telescope.nvim
   :tag          :0.1.8
   :event        :VeryLazy
   :dependencies [ :nvim-lua/plenary.nvim
                   ; Telescope extensions
                   {1 :nvim-telescope/telescope-project.nvim
                      :event :VeryLazy}]
   :config (fn [] (require :modules.telescope))}

;                                 ╭─────────────╮
;                                 │ Completion. │
;                                 ╰─────────────╯

{1 :hrsh7th/nvim-cmp
   :dependencies [ :hrsh7th/cmp-buffer
                   :hrsh7th/cmp-cmdline
                   :hrsh7th/cmp-path
                   :f3fora/cmp-spell
                   ; :tzachar/cmp-ai
                   :hrsh7th/cmp-nvim-lsp-signature-help
                   :neovim/nvim-lspconfig
                   :hrsh7th/cmp-nvim-lsp
                   :hrsh7th/cmp-nvim-lua
                   {1 :L3MON4D3/LuaSnip
                      :build "make install_jsregexp"
                      :version :v2.*}
                   :saadparwaiz1/cmp_luasnip
                   :rafamadriz/friendly-snippets
                   :onsails/lspkind.nvim]
   :event  :InsertEnter
   :config (fn [] (require :modules.cmp))}

;                                  ╭──────────╮
;                                  │ Org Mode │
;                                  ╰──────────╯

{1 :Zeioth/markmap.nvim
   :build "yarn global add markmap-cli"
   :cmd [:MarkmapOpen
         :MarkmapSave
         :MarkmapWatch
         :MarkmapWatchStop]
   :config (fn [_ opts] ((. (require :markmap) :setup) opts))
   :opts {:grace_period 3600000
          :hide_toolbar false
          :html_output  :/tmp/markmap.html}}	

[
{1 :iamcco/markdown-preview.nvim
  :build ":cal mkdp#util#install()"
  :cmd [:MarkdownPreviewToggle :MarkdownPreview :MarkdownPreviewStop]
  :ft [:markdown]}

 {1 :parsifa1/markdown-typmath.nvim
  :config (fn [] ((. (require :typmath) :setup)))
  :enabled false
  :ft :markdown}

 {1 :MeanderingProgrammer/render-markdown.nvim
  :ft [:markdown :Avante]
  :opts {:file_types [:markdown :Avante]}}
]


; {1 :OXY2DEV/markview.nvim
;    :lazy true}

;; mason-lspconfig.
{1 :williamboman/mason-lspconfig.nvim
   :dependencies [ {1 :williamboman/mason.nvim
                      :event :VeryLazy
                      :config true}
                      {1 :neovim/nvim-lspconfig
                      :event :VeryLazy}]
   :after [ :williamboman/mason.nvim]
   :even  :VeryLazy
   :config (fn [] (require :modules.mason-lspconfig))}

;; Language servers.

{1 :hinell/lsp-timeout.nvim
   :desc "Automatically start/stop idle/unused LSP servers; keeps RAM usage low. [https://github.com/hinell/lsp-timeout.nvim]"
   :dependencies :neovim/nvim-lspconfig
   :event        :VeryLazy
   :after        :neovim/nvim-lspconfig}

{1 "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
   :event :BufWinEnter}

;                                 ╭─────────────╮
;                                 │ Tree-sitter │
;                                 ╰─────────────╯

{1 :nvim-treesitter/nvim-treesitter
   :build  ":TSUpdate"
   :config (fn [] (require :modules.treesitter))
   :event  :BufWinEnter}	

;                                ╭──────────────╮
;                                │ Experimental │
;                                ╰──────────────╯

{1 :fnune/recall.nvim
   :config true}

; {1 :b0o/incline.nvim
;    :event [:BufReadPost :BufAdd :BufNewFile]
;    :config (fn []
;              (require :modules.incline))}

;; Plantuml
:aklt/plantuml-syntax
{1 "https://gitlab.com/itaranto/plantuml.nvim"
   :opts {:render_on_write true
   :renderer {:options {:dark_mode false
                        :format nil
                        :prog :feh}
              :type :image}}
   :version "*"}

 {1 :ptdewey/pendulum-nvim
    :config (fn []
              ((. (require :pendulum) :setup) {:gen_reports true
                                                    :log_file    (vim.fn.expand :$HOME/.pendulum.csv)
                                                    :timeout_len 300
                                                    :timer_len   60
                                                    :top_n       10}))}

    ;; Git
 ; :sindrets/diffview.nvim
 {1 :lewis6991/gitsigns.nvim
    :opts {:signs {:add          {:text "┃"} ; │
                   :change       {:text "┃"}
                   :changedelete {:text "~"}
                   :delete       {:text "_"}
                   :topdelete    {:text "‾"} ; ‾
                   :untracked    {:text "┆"}}
           :signs_staged {:add          {:text "┃"}
                          :change       {:text "┃"}
                          :changedelete {:text "~"}
                          :delete       {:text "_"}
                          :topdelete    {:text "‾"}
                          :untracked    {:text "┆"}}}}

 {1 :isakbm/gitgraph.nvim
       :keys [{1 :<leader>gl
                 2 (fn []
                     ((. (require :gitgraph) :draw) {} {:all true :max_count 5000}))
                 :desc "GitGraph - Draw"}]
       :opts {:format {:fields [:hash :timestamp :author :branch_name :tag]
       :timestamp "%H:%M:%S %d-%m-%Y"}
       :hooks {:on_select_commit (fn [commit]
                                   (print "selected commit:" commit.hash))
       :on_select_range_commit (fn [from to]
                                 (print "selected range:" from.hash
                                        to.hash))}
       :symbols {:commit "*" :merge_commit :M}}}	

{1 :SuperBo/fugit2.nvim
   :cmd [:Fugit2 :Fugit2Diff :Fugit2Graph]
   :dependencies [:MunifTanjim/nui.nvim
                  :nvim-tree/nvim-web-devicons
                  :nvim-lua/plenary.nvim
                  {1 :chrisgrieser/nvim-tinygit
                     :dependencies [:stevearc/dressing.nvim]}]
    :keys [{1 :<leader>f 2 :<cmd>Fugit2<cr> :mode :n :desc "Open Fugit2 GUI"}] ;TODO: add A better dsc
    :opts {:width 150
           :height 30}}	

{1 :kevinhwang91/nvim-ufo
   :dependencies :kevinhwang91/promise-async
   :config (fn []
             (require :modules.ufo))}

{1 :LudoPinelli/comment-box.nvim
      :Lazy :VeryLazy}

{1 :nvim-neorg/neorg
    :lazy false
    :version "*"
    :config (fn [] ((. (require :neorg) :setup) {:load {:core.concealer {:config {:icon_preset :varied}} :core.defaults {}}}))}

{1 :akinsho/flutter-tools.nvim
    :config true
    :dependencies [:nvim-lua/plenary.nvim :stevearc/dressing.nvim]
    :lazy false}	

{1 :Bekaboo/dropbar.nvim
    :dependencies {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}}	

{1 :asiryk/auto-hlsearch.nvim
   :lazy false}

:Civitasv/cmake-tools.nvim
:Shatur/neovim-cmake
; :wakatime/vim-wakatime
{1 :karb94/neoscroll.nvim
   :config (fn []
             ((. (require :neoscroll) :setup) {}))}
{1 :ray-x/web-tools.nvim
   :Lazy   :VeryLazy
   :config true}
{1 :windwp/nvim-ts-autotag
   :config (fn []
             ((. (require :nvim-ts-autotag) :setup) {:opts {:enable_close true
                                                            :enable_close_on_slash false
                                                            :enable_rename true}
                                                     :per_filetype {:html {:enable_close false}}}))
   :lazy :VeryLazy}


{1 :folke/zen-mode.nvim
   :dependencies [:folke/twilight.nvim]
   :Lazy :VeryLazy
   :opts {
     :on_close (fn []
                 (vim.cmd "echo 'ZenMode disabled'")
                 (vim.cmd "lua require('lualine').hide({unhide = true})")  ; Unhide lualine
                 (set vim.wo.relativenumber true)
                 (set vim.wo.number true)
                 (set vim.opt.laststatus 3)
                 (set vim.wo.foldenable true))

     :on_open (fn []
                (vim.cmd "echo 'ZenMode enabled'")
                (vim.cmd "lua require('lualine').hide()")  ; Hide lualine
                (set vim.wo.number false)
                (set vim.wo.relativenumber false)
                (set vim.wo.foldenable false))}}

{1 :ziontee113/color-picker.nvim
   :config true}
{1 :neph-iap/easycolor.nvim
   :dependencies [:stevearc/dressing.nvim]
   :lazy :VeryLazy
   :config true}

   {1 :stevearc/conform.nvim
   :config (fn []
             (require :modules.conform)) 
   :event [:BufReadPre :BufNewFile]}

{1 :mfussenegger/nvim-lint
   :config (fn []
             (require :modules.lint))
   :event [:BufReadPre :BufNewFile]}

{1 :CRAG666/code_runner.nvim
   :config (fn []
             (require :modules.code_runner))}

{1 :rcarriga/nvim-notify
   :config true}

{1 :arminveres/md-pdf.nvim
   :branch :main
   :keys [{1 "<leader>,"
           2 (fn []
               ((. (require :md-pdf) :convert_md_to_pdf)))
           :desc "Markdown preview"}]
   :lazy true
   :opts {}}

{1 :lervag/vimtex
   :init (fn []
           (set vim.g.vimtex_view_method :zathura)
           (set vim.g.vimtex_compiler_method :xelatex))
   :lazy false}

;; Debugging
; :mfussenegger/nvim-dap
; :rcarriga/nvim-dap-ui
; :jay-babu/mason-nvim-dap.nvim
; :Weissle/persistent-breakpoints.nvim

{1 :stevearc/aerial.nvim
   :dependencies [:nvim-treesitter/nvim-treesitter :nvim-tree/nvim-web-devicons]
   :opts {}}	

{1 :fedepujol/move.nvim :opts {}}
{1 :mrcjkb/rustaceanvim :lazy false :version :^5}


{1 :nvim-flutter/flutter-tools.nvim
   :config true
   :dependencies [:nvim-lua/plenary.nvim :stevearc/dressing.nvim]
   :lazy false}

{1 :ariedov/android-nvim
   :config (fn []
             ((. (require :android-nvim) :setup)))}	

{1 :derektata/lorem.nvim
   :config (fn []
            ((. (require :lorem) :opts) {:comma_chance 0.2
                                         :max_commas_per_sentence 2
                                         :sentenceLength :medium}))}

{1 :lukas-reineke/virt-column.nvim
   :opts {:char "│"}}

{1 :lukas-reineke/indent-blankline.nvim
   :main :ibl 
   :opts {:indent { :char "│" }
          :exclude {:filetypes ["dashboard"
                                "leetcode.nvim"
                                "fennel"]}}}

{1 :kawre/leetcode.nvim
   :build ":TSUpdate html"
   :dependencies [:nvim-telescope/telescope.nvim
                :nvim-lua/plenary.nvim
                :MunifTanjim/nui.nvim]
   :opts {:theme {:normal {:fg "#CCAD8D"}}}}

{1 :xeluxee/competitest.nvim
   :config (fn [] ((. (require :competitest) :setup)))
   :dependencies :MunifTanjim/nui.nvim}

{1 :github/copilot.vim
   :event [:BufNewFile :BufReadPost]}

{1 :f-person/git-blame.nvim
   :config true}

{1 :mfussenegger/nvim-dap
   :lazy false
   :config (fn [] (require :modules.nvim-dap))
   :dependencies [:rcarriga/nvim-dap-ui :theHamsta/nvim-dap-virtual-text]
   :ft [:cpp]
   :keys [{1 :<F8>
           2 (fn []
               ((. (require :dap) :toggle_breakpoint)))
           :desc "Debug: Toggle breakpoint"}
          {1 :<F9>
           2 (fn []
               ((. (require :dap) :continue)))
           :desc "Debug: Continue"}
          {1 :<F10>
           2 (fn []
               ((. (require :dap) :step_into)))
           :desc "Debug: Step into"}
          {1 :<F11>
           2 (fn []
               ((. (require :dap) :step_over)))
           :desc "Debug: Step over"}
          {1 :<F12>
           2 (fn []
               ((. (require :dap) :step_out)))
           :desc "Debug: Step out"}
          {1 :<leader>db
           2 (fn []
               ((. (require :dap) :set_breakpoint) (vim.fn.input "Breakpoint condition: ")))
           :desc "Set breakpoint"}
          {1 :<leader>dp
           2 (fn []
               ((. (require :dap) :set_breakpoint) nil nil
                                                   (vim.fn.input "Log point message: ")))
           :desc "Set log point"}
          {1 :<leader>dr
           2 (fn []
               ((. (require :dap) :repl :toggle)))
           :desc "Toggle REPL"}
          {1 :<leader>dl
           2 (fn []
               ((. (require :dap) :run_last)))
           :desc "Run last"}]
   :specs [:nvim-neotest/nvim-nio]}	

; {1 :yetone/avante.nvim
;    :build :make
;    :dependencies [:nvim-treesitter/nvim-treesitter
;                   :stevearc/dressing.nvim
;                   :nvim-lua/plenary.nvim
;                   :MunifTanjim/nui.nvim
;                   :nvim-tree/nvim-web-devicons
;                   :zbirenbaum/copilot.lua
;                   {1 :HakonHarnes/img-clip.nvim
;                    :event :VeryLazy
;                    :opts {:default {:drag_and_drop {:insert_mode true}
;                                     :embed_image_as_base64 false
;                                     :prompt_for_file_name false
;                                     :use_absolute_path true}}}
;                   {1 :MeanderingProgrammer/render-markdown.nvim
;                      :ft [:markdown :Avante]
;                      :opts {:file_types [:markdown :Avante]}}]
;    :event :VeryLazy
;    :lazy false
;    :opts {:provider :deepseek
;           :vendors {:deepseek {:__inherited_from :openai
;                                :api_key_name :DEEPSEEK_API_KEY
;                                :endpoint "https://api.deepseek.com"
;                                :model :deepseek-coder}}}
;    :version false}

; [{1 :FabijanZulj/blame.nvim
;   :config (fn []
;             ((. (require :blame) :setup) {}))
;   :lazy false}]	

; :hsanson/vim-android

; {1 :nvim-orgmode/orgmode
;    :config (fn []
;               ((. (require :orgmode) :setup) {:org_agenda_files "~/orgfiles/**/*"
;                                              :org_default_notes_file "~/orgfiles/refile.org"}))
;    :event :VeryLazy
;    :ft   [:org]}

; {1 :nvim-neo-tree/neo-tree.nvim 
;    :Lazy :VeryLazy
;    :branch :v3.x
;    :dependencies [:nvim-lua/plenary.nvim
;                                 :nvim-tree/nvim-web-devicons
;                                 :MunifTanjim/nui.nvim]
;    :config (fn []
;              (require :modules.neo-tree))}

; {1 :nvimdev/lspsaga.nvim
;    :Event :LspAttach
;    :config true
;    :dependencies [:nvim-treesitter/nvim-treesitter
;                   :nvim-tree/nvim-web-devicons]}
; {1 :echasnovski/mini.indentscope
;    :version "*"
;    :opts    {:symbol "│"}; │
;    :event   :BufReadPost}

; {1 :zbirenbaum/copilot.lua
;    :cmd :Copilot
;    :config (fn []
;              ((. (require :copilot) :setup) {}))
;    :event :InsertEnter}	

; {1 :monkoose/neocodeium
;    :config (fn [] (local neocodeium (require :neocodeium)) (neocodeium.setup)
;            (vim.keymap.set :i :<A-c> neocodeium.accept))
;    :event :VeryLazy}

;{1 :Bekaboo/deadcolumn.nvim
;   :config true}

; {1 :refractalize/oil-git-status.nvim
;    :config true
;    :dependencies [:stevearc/oil.nvim]}

;{1 :stevearc/dressing.nvim
;   :event :VeryLazy}

;{1 :ecthelionvi/NeoColumn.nvim
;   :opts {}}	

; {1 :hrsh7th/nvim-cmp
;                               :dependencies [:Jezda1337/nvim-html-css]
;                               :opts {:sources [{:name :html-css
;                                                 :option {:documentation {:auto_show true}
;                                                          :enable_on [:html]
;                                                          :notify false
;                                                          :style_sheets ["https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
;                                                                         "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css"]}}]}}
] ;; End of plugins.

{:checker {:enabled true}
:install {:colorscheme [:gruvbox-material]}})

(require :core.neovide)
(require :core.keymaps)
(require :core.autocommands)
(require :core.ui)

