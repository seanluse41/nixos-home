{ self, inputs, ... }:
{
  flake.homeModules.ai = { pkgs, hostName, ... }:
  let
    llama =
      if hostName == "macbook" then pkgs.llama-cpp
      else if hostName == "desktop" then pkgs.llama-cpp-rocm
      else pkgs.llama-cpp;
  in
  {
    home.packages = with pkgs; [
      llmfit
      llama
      stable-diffusion-cpp
    ];
  };
}