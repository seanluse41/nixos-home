# modules/features/dev/aws.nix
{ self, ... }: {
  flake.homeManagerModules.aws = { lib, ... }: {
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