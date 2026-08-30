# Zain Ahmed - Portfolio

A Y2K console-inspired portfolio for a UI/UX designer and web developer. Built with SvelteKit, Svelte 5, TypeScript, and Tailwind CSS v4.

## Local development

```bash
npm install
npm run dev
```

## Quality checks

```bash
npm run check
npm run build
```

Project records live in `src/lib/data/projects.ts`. The UI reads from that typed data layer so it can later be replaced with a Supabase query without restructuring the presentation components.
