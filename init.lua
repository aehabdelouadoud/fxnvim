-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


local function bootstrap(url, ref)
  local name = url:gsub(".*/", "")
  local path = vim.fn.stdpath [[data]] .. "/lazy/" .. name

  if vim.fn.isdirectory(path) == 0 then
    print(name .. ": installing in data dir...")

    vim.fn.system { "git", "clone", url, path }
    if ref then
      vim.fn.system { "git", "-C", path, "checkout", ref }
    end

    vim.cmd [[redraw]]
    print(name .. ": finished installing")
  end
  vim.opt.runtimepath:prepend(path)
end

bootstrap("https://github.com/udayvir-singh/tangerine.nvim")

-- Optional and only needed if you also want the macros
bootstrap("https://github.com/udayvir-singh/hibiscus.nvim")

require 'tangerine'.setup {
  target = vim.fn.stdpath [[data]] .. "/tangerine",

  -- compile files in &rtp
  rtpdirs = {
    "ftplugin",
  },

  compiler = {
    -- disable popup showing compiled files
    verbose = false,
    -- compile every time changes are made to fennel files or on entering vim
    hooks = { "onsave", "oninit" }
  },
}
