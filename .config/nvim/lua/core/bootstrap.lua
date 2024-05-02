local function install_lazy_nvim()
 local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
 end
 vim.opt.rtp:prepend(lazypath)

 require("lazy").setup(plugins, opts)
end

return {
 install_lazy_nvim = install_lazy_nvim, 
}

