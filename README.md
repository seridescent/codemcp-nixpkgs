# codemcp-nix

Quick and dirty Nix package definition for [codemcp](https://github.com/ezyang/codemcp), a coding assistant MCP for Claude Desktop.

Not working on upstreaming to nixpkgs because: 
1. it's not really "right" because it doesn't make use of the repo's `uv.lock` file
2. uncertain if codemcp meets inclusion criteria
3. tests are disabled lol
4. also requires properly packaging `agno` dependency, which I'm not very interested in doing right now