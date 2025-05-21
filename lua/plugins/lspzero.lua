return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",

	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"onsails/lspkind.nvim",
		"hrsh7th/cmp-buffer",
		"folke/neodev.nvim",
		"hrsh7th/nvim-cmp",
	},

	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp");
		local lspconfig = require("lspconfig");
		local lspkind = require("lspkind");
		local cmp = require("cmp");

		-- Extend default capabilities with nvim-cmp
		local capabilities = cmp_nvim_lsp.default_capabilities();

		local function on_attach(_, buf)
			local opts = { noremap = true, silent = true, buffer = buf };

			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts);
			vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts);
			vim.keymap.set("n", "<F3>", vim.lsp.buf.format, opts);
			vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts);
			vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts);
		end

		local signs = { Error = " ", Warn = " ", Hint = "󱩖 ", Info = " " }

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		local default = { capabilities = capabilities, on_attach = on_attach };

		lspconfig.rust_analyzer.setup(default);
		lspconfig.nil_ls.setup(default);
		lspconfig.lua_ls.setup(default);
		lspconfig.clangd.setup(default);
		lspconfig.yamlls.setup(default);
		lspconfig.cssls.setup(default);
		lspconfig.ts_ls.setup(default);
		lspconfig.taplo.setup(default);

		local function close_fallback(fallback)
			cmp.close();
			fallback();
		end

		-- CMP Setup
		cmp.setup({
			window = {
				documentation = cmp.config.window.bordered(),
				completion = cmp.config.window.bordered(),
			},

			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
				}),
			},

			mapping = cmp.mapping.preset.insert({
				["<S-Tab>"]   = cmp.mapping.select_prev_item({ behavior = "select" }),
				["<Tab>"]     = cmp.mapping.select_next_item({ behavior = "select" }),
				["<CR>"]      = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"]     = cmp.mapping.abort(),

				["<Down>"]    = cmp.mapping(close_fallback),
				["<Up>"]      = cmp.mapping(close_fallback),
			}),

			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end
}
