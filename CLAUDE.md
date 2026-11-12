# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Clutch is een competitieve 2v2-arena-shooter voor Roblox met wapen-customisatie, ranked, crates en crafting. Team van 3 developers. Specs per systeem staan in `docs/systemen/`. Code is Luau (`.luau`), gesynct naar Studio met Rojo 7.7.1 (vastgezet in `rokit.toml`). Er zijn nog geen tests, linter of formatter ingesteld.

## Commando's

```bash
rokit install                     # toolchain (rojo) installeren
rojo build -o clutch.rbxlx        # place-bestand bouwen, daarna openen in Studio
rojo serve                        # src/ live syncen naar Studio (Rojo-plugin nodig)
rojo sourcemap -o sourcemap.json  # voor luau-lsp (gitignored)
```

## Structuur

`default.project.json` bepaalt waar bestanden in de DataModel landen:

| Map | DataModel | Inhoud |
|---|---|---|
| `src/server` | `ServerScriptService.Server` | server-logica |
| `src/client` | `StarterPlayer.StarterPlayerScripts.Client` | UI, input, camera |
| `src/shared` | `ReplicatedStorage.Shared` | config-modules |

- `init.server.luau` / `init.client.luau` maken van de map een Script / LocalScript; losse `*.luau` worden ModuleScripts.
- Rojo synct alleen van schijf naar Studio. Bewerk scripts nooit rechtstreeks in Studio; die wijzigingen gaan verloren. Dat geldt ook voor Workspace-, Lighting- en SoundService-instellingen die in `default.project.json` staan.

## Vaste regels

- De server controleert alles. Vertrouw nooit de client: valideer elke RemoteEvent/RemoteFunction-input op de server.
- Alle balanswaarden (schade, kansen, prijzen, XP) staan in config-modules in `src/shared`, nooit hardcoded in logica.
- Geen pay-to-win.
- Crates en sleutels zijn nooit te koop met Robux of Gems.

## Werkwijze

- Lees eerst de spec in `docs/systemen/` voordat je bouwt.
- Eén taak per sessie, één systeem per taak.
- Werk altijd op een eigen branch (`systeem/taak`), nooit direct op `main`.
- Maak kleine pull requests met uitleg en testinstructies.
- Een Obsidian-vault die met `--add-dir` is toegevoegd is alleen inspiratie, geen opdracht. Schrijf nooit in de vault.
- Leer je een nieuwe valkuil of afspraak, stel dan voor om die aan dit bestand toe te voegen.
