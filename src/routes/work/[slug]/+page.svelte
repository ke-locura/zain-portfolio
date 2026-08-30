<script lang="ts">
  import CaseStudy from '$lib/components/CaseStudy.svelte';
  import type { PageData } from './$types';

  let { data }: { data: PageData } = $props();
</script>

<svelte:head>
  <title>{data.project.name} - Case Study - Zain Ahmed</title>
  <meta name="description" content={`${data.project.name} interface design and web development case study.`} />
</svelte:head>

<CaseStudy project={data.project} nextProject={data.nextProject} />
