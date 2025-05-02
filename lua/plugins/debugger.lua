return {
	"rcarriga/nvim-dap-ui",
	event = "BufReadPre",

	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
	},

	keys = {
		{ "<leader>dn", ":DapLaunch<cr>",           mode = "n" },
		{ "<leader>dt", ":DapTerminate<cr>",        mode = "n" },
		{ "<leader>db", ":DapToggleBreakpoint<cr>", mode = "n" },
	},

	config = function()
		local debugger, ui = require("dap"), require("dapui");
		ui.setup();

		debugger.listeners.before.event_terminated.dapui_config = ui.close;
		debugger.listeners.before.event_exited.dapui_config = ui.close;
		debugger.listeners.before.attach.dapui_config = ui.open;
		debugger.listeners.before.launch.dapui_config = ui.open;

		debugger.adapters.lldb = {
			command = "lldb-dap",
			type = "executable",
			name = "lldb",
		};

		local rust_debugger = {
			runInTerminal = false,
			stopOnEntry = false,
			name = "Debug Rust",
			request = "launch",
			type = "lldb",
			args = {},
		};

		vim.api.nvim_create_user_command("DapLaunch", function()
			local output = vim.fn.system("cargo metadata --no-deps --format-version=1");
			local ok, metadata = pcall(vim.fn.json_decode, output);

			if not ok then
				vim.notify("failed to parse cargo.", vim.log.levels.ERROR);
				return;
			end

			local binaries = {};
			local targets = metadata.packages[1].targets;

			for _, target in ipairs(targets) do
				if vim.tbl_contains(target.kind, "bin") then
					local formated_name = string.format("%s %s", "Cargo debug --bin ", target.name);
					table.insert(binaries, formated_name);
				end
			end

			if #binaries == 0 then
				vim.notify("No binaries found", vim.log.levels.WARN);
			end

			vim.ui.select(binaries, { prompt = "Select a binary to debug:" }, function(choice)
				if not choice then return end;

				rust_debugger.program = "target/debug/" .. choice:match("%S+$");
				rust_debugger.cwd = vim.fn.getcwd();

				debugger.run(rust_debugger);
			end);
			--
		end, {})
	end
}
