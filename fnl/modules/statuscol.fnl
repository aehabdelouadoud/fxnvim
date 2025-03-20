(local builtin (require :statuscol.builtin))	

((. (require :statuscol) :setup) {:relculright true
                                  :ft-ignore [:neo-tree :neotree :oil]
                                  :segments [{:click "v:lua.ScFa"
                                               :text [(fn []
                                                       (let [foldlevel (vim.fn.foldlevel vim.v.lnum)
                                                                       foldlevel-before (vim.fn.foldlevel (or (and (>= (- vim.v.lnum 1) 1)
                                                                                                                   (- vim.v.lnum 1))
                                                                                                              1))
                                                                       foldlevel-after (vim.fn.foldlevel (or (and (<= (+ vim.v.lnum 1)
                                                                                                                      (vim.fn.line "$"))
                                                                                                                  (+ vim.v.lnum 1))
                                                                                                             (vim.fn.line "$")))
                                                                       foldclosed (vim.fn.foldclosed vim.v.lnum)]
                                                         (when (= foldlevel 0) (lua "return \" \""))
                                                         (when (and (not= foldclosed (- 1)) (= foldclosed vim.v.lnum))
                                                           (lua "return \"\"")) ; ▶ 
                                                         (when (> foldlevel foldlevel-before) (lua "return \"\""));   󰅀
                                                         (when (> foldlevel foldlevel-after) (lua "return \"╰\""))
                                                         "│"))	] ; │╎
                                                :colwidth 2
                                                :maxwidth 2}

                                              {:click "v:lua.ScSa"
                                                :sign {:auto true
                                                :colwidth 2
                                                :maxwidth 1
                                                :namespace [:diagnostic/signs]}}

                                              {:click "v:lua.ScLa"
                                                :text [builtin.lnumfunc]}

                                              {:click "v:lua.ScSa"
                                                :sign {
                                                  :name [".*"]
                                                  :wrap true}}

                                              {:sign {
                                                :colwidth 1
                                                :maxwidth 1
                                                :namespace [:gitsigns]}}]})	

