{ self, inputs, ... }: {
  flake.homeModules.devPackages = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
      godot
      android-studio
      android-tools
      flutter
      rustup
      nodejs
      clang
      gh
      git-lfs
      claude-code
      blender
      stripe-cli
      cargo-tauri
      awscli2
      aws-sam-cli
    ];

    home.activation.awsCredentials = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      mkdir -p ~/.aws
      cat > ~/.aws/credentials << EOF
      [default]
      aws_access_key_id=$(cat /run/secrets/aws-access-key-id)
      aws_secret_access_key=$(cat /run/secrets/aws-secret-access-key)
      EOF
      chmod 600 ~/.aws/credentials
    '';
  };
}
