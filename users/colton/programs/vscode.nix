{ lib, pkgs, ... }: let
	# inherit (pkgs.vscode-utils)
	# 	buildVscodeMarketplaceExtension
	# 	extensionsFromVscodeMarketplace;

	# credit: https://github.com/reckenrode/nixos-configs/blob/main/hosts/aarch64-darwin/natalia/users/reckenrode/home-manager/vscode.nix
	# Work around the lack of extension ordering in VS Code
	# See: https://github.com/Microsoft/vscode/issues/57481#issuecomment-910883638
	# loadAfter = deps: pkg: pkg.overrideAttrs (old: {
	# 	nativeBuildInputs = (old.nativeBuildInputs or []) ++ [ pkgs.jq ];

	# 	preInstall = ''
	# 		${old.preInstall or ""}
	# 		${pkgs.jq}/bin/jq \
	# 			'.extensionDependencies |= . + $deps' \
	# 			--argjson deps ${lib.escapeShellArg (builtins.toJSON deps)} \
	# 			package.json > package.json
	# 	'';
	# });
in {
	programs.vscode = {
		# enableExtensionUpdateCheck = true;

		# don't auto-enable vscode, as it's a GUI app and
		# my config should work when headless
		package = pkgs.vscode;

		# extensions = (with pkgs.vscode-extensions; [
		# 		davidanson.vscode-markdownlint

		# 		eamodio.gitlens
		# 		editorconfig.editorconfig

		# 		github.copilot
		# 		github.vscode-pull-request-github
		# 		graphql.vscode-graphql

		# 		jnoortheen.nix-ide

		# 		mkhl.direnv
		# 		ms-vscode.makefile-tools
		# 		ms-vscode-remote.remote-ssh

		# 		pkief.material-icon-theme

		# 		redhat.vscode-xml
		# 		redhat.vscode-yaml

		# 		stkb.rewrap

		# 		tamasfe.even-better-toml

		# 		usernamehw.errorlens

		# 		vscodevim.vim
		# 	]) ++ extensionsFromVscodeMarketplace [
		# 		{
		# 			publisher = "blanu";
		# 			name = "vscode-styled-jsx";
		# 			version = "2.1.1";
		# 			sha256 = "sha256-rvRLui9ivE5+I4VZJbSsdbcqFnssYV3gkmMk2Yrn9MU=";
		# 		}

		# 		{
		# 			publisher = "BriteSnow";
		# 			name = "vscode-toggle-quotes";
		# 			version = "0.3.6";
		# 			sha256 = "sha256-Hn3Mk224ePAAnNtkhKMcCil/kTgbonweb1i884Q62rs=";
		# 		}

		# 		{
		# 			publisher = "christian-kohler";
		# 			name = "npm-intellisense";
		# 			version = "1.4.4";
		# 			sha256 = "sha256-RLni/Iz2ZIX8/17gArc90ycVU9wPhNBa32Pe47sdGr0=";
		# 		}

		# 		{
		# 			publisher = "jeff-hykin";
		# 			name = "better-cpp-syntax";
		# 			version = "1.17.2";
		# 			sha256 = "sha256-p3SKu9FbtuP6in2dSsr5a0aB5W+YNQ0kMgMJoDYrhcU=";
		# 		}

		# 		{
		# 			publisher = "Equinusocio";
		# 			name = "vsc-community-material-theme";
		# 			version = "1.4.4";
		# 			sha256 = "sha256-Pn1IcgpwknVyKSnqs9/ZF2w6D2zASlAI6maPnvIltAA=";
		# 		}

		# 		{
		# 			publisher = "GitHub";
		# 			name = "copilot-labs";
		# 			version = "0.11.742";
		# 			sha256 = "sha256-upcrA8GYDKE71PvCLaSTersNsjrErcNy6Ff9oTz+2Zo=";
		# 		}

		# 		{
		# 			publisher = "jakeboone02";
		# 			name = "cypher-query-language";
		# 			version = "2.0.0";
		# 			sha256 = "sha256-oNjXfW7ndWDsc4GWb8p9QwoXAmW2IVIyUwCxY1qTQSc=";
		# 		}

		# 		{
		# 			publisher = "ms-vscode";
		# 			name = "remote-explorer";
		# 			version = "0.2.0";
		# 			sha256 = "sha256-bNpzzsHVD4bIicFJCd+fWXTptsIH6OaWeZrOnZcKcxU=";
		# 		}

		# 		{
		# 			publisher = "ms-vscode-remote";
		# 			name = "remote-ssh-edit";
		# 			version = "0.84.0";
		# 			sha256 = "sha256-33jHWC8K0TWJG54m6FqnYEotKqNxkcd/D14TFz6dgmc=";
		# 		}

		# 		{
		# 			publisher = "ms-vsliveshare";
		# 			name = "vsliveshare";
		# 			version = "1.0.5832";
		# 			sha256 = "sha256-vGurC+9d63PGgyXEVtVqruSDsObDjShpoxHD7EswSuk=";
		# 		}

		# 		{
		# 			publisher = "pnp";
		# 			name = "polacode";
		# 			version = "0.3.4";
		# 			sha256 = "sha256-u06gIe86W2dX4a1dBK4m07/VQeQKWMCwzi9LmSWpLFE=";
		# 		}

		# 		{
		# 			publisher = "redhat";
		# 			name = "vscode-commons";
		# 			version = "0.0.6";
		# 			sha256 = "sha256-tqjGKrQ6fhjco7/sgh2jaJCpikXyzeCOkHM8nRekFq0=";
		# 		}

		# 		{
		# 			publisher = "redhat";
		# 			name = "vscode-rsp-ui";
		# 			version = "0.23.13";
		# 			sha256 = "sha256-yey/cgii9/woxMyw1iUF4mHwUgM62fmK4WJwdEBQlD4=";
		# 		}

		# 		{
		# 			publisher = "rlivings39";
		# 			name = "fzf-quick-open";
		# 			version = "0.5.0";
		# 			sha256 = "sha256-172Vi4dlhE+Fu56OZs9Bs0Ii9Xt5dLFO3SpRO9dwJks=";
		# 		}

		# 		{
		# 			publisher = "wayou";
		# 			name = "vscode-todo-highlight";
		# 			version = "1.0.5";
		# 			sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
		# 		}

		# 		{
		# 			publisher = "xoronic";
		# 			name = "pestfile";
		# 			version = "0.4.0";
		# 			sha256 = "sha256-m4ap8QBV38RlLUqvolicPuc3hTjjN91gtLj6uFFjifg=";
		# 		}
		# 	] ++ map (loadAfter [ "mkhl.direnv" ]) (with pkgs.vscode-extensions; [
		# 		# need node
		# 		dbaeumer.vscode-eslint

		# 		# need node, prettier
		# 		esbenp.prettier-vscode

		# 		# need go
		# 		golang.go

		# 		# need dune, ocaml, opam
		# 		ocamllabs.ocaml-platform

		# 		# need cargo, rustc
		# 		rust-lang.rust-analyzer

		# 		# need cargo
		# 		serayuzgur.crates

		# 		# need cmake
		# 		twxs.cmake

		# 		# need lldb
		# 		# TODO(vscode-lldb): https://github.com/NixOS/nixpkgs/pull/211321
		# 		# vadimcn.vscode-lldb.overrideAttrs (old: old // {
		# 		# 	preBuild = ''
		# 		# 		export HOME=$TMPDIR
		# 		# 		${old.prebuild}
		# 		# 	'';
		# 		# })

		# 		# need protoc
		# 		zxh404.vscode-proto3
		# 	]) ++ [
		# 		(loadAfter
		# 			[ "mkhl.direnv" "twxs.cmake" ]
		# 			pkgs.vscode-extensions.ms-vscode.cmake-tools)
		# 	];

		# userSettings = {
		# 	"[go]" = {
		# 		"editor.insertSpaces" = false;
		# 		"editor.formatOnSave" = true;
		# 		"editor.codeActionsOnSave" = {
		# 			"source.organizeImports" = true;
		# 		};
		# 	};

		# 	"[markdown]" = {
		# 		"editor.quickSuggestions" = {
		# 			"comments" = "off";
		# 			"strings" = "off";
		# 			"other" = "off";
		# 		};
		# 		"editor.wordWrap" = "on";
		# 	};

		# 	"[python]" = {
		# 		"editor.wordBasedSuggestions" = false;
		# 	};

		# 	"[toml]" = {
		# 		"editor.defaultFormatter" = "tamasfe.even-better-toml";
		# 	};

		# 	"crates.errorDecorator" = "❗️";
		# 	"crates.listPreReleases" = true;

		# 	"diffEditor.renderSideBySide" = false;

		# 	"editor.accessibilitySupport" = "off";
		# 	"editor.bracketPairColorization.enabled" = true;
		# 	"editor.cursorStyle" = "line";
		# 	"editor.defaultFormatter" = "EditorConfig.EditorConfig";
		# 	"editor.fontFamily" = "'FiraCode Nerd Font', monospace";
		# 	"editor.fontLigatures" = true;
		# 	"editor.fontSize" = 14;
		# 	"editor.guides.bracketPairs" = "active";
		# 	"editor.inlineSuggestions.enabled" = true;
		# 	"editor.insertSpaces" = false;
		# 	"editor.lineNumbers" = "relative";
		# 	"editor.minimap.maxColumn" = 80;
		# 	"editor.suggestSelection" = "first";
		# 	"editor.tabSize" = 2;
		# 	"editor.wordSeparators" = "/\\()\"':,.;<>~!@#$%^&*|+=[]{}`?-";
		# 	"editor.wordWrap" = "on";

		# 	"errorlens.onSave" = true;

		# 	# "files.associations" = {
		# 	# 	"*.nix" = "nix";
		# 	# };
		# 	"files.autoSave" = "afterDelay";
		# 	"files.eol" = "\n";

		# 	"git.autofetch" = true;
		# 	"git.ignoreMissingGitWarning" = true;

		# 	"gitlens.advanced.messages" = {
		# 		"suppressGitMissingWarning" = true;
		# 	};

		# 	"go.autocompleteUnimportedPackages" = true;
		# 	"go.buildOnSave" = "workspace";
		# 	"go.formatTool" = "goimports";
		# 	"go.toolsManagement.autoUpdate" = true;

		# 	"nix.enableLanguageServer" = true;

		# 	"redhat.telemetry.enabled" = false;

		# 	"remote.SSH.remotePlatform" = {};

		# 	"rsp-ui.enableStartServerOnActivation" = [
		# 		{
		# 			"id" = "redhat.vscode-community-server-connector";
		# 			"name" = "Community Server Connector";
		# 			"startOnActivation" = true;
		# 		}
		# 	];

		# 	"rust-analyzer.cargo.buildScripts.enable" = true;
		# 	# TODO(vscode-lldb)
		# 	# "rust-analyzer.debug.engine" = "vadimcn.vscode-lldb";
		# 	"rust-analyzer.debug.openDebugPane" = true;
		# 	# "rust-analyzer.diagnostics.disabled" = [
		# 	# 	"unresolved-import"
		# 	# 	"macro-error"
		# 	# ];
		# 	"rust-analyzer.imports.granularity.group" = "preserve";
		# 	"rust-analyzer.imports.prefix" = "self";
		# 	"rust-analyzer.procMacro.enable" = true;

		# 	"terminal.integrated.commandsToSkipShell" = [ "language-julia.interrupt" ];
		# 	"terminal.integrated.fontSize" = 14;
		# 	"terminal.integrated.gpuAcceleration" = "canvas";
		# 	"terminal.integrated.scrollback" = 100000;

		# 	"typescript.updateImportsOnFileMove.enabled" = "always";

		# 	"window.autoDetectHighContrast" = false;
		# 	"window.dialogStyle" = "custom";
		# 	"window.restoreFullscreen" = true;

		# 	"workbench.colorTheme" = "Community Material Theme Darker High Contrast";
		# 	"workbench.iconTheme" = "material-icon-theme";
		# 	"workbench.startupEditor" = "none";

		# 	"vim.camelCaseMotion.enable" = true;
		# 	"vim.easymotion" = true;
		# 	"vim.foldfix" = true;
		# 	"vim.gdefault" = true;
		# 	"vim.showMarksInGutter" = true;
		# 	"vim.sneak" = true;
		# 	"vim.sneakReplacesF" = true;
		# 	"vim.sneakUseIgnorecaseAndSmartcase" = true;
		# 	"vim.useCtrlKeys" = false;

		# 	"zenMode.hideLineNumbers" = false;
		# };
	};
}
