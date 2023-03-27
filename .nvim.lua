local lsp = require("konrad.lsp")
lsp.add("ansiblels")
lsp.add("jsonls")
lsp.add("nil_ls")
lsp.add("terraformls")
lsp.add("yamlls")

local null = require("null-ls")
lsp.add("null-ls", null.builtins.formatting.nixpkgs_fmt)
lsp.add("null-ls", null.builtins.formatting.terraform_fmt)

