(local map vim.keymap.set)

(when vim.g.neovide
  (fn neovide-scale [amount]
    (let [temp (+ vim.g.neovide_scale_factor amount)]
      (when (< temp 0.5) (lua "return "))
      (set vim.g.neovide_scale_factor temp)))

  (map :n :<C-=> (fn [] (neovide-scale 0.1)))
  (map :n :<C--> (fn [] (neovide-scale (- 0.1))))

  (set vim.g.neovide_fullscreen      false)
  (set vim.g.neovide_cursor_vfx_mode :pixiedust)
  (set vim.g.neovide_hide_mouse_when_typing true)

(local set-padding
  (fn [top left right bottom]
    (set vim.g.neovide_padding_top    top)
    (set vim.g.neovide_padding_left   left)
    (set vim.g.neovide_padding_right  right)
    (set vim.g.neovide_padding_bottom bottom)))

(local padding-style "mini")

(match padding-style
   "nyoom"  (set-padding 45 40 38 20)
   "medium" (set-padding 20 20 20 20)
   "mini"   (set-padding 10 10 10 10)
   "none"   (set-padding 0  0  0  0)
   _        (set-padding 5  5  5  5))) ; Default case

