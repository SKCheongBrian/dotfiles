local config = {
  cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
  root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
  init_options = {
    bundles = { vim.fn.glob("/Users/briancheong/.config/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.50.0.jar", 1) },
  },
}
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
require("jdtls").setup_dap()
require("jdtls").start_or_attach(config)

