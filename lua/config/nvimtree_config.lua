local api = require("nvim-tree.api")

local function edit_or_open()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file
    api.node.open.edit()
    -- Close the tree if file was opened
    -- api.tree.close()
  end
end

-- open as vsplit on current node
local function vsplit_preview()
  local node = api.tree.get_node_under_cursor()

  if node.nodes ~= nil then
    -- expand or collapse folder
    api.node.open.edit()
  else
    -- open file as vsplit
    api.node.open.vertical()
  end

  -- Finally refocus on tree if it was lost
  api.tree.focus()
end

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
        }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", "O", "", { buffer = bufnr })
    vim.keymap.del("n", "O", { buffer = bufnr })
    vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
    vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
    vim.keymap.set("n", "D", "", { buffer = bufnr })
    vim.keymap.del("n", "D", { buffer = bufnr })
    vim.keymap.set("n", "E", "", { buffer = bufnr })
    vim.keymap.del("n", "E", { buffer = bufnr })

    vim.keymap.set("n", "A", api.tree.expand_all, opts("Expand All"))
    vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "C", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "P", function()
        local node = api.tree.get_node_under_cursor()
        print(node.absolute_path)
    end, opts("Print Node Path"))

    vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))

    vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
    vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
    vim.keymap.set("n", "h", api.tree.close, opts("Close"))
    vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
end

require("nvim-tree").setup({
    on_attach = on_attach,
})

local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if not directory then
        return
    end
    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
