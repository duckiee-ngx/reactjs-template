# ReactJS Template

A React frontend template with a modular architecture, Vite, TanStack Router/Query, and Tailwind CSS.

## Overview

Boilerplate for spinning up a SPA quickly: app providers (`src/providers`), shared utilities (`src/shared`), feature modules (`src/modules`), file-based routes (`src/routes`), Axios config, Biome lint/format, TypeScript project references, and Husky git hooks.

## Tech stack

| Layer | Technology |
| --- | --- |
| Runtime | Node.js (via nvm or equivalent) |
| Package manager | npm (swap to pnpm/yarn via `Makefile`) |
| Bundler / dev server | Vite |
| UI library | React 19 |
| Routing | TanStack Router |
| Server state | TanStack Query |
| HTTP | Axios |
| Styling | Tailwind CSS 4 |
| Lint / format | Biome |
| Typecheck | TypeScript (`tsc -b`) |
| Git hooks | Husky + commitlint (conventional commits) |

## Quick start

```bash
# Enter the project directory
cd reactjs-template

# Install dependencies
make install

# Copy env
cp .env.example .env
# Fill in API base URL and other client settings in .env

# Start the dev server
make start
```

App: `http://127.0.0.1:5173`

## Commands

| Command | Description |
| --- | --- |
| `make install` | Install dependencies |
| `make start` | Run Vite dev server |
| `make lint` | Biome check |
| `make format` | Biome format |
| `make typecheck` | TypeScript build-mode check (`tsc -b --noEmit`) |

Or run directly via npm:

```bash
npm install
npm run start
npm run lint
npm run format
npm run typecheck
npm run build
npm run preview
```

## Project structure

```
reactjs-template/
│
├── src/
│   ├── configs/
│   │
│   ├── modules/
│   │   ├── auth/
│   │   │   ├── components/
│   │   │   ├── constants/
│   │   │   ├── hooks/
│   │   │   ├── store/
│   │   │   ├── api.ts
│   │   │   ├── mapper.ts
│   │   │   ├── query.ts
│   │   │   └── schemas.ts
│   │   │
│   │   └── ...
│   │
│   ├── providers/
│   │
│   ├── routes/
│   │
│   ├── shared/
│   │   ├── components/
│   │   ├── constants/
│   │   ├── hooks/
│   │   ├── store/
│   │   └── utils/
│   │
│   ├── App.tsx
│   ├── main.tsx
│   ├── index.css
│   └── routeTree.gen.ts
│
├── public/
│
├── .husky/
│
├── .env
├── .env.example
├── biome.json
├── commitlint.config.cjs
├── index.html
├── package.json
├── package-lock.json
├── Makefile
├── Dockerfile
├── .dockerignore
├── .gitignore
├── tailwind.config.js
├── tsr.config.json
├── vite.config.ts
├── tsconfig.json
├── tsconfig.app.json
├── tsconfig.node.json
└── README.md
```
