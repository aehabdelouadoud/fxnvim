; Insert a list of unicode icons.
(set-forcibly! insert_unicode_chars
               (fn []
                 (let [start-code 57344
                       end-code 63744]
                   (for [i start-code end-code]
                     (local hex (string.format "%04x" i))
                     (local char (vim.fn.nr2char i))
                     (local line (.. char " 0x" hex "  \n"))
                     (vim.api.nvim_put [line] :l true true)))))

