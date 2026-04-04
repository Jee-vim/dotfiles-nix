---
description: Configure your preferred package manager (npm/pnpm/yarn/bun)
disable-model-invocation: true
---

# Package Manager Setup

Configure your preferred package manager for this project or globally.

## Usage

```bash
# Detect current package manager
node scripts/setup-package-manager.js --detect

# Set global preference
node scripts/setup-package-manager.js --global pnpm

# Set project preference
node scripts/setup-package-manager.js --project bun

# List available package managers
node scripts/setup-package-manager.js --list
```

## Detection Priority

When determining which package manager to use, the following order is checked:

## Configuration Files

### package.json
```json
{
  "packageManager": "pnpm@8.6.0"
}
```

## Run the Detection

To see current package manager detection results, run:

```bash
node scripts/setup-package-manager.js --detect
```
