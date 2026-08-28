#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
cd "$root"

echo "Nexus CI/CD smoke — $(pwd)"
python3 -m py_compile src/nexus_cicd.py
python3 src/nexus_cicd.py
echo "✓ smoke ok"
