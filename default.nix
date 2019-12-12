self: pkgs:
let
graphicsPkgs = rec {
  libdrm  = pkgs.callPackage ./pkgs/libdrm {};
  mesa    = pkgs.callPackage ./pkgs/mesa {
    llvmPackages = pkgs.llvmPackages_9;
    inherit (pkgs.darwin.apple_sdk.frameworks) OpenGL;
    inherit (pkgs.darwin.apple_sdk.libs) Xplugin;
  };
};
in
  graphicsPkgs // { inherit graphicsPkgs; }
