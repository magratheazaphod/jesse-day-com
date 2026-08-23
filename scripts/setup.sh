#!/bin/sh
# Run once after cloning. Enables the versioned git hooks.
#
# Hooks in .git/hooks are not cloned, so the guardrail against committing
# working artifacts to this public repo has to be pointed at explicitly.
set -e
cd "$(dirname "$0")/.."
git config core.hooksPath .githooks
echo "core.hooksPath -> .githooks"
echo "pre-commit guardrail active."
