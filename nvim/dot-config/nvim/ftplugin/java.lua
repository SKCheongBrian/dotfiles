local config = {
    cmd = { vim.fn.expand("~/.local/share/nvim/mason/bin/jdtls") },
    -- root_dir = vim.fs.dirname(vim.fs.find({ ".gradlew", ".git", "mvnw" }, { upward = true })[1]),
    root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw' }),
    settings = {
        java = {
            project = {
                sourcePaths = { "." },
                referencedLibraries = { "lib/**/*.jar" },
            },
        },
    },
    init_options = {
        bundles = { vim.fn.glob("/Users/briancheong/.config/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.50.0.jar", 1) },
    },
}
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
require("jdtls").setup_dap()
require("jdtls").start_or_attach(config)
