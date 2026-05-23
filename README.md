# lewismsparlin.com

Bridgetown source for Lewis M Sparlin’s personal website.

## Local development

Prerequisites:

- Ruby 4.0.2 (see `.ruby-version`)
- Node 22+
- Bundler

```sh
bundle install
npm install
bin/bridgetown start
```

Open <http://localhost:4000>.

## Build

```sh
bin/bridgetown build
```

The static site is generated in `output/`.

## Docker / nginx

Build a production image which compiles Bridgetown and serves the static output with nginx:

```sh
docker build -t lewismsparlin.com .
docker run --rm -p 8080:80 lewismsparlin.com
```

Open <http://localhost:8080>.

## Content notes

- Homepage content lives in `src/index.md`.
- Site metadata and contact links live in `src/_data/site_metadata.yml`.
- Add writing in `src/_posts` using Bridgetown’s `YYYY-MM-DD-title.md` convention.
- Layouts and shared partials live in `src/_layouts`, `src/_partials`, and `src/_components`.
