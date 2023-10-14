# Meal Manifest

## Live Version: [meals.seandickinson.dev](https://meals.seandickinson.dev)

## Description

This is a toy app to manage meal plans in an easily searchable/taggable way. It is a work in progress. Don't expect any stability

## Local Development

### Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- Ruby (See [.ruby-version](.ruby-version))
- Yarn (See [.tool-versions](.tool-versions))

### Setup

1. Clone the repo
2. Run `docker-compose up -d` to start the database
3. Run `bundle install` to install Ruby dependencies
4. Run `yarn install` to install JavaScript dependencies
5. Run `rails db:setup` to create the database and seed it with some test data
6. Run `foreman start` to start the Rails server + Vite dev server
