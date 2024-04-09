# reveal-definion.nvim

A simple plug-in to implement `reveal definition` functionality similar to vscode.
`gd` go to definition or list the references if it is already on the definition.

## Use

Using lazy.nvim <https://github.com/folke/lazy.nvim>

use `fzf-lua`

```lua
{
  'lhybdv/reveal-definition.nvim',
  keys = {
    {
      'gd',
      function()
        require("reveal-definition").reveal_definition(require("fzf-lua").lsp_references)
      end,
      mode = {"n", "v"} 
    },
  }
}
```

use `telescope`
```lua
{
  'lhybdv/reveal-definition.nvim',
  keys = {
    {
      'gd',
      function()
        require("reveal-definition").reveal_definition(require("telescope.builtin").lsp_references)
      end,
      mode = {"n", "v"} 
    },
  }
}
```
