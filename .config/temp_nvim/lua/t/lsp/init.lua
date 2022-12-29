local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("t.lsp.mason")
require("t.lsp.handlers").setup()
require("t.lsp.null-ls")
