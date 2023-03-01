{ pkgs, ... }: let
	inherit (pkgs.vscode-utils) buildVscodeMarketplaceExtension;

	# credit: https://github.com/reckenrode/nixos-configs/blob/main/hosts/aarch64-darwin/natalia/users/reckenrode/home-manager/vscode.nix
	# Work around the lack of extension ordering in VS Code
	# See: https://github.com/Microsoft/vscode/issues/57481#issuecomment-910883638
	# loadAfter = deps: pkg: pkg.overrideAttrs (old: {
	# 	nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.jq ];

	# 	preInstall = ''
	# 		${old.preInstall or ""}
	# 		${pkgs.jq}/bin/jq
	# 			'.extensionDependencies |= . + $deps'
	# 			--argjson deps ${lib.escapeShellArg (builtins.toJSON deps)}
	# 			package.json > package.json
	# 	'';
	# });

	# Bazel
	BazelBuild.vscode-bazel = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "BazelBuild";
			name = "vscode-bazel";
		};
	};

	# Better C++ Syntax
	jeff-hykin.better-cpp-syntax = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "jeff-hykin";
			name = "better-cpp-syntax";
		};
	};

	# CMake
	twxs.cmake = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "twxs";
			name = "cmake";
		};
	};

	# CMake Tools
	ms-vscode.cmake-tools = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode";
			name = "cmake-tools";
		};
	};

	# CodeLLDB
	# TODO: loadAfter
	vadimcn.vscode-lldb = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "vadimcn";
			name = "vscode-lldb";
		};
	};

	# Community Material Theme
	equinusocio.vsc-community-material-theme = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "Equinusocio";
			name = "vsc-community-material-theme";
		};
	};

	# crates
	# TODO: loadAfter
	serayuzgur.crates = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "serayuzgur";
			name = "crates";
		};
	};

	# Cypher Query Language
	jakeboone02.cypher-query-language = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "jakeboone02";
			name = "cypher-query-language";
		};
	};

	# direnv
	g3rry.direnv = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "g3rry";
			name = "direnv";
		};
	};

	# EditorConfig for VS Code
	EditorConfig.EditorConfig = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "EditorConfig";
			name = "EditorConfig";
		};
	};

	# Error Lens
	usernamehw.errorlens = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "usernamehw";
			name = "errorlens";
		};
	};

	# ESLint
	# TODO: loadAfter?
	dbaeumer.vscode-eslint = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "dbaeumer";
			name = "vscode-eslint";
		};
	};

	# Even Better TOML
	tamasfe.even-better-toml = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "tamasfe";
			name = "even-better-toml";
		};
	};

	# fzf fuzzy quick open
	rlivings39.fzf-quick-open = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "rlivings39";
			name = "fzf-quick-open";
		};
	};

	# GitHub Copilot
	GitHub.copilot = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "GitHub";
			name = "copilot";
		};
	};

	# GitHub Copilot Labs
	GitHub.copilot-labs = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "GitHub";
			name = "copilot-labs";
		};
	};

	# GitHub Pull Requests and Issues
	GitHub.vscode-pull-request-github = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "GitHub";
			name = "vscode-pull-request-github";
		};
	};

	# GitLens
	eamodio.gitlens = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "eamodio";
			name = "gitlens";
		};
	};

	# Go
	golang.go = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "golang";
			name = "go";
		};
	};

	# GraphQL: Language Feature Support
	# TODO: loadAfter?
	GraphQL.vscode-graphql = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "GraphQL";
			name = "vscode-graphql";
		};
	};

	# GraphQL: Syntax Highlighting
	GraphQL.vscode-graphql-syntax = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "GraphQL";
			name = "vscode-graphql-syntax";
		};
	};

	# Live Share
	ms-vsliveshare.vsliveshare = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vsliveshare";
			name = "vsliveshare";
		};
	};

	# Makefile Tools
	ms-vscode.makefile-tools = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode";
			name = "makefile-tools";
		};
	};

	# markdownlint
	DavidAnson.vscode-markdownlint = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "DavidAnson";
			name = "vscode-markdownlint";
		};
	};

	# Material Theme Icons
	equinusocio.vsc-material-theme-icons = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "Equinusocio";
			name = "vsc-material-theme-icons";
		};
	};

	# Nix
	bbenoist.Nix = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "bbenoist";
			name = "Nix";
		};
	};

	# Nix IDE
	# TODO: loadAfter? or use my own lsp pref?
	jnoortheen.nix-ide = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "jnoortheen";
			name = "nix-ide";
		};
	};

	# npm Intellisense
	# TODO: loadAfter?
	christian-kohler.npm-intellisense = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "christian-kohler";
			name = "npm-intellisense";
		};
	};

	# OCaml Platform
	# TODO: loadAfter
	ocamllabs.ocaml-platform = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ocamllabs";
			name = "ocaml-platform";
		};
	};

	# pest
	xoronic.pestfile = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "xoronic";
			name = "pestfile";
		};
	};

	# Polacode
	pnp.polacode = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "pnp";
			name = "polacode";
		};
	};

	# Prettier - Code formatter
	# TODO: loadAfter
	esbenp.prettier-vscode = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "esbenp";
			name = "prettier-vscode";
		};
	};

	# Protobuf support
	peterj.proto = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "peterj";
			name = "proto";
		};
	};

	# Red Hat Commons
	redhat.vscode-commons = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "redhat";
			name = "vscode-commons";
		};
	};

	# Remote - SSH
	ms-vscode-remote.remote-ssh = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode-remote";
			name = "remote-ssh";
		};
	};

	# Remote - SSH: Editing Configuration Files
	ms-vscode-remote.remote-ssh-edit = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode-remote";
			name = "remote-ssh-edit";
		};
	};

	# Remote - Tunnels
	ms-vscode.remote-server = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode";
			name = "remote-server";
		};
	};

	# Remote Development
	ms-vscode-remote.vscode-remote-extensionpack = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode-remote";
			name = "vscode-remote-extensionpack";
		};
	};

	# Remote Explorer
	ms-vscode.remote-explorer = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "ms-vscode";
			name = "remote-explorer";
		};
	};

	# Remote Server Protocol UI
	redhat.vscode-rsp-ui = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "redhat";
			name = "vscode-rsp-ui";
		};
	};

	# Rewrap
	stkb.rewrap = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "stkb";
			name = "rewrap";
		};
	};

	# rust-analyzer
	# TODO: loadAfter
	rust-lang.rust-analyzer = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "rust-lang";
			name = "rust-analyzer";
		};
	};

	# styled-jsx
	# TODO: loadAfter?
	blanu.vscode-styled-jsx = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "blanu";
			name = "vscode-styled-jsx";
		};
	};

	# TODO Highlight
	wayou.vscode-todo-highlight = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "wayou";
			name = "vscode-todo-highlight";
		};
	};

	# Toggle Quotes
	BriteSnow.vscode-toggle-quotes = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "BriteSnow";
			name = "vscode-toggle-quotes";
		};
	};

	# Vim
	vscodevim.vim = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "vscodevim";
			name = "vim";
		};
	};

	# vsc-nvm
	henrynguyen5-vsc.vsc-nvm = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "henrynguyen5-vsc";
			name = "vsc-nvm";
		};
	};

	# vscode-proto3
	# TODO: loadAfter?
	zxh404.vscode-proto3 = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "zxh404";
			name = "vscode-proto3";
		};
	};

	# XML
	redhat.vscode-xml = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "redhat";
			name = "vscode-xml";
		};
	};

	# YAML
	redhat.vscode-yaml = buildVscodeMarketplaceExtension {
		mktplcRef = {
			publisher = "redhat";
			name = "vscode-yaml";
		};
	};
in {
	programs.vscode = {
		# enableExtensionUpdateCheck = true;

		# don't auto-enable vscode, as it's a GUI app and
		# my config should work when headless
		package = pkgs.vscode;

		# extensions = [
		# ];
	};
}
