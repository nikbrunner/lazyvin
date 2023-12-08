local M = {}

---@type LazySpec
M.spec = {
  "LazyVim/LazyVim",
  opts = {

    ---@type TerraConfig.ColorSchemeName
    colorscheme = "terra_winter_night",

    ---@type table<string, string[]>?
    kind_filter = {
      default = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        "Package",
        "Property",
        "String",
        "Struct",
        "TypeParameter",
        "Variable",
      },
      lua = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Property",
        "Struct",
        "Trait",
      },
    },
  },
}

return M.spec
