return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- 1. LUA
        null_ls.builtins.formatting.stylua,

        -- 2. WEB (JS, TS, HTML, CSS, JSON, Markdown)
        null_ls.builtins.formatting.prettier,

        -- 3. RUBY (Your existing config)
        null_ls.builtins.diagnostics.erb_lint,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.rubocop,

        -- 4. PYTHON (Black)
        null_ls.builtins.formatting.black,

        -- 5. GO (Go Imports)
        null_ls.builtins.formatting.goimports,

        -- 6. C / C++ (Clang Format)
        null_ls.builtins.formatting.clang_format,

        -- 7. RUST (Rustfmt)
        null_ls.builtins.formatting.rustfmt,

        -- 8. OCAML (OCamlFormat)
        null_ls.builtins.formatting.ocamlformat,
      },
    })

    -- Shortcut: Space + g + f to format
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
