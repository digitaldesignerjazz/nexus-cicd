# Nexus CI/CD

Öffentliche GitHub-Actions-Pipelines und wiederverwendbare Workflows für **Nexus / Lumina / Esslinger & Co.**

Zentral. Wiederverwendbar. Runner-bereit. Teil von [Esslinger & Co.](https://github.com/digitaldesignerjazz).

Schwester-Repos:
- Nexus-Hub: [digitaldesignerjazz/nexus](https://github.com/digitaldesignerjazz/nexus)
- Hannover Runner: [digitaldesignerjazz/hannover-runner-public](https://github.com/digitaldesignerjazz/hannover-runner-public)
- Cyberspace Runner: [digitaldesignerjazz/cyberspace-runner](https://github.com/digitaldesignerjazz/cyberspace-runner)
- Lumia Bot: [digitaldesignerjazz/lumia-bot](https://github.com/digitaldesignerjazz/lumia-bot)

## Was hier liegt

| Datei | Zweck |
|---|---|
| `.github/workflows/ci.yml` | Standard-CI dieses Repos (Push / PR / manuell) |
| `.github/workflows/reusable-python.yml` | Wiederverwendbare Python-Prüfung (`workflow_call`) |
| `.github/workflows/reusable-status.yml` | Resonance-Summary für nachgelagerte Jobs |
| `examples/caller.yml` | Vorlage zum Einbinden in andere Repos |
| `scripts/ci-smoke.sh` | Lokaler / Pipeline-Smoke-Test |
| `src/nexus_cicd.py` | Minimale Referenzschicht, damit CI greift |

## Dieses Repo selbst prüfen

```bash
git clone https://github.com/digitaldesignerjazz/nexus-cicd.git
cd nexus-cicd
python src/nexus_cicd.py
bash scripts/ci-smoke.sh
```

Python 3.11+.

## In einem anderen Repo nutzen

Datei `.github/workflows/ci.yml` im Ziel-Repo:

```yaml
name: Nexus CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]
  workflow_dispatch:

jobs:
  python:
    uses: digitaldesignerjazz/nexus-cicd/.github/workflows/reusable-python.yml@main
    with:
      python-version: "3.12"
      source-path: "src"
```

Vollständiges Beispiel: [`examples/caller.yml`](examples/caller.yml).

## Runner

Standard: `ubuntu-latest` (sofort grün, unabhängig vom Hannover-Runner).

Optional Self-Hosted (Labels aus dem Lumina-Netz):

`self-hosted`, `linux`, `x64`, `lumina`, `hannover`, `cyberspace`

Im reusable Workflow:

```yaml
with:
  runner: "self-hosted"
```

Nur setzen, wenn der Runner online ist — sonst wartet der Job in der Queue.

## Manuell auslösen

Actions → **Nexus CI/CD** → *Run workflow*.

## Lizenz

MIT — Copyright (c) 2026 Esslinger & Co. / Sven Normen Eßlinger
