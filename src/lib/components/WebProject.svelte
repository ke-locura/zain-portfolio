<script lang="ts">
  import { ArrowUpRight } from 'lucide-svelte';
  import type { Project } from '$lib/types';
  import ProjectStatus from './ProjectStatus.svelte';

  let { project }: { project: Project } = $props();
</script>

<article class="web-project" id={project.slug} style={`--project-accent: ${project.accent}`}>
  <span class="web-project__number">{project.number}</span>
  <div class="web-project__identity">
    <h3><a href={`/work/${project.slug}`}>{project.name}</a></h3>
    <p>{project.web_label}</p>
    <small>{project.description}</small>
  </div>
  <div class="web-project__stack">{#each project.technologies.slice(0, 3) as tech}<span>{tech}</span>{/each}</div>
  <ProjectStatus status={project.status} />
  <a class="web-project__visit" href={project.live_url} target="_blank" rel="noopener noreferrer"><span>OPEN WEBSITE</span><ArrowUpRight size={18} strokeWidth={1.7} aria-hidden="true" /></a>
</article>

<style>
  .web-project { position: relative; display: grid; grid-template-columns: 54px minmax(220px, 1.3fr) minmax(210px, 0.8fr) auto auto; min-height: 130px; align-items: center; gap: clamp(15px, 2.5vw, 38px); padding: 20px clamp(16px, 2.4vw, 30px); border-bottom: 1px solid rgba(183, 195, 214, 0.22); background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.018), transparent); transition: background 180ms ease; } .web-project::before { position: absolute; top: 0; bottom: 0; left: 0; width: 2px; content: ''; transform: scaleY(0.2); background: var(--project-accent); transition: transform 180ms ease; } .web-project:hover { background: linear-gradient(90deg, rgba(255, 255, 255, 0.045), transparent 70%); } .web-project:hover::before { transform: scaleY(1); }
  .web-project__number { color: var(--project-accent); font: 700 0.7rem/1 var(--mono); } h3 { margin: 0; font: 700 clamp(2rem, 3vw, 3.5rem)/0.88 var(--display); letter-spacing: -0.035em; text-transform: uppercase; } h3 a { text-decoration: none; } p { margin: 5px 0 0; color: var(--muted); font: 700 0.57rem/1.3 var(--mono); letter-spacing: 0.08em; text-transform: uppercase; } .web-project__identity small { display: block; max-width: 48ch; margin-top: 9px; color: var(--muted-dark); font: 400 0.72rem/1.45 var(--body); letter-spacing: 0; text-transform: none; } .web-project__stack { display: flex; flex-wrap: wrap; gap: 7px 12px; color: var(--muted); font: 400 0.59rem/1.2 var(--mono); text-transform: uppercase; } .web-project__stack span + span::before { margin-right: 12px; color: var(--steel); content: '/'; }
  .web-project > a.web-project__visit { display: flex; min-height: 42px; align-items: center; gap: 9px; padding: 0 12px; border: 1px solid rgba(198, 207, 221, 0.3); border-radius: 2px; color: var(--silver); background: linear-gradient(180deg, #2b323e, #0a0d14); font: 700 0.58rem/1 var(--mono); letter-spacing: 0.08em; text-decoration: none; } .web-project__identity h3 a:hover, .web-project__visit:hover { color: var(--cyan); }
  @media (max-width: 1100px) { .web-project { grid-template-columns: 40px 1fr auto; } .web-project__stack { grid-column: 2; } .web-project > :global(.project-status) { grid-column: 3; grid-row: 1; } .web-project > a.web-project__visit { grid-column: 3; grid-row: 2; } } @media (max-width: 600px) { .web-project { grid-template-columns: 28px 1fr; min-height: 0; padding-block: 24px; } .web-project__stack, .web-project > :global(.project-status), .web-project > a.web-project__visit { grid-column: 2; grid-row: auto; justify-self: start; } }
</style>
