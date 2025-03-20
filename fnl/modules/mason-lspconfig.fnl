(local mason (require :mason))
(local mason-lspconfig (require :mason-lspconfig))
(local lspconfig (require :lspconfig))


(. mason :setup)
((. mason-lspconfig :setup) {:ensure_installed [ :lua_ls
                                                 :html
                                                 :cssls
                                                 :marksman
                                                 :bashls
                                                 :vale_ls]})

(local handlers
       {1 (fn [server-name]
            ((. (. (require :lspconfig) server-name) :setup) {}))
        :lua_ls (fn []
                  (local lspconfig (require :lspconfig))
                  (lspconfig.lua_ls.setup {:settings {:Lua {:diagnostics {:globals [:vim]}}}}))})	

((. (require :mason-lspconfig) :setup_handlers) handlers)

; Removing seeing the vim error
((. (require :lspconfig) :fennel_language_server :setup) {:settings {:fennel {:diagnostics {:globals [:vim]}}}})	

((. (require :lspconfig) :harper_ls :setup) {:enabled true
         :filetypes [:markdown]
         :settings {:harper-ls {:isolateEnglish true
                                :linters {:ToDoHyphen false}
                                :markdown {:IgnoreLinkTitle true}
                                :userDictPath "~/github/dotfiles-latest/neovim/neobean/spell/en.utf-8.add"}}})	

; for CSS/HTML didn't understand it to be honest go to: https://www.andersevenrud.net/neovim.github.io/lsp/configurations/cssls/
(local capabilities (vim.lsp.protocol.make_client_capabilities))
(set capabilities.textDocument.completion.completionItem.snippetSupport true)
((. (require :lspconfig) :cssls :setup) {: capabilities})
((. (require :lspconfig) :html :setup) {: capabilities})

