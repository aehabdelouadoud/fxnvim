; (vim.fn.sign_define :DapBreakpoint          {:text ""})
(vim.fn.sign_define :DapBreakpoint          {:text "" :texthl :DiagnosticError})
(vim.fn.sign_define :DapLogPoint            {:text "" :texthl :DiagnosticInfo})
(vim.fn.sign_define :DapStopped             {:text "" :texthl :Constant})
(vim.fn.sign_define :DapBreakpointRejected  {:text ""})
(vim.fn.sign_define :DapBreakpointCondition {:text ""})


(local dap (require :dap))
(set dap.adapters.codelldb {:command :codelldb :type :executable})
(set dap.configurations.cpp [{:breakpointMode :file
                              :cwd            "${fileDirname}"
                              :name           "Launch file"
                              :program (fn []
                                         (vim.cmd "cd %:h")
                                         (vim.cmd "silent w !g++ %:t -g -std=c++20 -o bin/%:t:r")
                                         (local file-name
                                                (vim.fn.bufname (vim.api.nvim_get_current_buf)))
                                         (local file-name-without-path
                                                (vim.fn.fnamemodify file-name
                                                                    ":t"))
                                         (local file-directory
                                                (vim.fn.expand "%:p:h"))
                                         (when (not= file-name-without-path 0)
                                           (.. file-directory :/bin/
                                               (file-name-without-path:gsub "%.cpp$"
                                                                            ""))))
                              :request     :launch
                              :stopAtEntry true
                              :type        :codelldb}])

(set dap.configurations.c "dap.configurations.cpp")

(local dapui (require :dapui))
(dapui.setup {})


(fn dap.listeners.after.event_initialized.dapui_config [] (dapui.open  {}))
(fn dap.listeners.before.event_terminated.dapui_config [] (dapui.close {}))
(fn dap.listeners.before.event_exited.dapui_config     [] (dapui.close {}))	

