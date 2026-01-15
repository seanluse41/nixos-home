{
  description = "Kintone development environment";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  
  outputs = { nixpkgs, ... }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ pkgs.nodejs ];
        
        shellHook = ''
          export NPM_CONFIG_PREFIX="$PWD/.npm-packages"
          export PATH="$NPM_CONFIG_PREFIX/bin:$PATH"
          
          if [ ! -f ".npm-packages/.installed" ]; then
            npm install -g \
              @kintone/create-plugin \
              @kintone/customize-uploader \
              @kintone/plugin-packer \
              @kintone/plugin-uploader \
              @kintone/cli \
              @kintone/mcp-server
            touch .npm-packages/.installed
          fi
        '';
      };
    };
}