# Landing page for Brent Gervais, built with Zola

Landing page for Brent Gervais — Linux & open source podcaster, community builder, and specialized generalist.

## About

Single-page static site with bio, link sections, and social profiles. Zero JavaScript, no external fonts.

## Tech

- [Zola](https://www.getzola.org) — static site generator (single Rust binary)
- [Tera](https://keats.github.io/tera/) — template engine
- Plain CSS with light/dark mode via `prefers-color-scheme`

## Local development

```bash
nix develop                # enters a shell with Zola
zola build                 # build to public/
zola serve --base-url /    # preview with live reload
zola check                 # validate links
```

## Repository structure

- `zola.toml` — site config (base_url, title, description)
- `flake.nix` — pinned nixpkgs + dev shell with Zola
- `content/_index.md` — page content: bio and link sections in front matter
- `templates/` — `base.html` (shell) and `index.html` (home page)
- `static/` — CSS, images, favicon, CNAME

## Editing content

All links live in `content/_index.md` front matter under `[extra.sections]`. Edit content there, not in templates.

## Deployment

Static output (`public/`) is intended for a free static host such as Cloudflare Pages or GitHub Pages.
