<script lang="ts">
  import { page } from '$app/state';
  import MechanicalButton from '$lib/components/MechanicalButton.svelte';
</script>

<svelte:head><title>{page.status} - Signal Lost</title></svelte:head>
<div class="error-page page-shell"><p class="eyebrow">Signal interrupted / {page.status}</p><h1 class="chrome-text">Channel<br />not found.</h1><p>{page.error?.message ?? 'The requested page could not be located.'}</p><MechanicalButton href="/" label="Return home" /></div>

<style>
  .error-page { min-height: 70svh; display: flex; justify-content: center; align-items: flex-start; flex-direction: column; } h1 { margin: 25px 0 28px; font: 700 clamp(5rem, 12vw, 12rem)/0.68 var(--display); letter-spacing: -0.07em; text-transform: uppercase; } .error-page > p:not(.eyebrow) { margin: 0 0 30px; color: var(--muted); }
</style>
