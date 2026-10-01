# Project context

This is a Bridgetown static site for Lewis M Sparlin’s personal website, lewismsparlin.com. See `README.md` for setup and local development.

## Design and content

Keep the tone simple and preserve the light, terminal-inspired aesthetic: monospace headings and navigation, shell-style labels (`~$`, `~/`, `//`, `./`), dark text with purple accents, a subtle pastel background, and a rounded main panel with generous whitespace. Body copy stays readable and conversational; this is not a literal terminal emulator.

The site is intentionally sparse; blog content is limited because the owner does not currently have much to publish. Do not invent posts or add filler content.

## Key paths

- `src/`: pages, posts, layouts, partials, and components.
- `src/_data/site_metadata.yml`: site metadata and contact links.
- `frontend/`: frontend assets; `esbuild.config.js` configures asset compilation.
- `config/initializers.rb`: Bridgetown configuration.
- `output/`: generated site; edit source files, not build output.

## Development and build

- Install dependencies: `bundle install` and `npm ci` (Ruby 4.0.2, Node 22+).
- Start local development: `bin/bridgetown start` (localhost:4000).
- Build assets and site: `npm run esbuild && bin/bridgetown build`.

## Docker deployment

Hosted on Railway, with new GitHub commits triggering deployments.

`Dockerfile` uses a multi-stage build:

1. The Ruby/Node build stage installs dependencies and runs `npm run esbuild && bin/bridgetown build`, generating static HTML and assets in `/site/output`.
2. The final `nginx:1.27-alpine` image copies that output to `/usr/share/nginx/html` and serves it using `nginx.conf.template`.

Production runs only nginx, not Ruby, Node, or a Bridgetown application server. This is a lightweight static HTML service with low runtime compute and memory needs; the heavier work happens at build time. `PORT` defaults to 80.

To check deployment locally: `docker build -t lewismsparlin.com .` then `docker run --rm -p 8080:80 lewismsparlin.com`.

## Working conventions

Use branches and pull requests for changes; do not push changes directly to `main`. Keep changes small and preserve the static-site deployment model. Validate site or asset changes with the build command above; validate deployment changes with a Docker build when available.
