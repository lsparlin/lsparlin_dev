# syntax=docker/dockerfile:1

FROM ruby:4.0.2-slim AS build

ENV BUNDLE_DEPLOYMENT=true \
    BUNDLE_PATH=/usr/local/bundle \
    BRIDGETOWN_ENV=production \
    NODE_ENV=production

RUN apt-get update -qq \
  && apt-get install -y --no-install-recommends build-essential git curl ca-certificates pkg-config libyaml-dev libssl-dev \
  && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
  && apt-get install -y --no-install-recommends nodejs \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /site

COPY Gemfile Gemfile.lock package.json package-lock.json ./
RUN bundle install && npm ci --include=dev

COPY . .
RUN npm run esbuild && bin/bridgetown build

FROM nginx:1.27-alpine

ENV PORT=80
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY --from=build /site/output /usr/share/nginx/html

EXPOSE 80
