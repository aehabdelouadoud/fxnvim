((. (require :code_runner) :setup) {:filetype {:c (fn [...]
                                                    (global c-base
                                                            ["cd $dir &&"
                                                             "gcc $fileName -o"
                                                             :/tmp/$fileNameWithoutExt])
                                                    (local c-exec
                                                           ["&& /tmp/$fileNameWithoutExt &&"
                                                            "rm /tmp/$fileNameWithoutExt"])
                                                    (vim.ui.input {:prompt "Add more args:"}
                                                                  (fn [input]
                                                                    (tset c-base
                                                                          4
                                                                          input)
                                                                    (vim.print (vim.tbl_extend :force
                                                                                               c-base
                                                                                               c-exec))
                                                                    ((. (require :code_runner.commands)
                                                                        :run_from_fn) (vim.list_extend c-base
                                                                        c-exec)))))
                                   :java ["cd $dir &&"
                                          "javac $fileName &&"
                                          "java $fileNameWithoutExt"]
                                   :python "python3 -u"
                                   :fennel "fennel *.fnl"
                                   :go "go run main.go"
                                   ; :rust ["cd $dir &&"
                                   ;        "rustc $fileName &&"
                                   ;        :$dir/$fileNameWithoutExt]
                                   :rust "cargo run"
                                   :typescript "deno run"}})	

