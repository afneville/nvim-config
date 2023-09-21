# Neovim Configuration

Neovim is a lightweight, highly extensible TUI modal text editor. Recent
versions include a Lua API and native LSP client, again written in Lua,
facilitating the use of an external language server to provide
completion, diagnostics and other code actions, much like an IDE. This
combination of features makes it a (very) good editor for working with
many different languages and environments.

![](./screenshot.png)

I have tried to minimise the number of in use plugins, keeping only the
most essential and widely used. I have, in places, copied snippets of
Lua from other configurations/plugins into my own. This strategy will
not prevent breaking changes entirely and my configuration will need
updating somewhat regularly.

In addition to a colour scheme plugin, I have included a Lua script to set the
theme to one of the _base16_ schemes from
[my theme repository](https://github.com/alexanderneville/b16-themes).
To install these themes:

```{.bash org-language="sh"}
cd utils
./install_themes.sh
cp colors/* ../colors
```
