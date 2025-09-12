# Project Overview

This repository contains database scripts organized by Flyway conventions. The structure and contribution rules below are intended for Codex agents and developers.

## Directory Structure

- `aspnetidentity/` – scripts for the user management database
- `investordb/` – investor related database scripts
- `systemdb/` – system configuration database scripts
- `redisdb/` – Redis configuration or seed data
- `wallet/` – Oracle connection wallet files

Within each database directory (except `wallet`) there are:
- `migrations/` – schema change scripts
- `seeders/` – default data scripts

## Code Style

- **JavaScript/TypeScript**: use Prettier and ESLint. Keep file names in `camelCase` or `kebab-case`.
- **Python**: format with Black and lint with flake8. Use `snake_case` for file and variable names.
- **SQL**: follow the naming convention `V<major>.<minor>__<description>.sql`.

## Development Commands

Run these in the repository root (add the tools if needed):

```bash
npm run lint      # lint JS/TS code
npm test          # run JavaScript tests
pytest            # run Python tests
```

For Flyway migrations you can run `flyway info` or `flyway migrate` to verify scripts.

## Pull Request Conventions

- **Title**: short summary in English
- **Description**: explain the changes and reference related issues
- **Commit message**: keep to one line in present tense (e.g., `Add seed script for roles`)

## Pre-PR Checklist

Before opening a pull request:

1. Run `npm run lint` and `npm test` if the repo contains JS/TS
2. Run `flake8` and `pytest` for Python code
3. Run `flyway info` (or equivalent) to ensure SQL scripts run
4. Ensure all tests pass and there are no lint errors
5. Verify builds succeed if a build step exists

