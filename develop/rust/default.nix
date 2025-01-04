{
  pkgs,
  ...
}:
{
  # Rust Development
  # Use rustup instead of rust to manage toolchains
  home.packages = with pkgs; [
    rustup
    cargo-nextest
  ];

  programs.fish.shellAbbrs = {
    c = "cargo";
    ca = "cargo add";
    crm = "cargo remove";
    cr = "cargo run";
    cb = "cargo build";
    ccl = "cargo clean";
    cck = "cargo check";
    cf = "cargo fmt";
    ct = "cargo test";
    ci = "cargo install";
    cil = "cargo install --locked";
    cl = "cargo install --list";
    clp = "cargo clippy --all-targets -- -D warnings";
    cu = "cargo uninstall";
    cup = "cargo update";
  };
}
