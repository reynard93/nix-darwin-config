# Default at https://github.com/nushell/nushell/blob/main/crates/nu-utils/src/sample_config/default_env.nu

let-env SHELL = (which nu).path
