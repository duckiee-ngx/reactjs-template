# ReactJS Template

A React frontend template with a modular architecture, Vite, TanStack Router/Query, Zod, Zustand, and Tailwind CSS.

## Overview

Boilerplate for spinning up a SPA quickly: app providers (`src/providers`), shared utilities (`src/shared`), feature modules with Zod schemas and Zustand stores (`src/modules`), file-based routes (`src/routes`), Axios HTTP client, env validation, Biome check/fix, TypeScript project references, Husky git hooks, and a multi-stage Docker image (Node build → nginx).

Auth: access token in Zustand (memory only), refresh via httpOnly cookie (`withCredentials`). Protected routes live under `_protected` (`beforeLoad` + `ensureSession`); public routes under `_public` (e.g. `/login`). Axios interceptors are attached in `src/main.tsx`.

## Tech stack

| Layer | Technology |
| --- | --- |
| Runtime | Node.js `^20.19.0 \|\| ^22.12.0` (see `package.json` `engines`) |
| Package manager | npm (swap to pnpm/yarn via `Makefile`) |
| Bundler / dev server | Vite |
| UI library | React 19 |
| Routing | TanStack Router |
| Server state | TanStack Query |
| Client state | Zustand |
| Validation | Zod |
| HTTP | Axios |
| Styling | Tailwind CSS 4 |
| Code quality | Biome (`check` / `fix`) |
| Typecheck | TypeScript (`tsc -b`) |
| Git hooks | Husky + commitlint (conventional commits) |
| Production image | Multi-stage Docker + nginx |

## Quick start

```bash
# Enter the project directory
cd reactjs-template

# Install deps and create .env
make setup
# Set VITE_API_URL (must be a valid URL; validated at startup via Zod)

# Start the dev server
make start
```

App: `http://127.0.0.1:3000`

## Environment

| Variable | Description |
| --- | --- |
| `VITE_API_URL` | Backend API base URL (exposed to the client by Vite) |

Validated in `src/configs/env.ts`. Missing or invalid values fail fast on boot / build.

Vite inlines `VITE_*` at **build time**. The value must be reachable from the **browser** (not an internal Docker service hostname unless the browser can resolve it).

## Commands

| Command | Description |
| --- | --- |
| `make setup` | Install deps and create `.env` from `.env.example` |
| `make start` | Run Vite dev server |
| `make check` | Biome check (format, lint, assist — report only) |
| `make fix` | Biome check --write (apply safe fixes) |
| `make typecheck` | TypeScript build-mode check (`tsc -b --noEmit`) |

Or run directly via npm:

```bash
npm install
npm run start
npm run check
npm run fix
npm run typecheck
npm run build
npm run preview
```

## Docker

Multi-stage build: compile the SPA with Node, serve `dist/` with nginx (SPA `try_files` fallback in `nginx.conf`).

```bash
# Build (VITE_API_URL is required — baked into the bundle)
docker build \
  --build-arg VITE_API_URL=http://localhost:8000 \
  -t reactjs-template .

# Run (host 3000 → container nginx 80)
docker run --rm -p 3000:80 reactjs-template
```

App: `http://127.0.0.1:3000` (same port as local Vite)

Verify SPA routing: open `/login` and refresh — nginx should still serve the app (not a raw 404).

## Project structure

```
reactjs-template/
│
├── src/
│   ├── configs/
│   │   └── env.ts
│   │
│   ├── modules/
│   │   ├── auth/
│   │   │   ├── utils/
│   │   │   │   └── session.ts
│   │   │   ├── api.ts
│   │   │   ├── constants.ts
│   │   │   ├── http-interceptors.ts
│   │   │   ├── mapper.ts
│   │   │   ├── query.ts
│   │   │   ├── schemas.ts
│   │   │   └── store.ts
│   │   │
│   │   └── ...
│   │
│   ├── providers/
│   │   ├── query-provider.tsx
│   │   └── router-provider.tsx
│   │
│   ├── routes/
│   │   ├── _protected/
│   │   │   └── index.tsx
│   │   ├── _public/
│   │   │   └── login.tsx
│   │   ├── __root.tsx
│   │   ├── _protected.tsx
│   │   └── _public.tsx
│   │
│   ├── shared/
│   │   ├── api/
│   │   │   └── http-client.ts
│   │   ├── hooks/
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
├── nginx.conf
├── .gitignore
├── tsr.config.json
├── vite.config.ts
├── tsconfig.json
├── tsconfig.app.json
├── tsconfig.node.json
└── README.md
```
