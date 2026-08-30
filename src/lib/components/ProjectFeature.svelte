<script lang="ts">
  import type { Project } from '$lib/types';
  import MechanicalButton from './MechanicalButton.svelte';
  import ProjectStatus from './ProjectStatus.svelte';
  import ProjectVisual from './ProjectVisual.svelte';
  import TechTag from './TechTag.svelte';

  let { project, reverse = false }: { project: Project; reverse?: boolean } = $props();
</script>

<article class:reverse class="project-feature" style={`--project-accent: ${project.accent}`}>
  <a class="project-visual-link" href={`/work/${project.slug}`}><span class="screen-reader-only">View {project.name} case study</span><ProjectVisual {project} decorative /></a>
  <div class="project-info"><div class="project-info__top"><span class="project-number">PROJECT / {project.number}</span><ProjectStatus status={project.status} /></div><div><p class="project-category">{project.category}</p><h3>{project.name}</h3><p class="project-role">{project.role}</p></div><p class="project-description">{project.description}</p><div class="project-tech" aria-label="Technologies">{#each project.technologies as technology}<TechTag label={technology} />{/each}</div><div class="project-actions"><MechanicalButton href={`/work/${project.slug}`} label="View case study" /><MechanicalButton href={project.live_url} label="Visit project" variant="ghost" external /></div></div>
</article>

<style>
  .project-feature { display: grid; grid-template-columns: minmax(0, 1.55fr) minmax(300px, 0.75fr); gap: clamp(32px, 5vw, 78px); align-items: center; padding-block: clamp(54px, 8vw, 112px); border-bottom: 1px solid rgba(184, 196, 214, 0.19); } .project-feature.reverse { grid-template-columns: minmax(300px, 0.75fr) minmax(0, 1.55fr); } .reverse .project-visual-link { order: 2; } .project-visual-link { display: block; border-radius: 5px; transition: transform 220ms cubic-bezier(0.22, 0.8, 0.22, 1); } .project-visual-link:hover { transform: translateY(-3px); } .project-info { display: flex; min-width: 0; flex-direction: column; gap: clamp(22px, 3vw, 34px); } .project-info__top { display: flex; align-items: center; justify-content: space-between; gap: 16px; padding-bottom: 11px; border-bottom: 1px solid rgba(186, 198, 216, 0.28); } .project-number, .project-category, .project-role { margin: 0; color: var(--muted); font: 700 0.62rem/1.4 var(--mono); letter-spacing: 0.1em; text-transform: uppercase; } .project-category { margin-bottom: 8px; color: var(--project-accent); } h3 { margin: 0 0 9px; font: 700 clamp(3rem, 5vw, 5.7rem)/0.78 var(--display); letter-spacing: -0.05em; text-transform: uppercase; } .project-role { color: var(--silver); } .project-description { max-width: 49ch; margin: 0; color: var(--muted); font-size: 0.98rem; line-height: 1.65; } .project-tech, .project-actions { display: flex; flex-wrap: wrap; gap: 7px; } .project-actions { gap: 10px; }
  @media (max-width: 980px) { .project-feature, .project-feature.reverse { grid-template-columns: 1fr; gap: 40px; } .reverse .project-visual-link { order: 0; } .project-info { display: grid; grid-template-columns: 1fr 1fr; align-items: start; } .project-info__top, .project-actions { grid-column: 1 / -1; } } @media (max-width: 620px) { .project-feature { gap: 28px; padding-block: 46px; } .project-info { display: flex; } h3 { font-size: clamp(2.8rem, 15vw, 4.5rem); } .project-actions :global(.mechanical-button) { flex: 1; } }
</style>
