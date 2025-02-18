-- require("neocord").setup({
--     logo                = "auto",                     -- "auto" or url
--     logo_tooltip        = nil,                        -- nil or string
--     main_image          = "language",                 -- "language" or "logo"
--     client_id           = "1157438221865717891",      -- Use your own Discord application client id (not recommended)
--     log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
--     debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
--     blacklist           = {},                         -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
--     file_assets         = require("presence.file_assets"),                         -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
--     show_time           = true,                       -- Show the timer
--     global_timer        = false,                      -- if set true, timer won't update when any event are triggered

--     -- Rich Presence text options
--     editing_text        = "Writing %s",               -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
--     file_explorer_text  = "Browsing %s",              -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
--     git_commit_text     = "Committing changes",       -- Format string rendered when committing changes in git (either string or function(filename: string): string)
--     plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
--     reading_text        = "Reading %s",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
--     workspace_text      = "Working on %s",            -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
--     line_number_text    = "Line %s out of %s",        -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
--     terminal_text       = "Using Terminal",           -- Format string rendered when in terminal mode.})
-- })
require('cord').setup({
    enabled = true,
    log_level = vim.log.levels.OFF,
    editor = {
        client = 'neovim',
        tooltip = 'Neovim',
        icon = nil,
    },
    display = {
        theme = 'onyx',
        swap_fields = false,
        swap_icons = false,
    },
    timestamp = {
        enabled = true,
        reset_on_idle = false,
        reset_on_change = false,
    },
    idle = {
        enabled = true,
        timeout = 300000,
        show_status = true,
        ignore_focus = true,
        unidle_on_focus = false,
        smart_idle = true,
        details = 'Idling...',
        state = nil,
        tooltip = '💤',
        icon = nil,
    },
    text = {
        workspace = function(opts) return 'In workspace ' .. opts.workspace end,
        viewing = function(opts) return 'Viewing ' .. opts.filename end,
        editing = function(opts) return 'Writing ' .. opts.filename end,
        file_browser = function(opts) return 'Browsing files in ' .. opts.name end,
        plugin_manager = function(opts) return 'Managing plugins in ' .. opts.name end,
        lsp = function(opts) return 'Configuring LSP in ' .. opts.name end,
        docs = function(opts) return 'Reading ' .. opts.name end,
        vcs = function(opts) return 'Committing changes in ' .. opts.name end,
        notes = function(opts) return 'Taking notes in ' .. opts.name end,
        debug = function(opts) return 'Debugging in ' .. opts.name end,
        test = function(opts) return 'Testing in ' .. opts.name end,
        diagnostics = function(opts) return 'Fixing problems in ' .. opts.name end,
        games = function(opts) return 'Playing ' .. opts.name end,
        terminal = function(opts) return 'Running commands in ' .. opts.name end,
        dashboard = 'Home',
    },
    -- buttons = nil,
    buttons = {
        {
            label = 'View Repository',
            url = function(opts) return opts.repo_url end,
        },
    },
    assets = {
        ['.sv'] = {
            icon = require('cord.api.icon').get('v'),
            tooltip = "SystemVerilog",
            type="language"
        }
    },
    variables = nil,
    hooks = {
        ready = nil,
        shutdown = nil,
        pre_activity = nil,
        post_activity = nil,
        idle_enter = nil,
        idle_leave = nil,
        workspace_change = nil,
    },
    plugins = nil,
    advanced = {
        plugin = {
            autocmds = true,
            cursor_update = 'on_hold',
            match_in_mappings = true,
        },
        server = {
            update = 'fetch',
            pipe_path = nil,
            executable_path = nil,
            timeout = 300000,
        },
        discord = {
            reconnect = {
                enabled = false,
                interval = 5000,
                initial = true,
            },
        },
    },
})
