{
  lib,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    rustup
    cargo-nextest
  ];

  # Install the Rust toolchain
  home.activation.setupRust = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run ${pkgs.rustup}/bin/rustup toolchain install stable \
      --profile minimal --component rust-src clippy rust-analyzer
    run ${pkgs.rustup}/bin/rustup toolchain install nightly \
      --profile minimal --component rust-src rustfmt miri
  '';

  programs.fish.shellAbbrs = {
    c = "cargo";
    ca = "cargo add";
    crm = "cargo remove";
    cr = "cargo run";
    cb = "cargo build";
    ccl = "cargo clean";
    cck = "cargo check";
    cf = "cargo +nightly fmt";
    ct = "cargo nextest run";
    ci = "cargo install";
    cil = "cargo install --locked";
    cl = "cargo install --list";
    clp = "cargo clippy --all-targets -- -D warnings";
    cu = "cargo uninstall";
    cup = "cargo update";
  };

  programs.zed-editor = {
    userSettings.languages.Rust = {
      tab_size = 4;
      preferred_line_length = 100;
      wrap_guides = [ 100 ];
    };
    userSettings.lsp.rust-analyzer = {
      binary.path = "${pkgs.rustup}/bin/rust-analyzer";
      initialization_options = {
        checkOnSave.command = "clippy";
        rustfmt.extraArgs = [ "+nightly" ];
      };
    };
  };
}
