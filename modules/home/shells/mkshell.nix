{ pkgs, ... }:

pkgs.mkShell {
  buildInputs = [
    pkgs.pre-commit
    pkgs.typos
  ];

  shellHook = ''
    # Required for qmlls to find the correct type declarations
    # Quickshell might not export some types declaratively
    export QMLLS_BUILD_DIRS=${pkgs.qt6.qtbase}/lib/qt-6/qml:${pkgs.quickshell}/lib/qt-6/qml
    export QML_IMPORT_PATH=$PWD/src
    ${pkgs.pre-commit}/bin/pre-commit install -f
  '';
}
