{
  description = "A small, featureful neovim template.";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

  outputs = { self, nixpkgs, flake-utils, neovim-nightly-overlay }:
    flake-utils.lib.simpleFlake {
      inherit self nixpkgs;
      name = "default.nvim";
      overlay = neovim-nightly-overlay.overlay;
      shell = ./shell.nix;
      systems = [ "x86_64-linux" "x86_64-darwin" ];
    };
}
