{ pkgs, ... }:

{
  environment.variables.PATH = [ "$HOME/.cargo/bin" ];
}
