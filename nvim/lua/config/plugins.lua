-- Checks all plugins defined in ../plugins/* for an `enabled` flag.
-- `enabled == false` means that the plugins defined in the file won't be installed.
-- `enabled == null || enabled == true` means that the plugins defined in the file will be installed.
local M = {}

function M.load()
  local modules = {}

  require("lazy.core.util").lsmod("plugins", function(modname, modpath)
    modules[#modules + 1] = { name = modname, path = modpath }
  end)

  -- lazy sorts its own imports by module name.
  -- match that so plugin specs are merged in a stable
  -- order regardless of directory listing order.
  table.sort(modules, function(a, b)
    return a.name < b.name
  end)

  local specs = {}

  for _, module in ipairs(modules) do
    local chunk, err = loadfile(module.path)
    if not chunk then
      error("Failed to load `" .. module.name .. "`:\n" .. err)
    end

    local mod = chunk()
    if type(mod) ~= "table" then
      error("Invalid spec module `" .. module.name .. "`: expected a table, got " .. type(mod))
    end

    local enabled = mod.enabled
    if type(enabled) == "function" then
      enabled = enabled()
    end

    if enabled ~= false then
      if type(mod[1]) == "string" then
        -- A single plugin spec rather than a list of them; pass it through
        -- whole so its options survive.
        specs[#specs + 1] = mod
      else
        vim.list_extend(specs, mod)
      end
    end
  end

  return specs
end

return M
