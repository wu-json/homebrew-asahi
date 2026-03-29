# Agent notes: updating Homebrew formulas

This tap uses [just](https://github.com/casey/just) to bump formulas from each project’s latest GitHub release and refresh `sha256` checksums for all published platform archives.

## Prerequisites

- `just` installed and on `PATH`
- `curl`, `jq`, and `shasum` available (typical on macOS)

## Update one formula

From the repository root:

```bash
just update-formula <name>
```

`<name>` is the formula stem: for `Formula/curse.rb`, use `curse`.

To re-download archives and rewrite checksums even when the version string is already current:

```bash
just update-formula <name> --force
```

## Update every formula

```bash
just update-formulas
```

To force all formulas through the same path as `--force` above:

```bash
just update-formulas --force
```

## What the recipe expects

For `just update-formula` to work, each `Formula/<name>.rb` should:

1. Set `homepage` to `https://github.com/<owner>/<repo>` so the script can discover the GitHub repository.
2. Declare `version "…"` in the usual Homebrew style.
3. Use release assets whose names match  
   `<name>_<version>_darwin_arm64.tar.gz`,  
   `<name>_<version>_darwin_amd64.tar.gz`,  
   `<name>_<version>_linux_arm64.tar.gz`,  
   `<name>_<version>_linux_amd64.tar.gz`  
   (with `<name>` lowercase, matching the filename stem).

The script reads the latest release tag from the GitHub API (strips a leading `v`), updates the `version` line, then replaces each `sha256` on the line immediately after the matching `url` for `darwin_arm64`, `darwin_amd64`, `linux_arm64`, and `linux_amd64`.

If a formula has no GitHub homepage, nonstandard archive names, or a different layout, update it by hand or extend the `justfile` before relying on automation.
