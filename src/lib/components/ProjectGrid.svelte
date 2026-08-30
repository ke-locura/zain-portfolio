<script lang="ts">
  import type { Project } from '$lib/types';
  import ProjectFeature from './ProjectFeature.svelte';

  let { projects }: { projects: Project[] } = $props();
</script>

<div class="project-grid">
  {#each projects as project, index}
    <ProjectFeature {project} reverse={index % 2 === 1} />
  {/each}
</div>

<style>
  .project-grid {
    display: block;
  }
</style>
