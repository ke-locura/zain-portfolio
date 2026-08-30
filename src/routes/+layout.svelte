<script lang="ts">
  import '@fontsource/rajdhani/500.css';
  import '@fontsource/rajdhani/600.css';
  import '@fontsource/rajdhani/700.css';
  import '@fontsource/space-mono/400.css';
  import '@fontsource/space-mono/700.css';
  import '../app.css';
  import type { Snippet } from 'svelte';
  import Footer from '$lib/components/Footer.svelte';
  import Navigation from '$lib/components/Navigation.svelte';

  let { children }: { children: Snippet } = $props();
</script>

<svelte:head>
  <meta name="description" content="The portfolio of Zain Ahmed, a UI/UX designer and web developer working across interface design, frontend applications, and full stack products." />
</svelte:head>

<a class="skip-link" href="#main-content">Skip to content</a>
<div class="site-frame"><Navigation /><main id="main-content">{@render children()}</main><Footer /></div>
