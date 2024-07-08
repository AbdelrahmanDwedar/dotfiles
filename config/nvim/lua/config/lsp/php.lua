local lspconfig = require 'lspconfig'
local configs = require 'lspconfig.configs'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.intelephense then
  configs.intelephense = {
    default_config = {
      cmd = { 'intelephense', '--stdio' };
      filetypes = { 'php' };
      root_dir = function(fname)
        return vim.loop.cwd()
      end;
      settings = {
        intelephense = {
          files = {
            maxSize = 1000000;
          };
          environment = {
            includePaths = {
              "/home/serii/Sites/wordpress",
              "/home/serii/Sites/advanced-custom-fields-pro",
              "/home/serii/Sites/woocommerce"
            }
          }
        }
      }
    }
  }
end

lspconfig.phpactor.setup({})
lspconfig.intelephense.setup { capabilities = capabilities }
