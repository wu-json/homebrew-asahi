# Asahi

My Homebrew tap.

## Installation

```bash
brew tap wu-json/asahi
brew install wu-json/asahi/<formula>
```

## Formulas

| Formula | Description |
|---------|-------------|
| [curse](https://github.com/wu-json/curse) | Dead simple Terminal UI for running processes |
| [mast](https://github.com/wu-json/mast) | Terminal UI that shows every coding agent running on your machine |

## Development

### Setup

```bash
aqua i
```

### Updating a formula

To update a formula to the latest GitHub release:

```bash
just update-formula <name>
```

To refresh checksums without a version change:

```bash
just update-formula <name> --force
```
