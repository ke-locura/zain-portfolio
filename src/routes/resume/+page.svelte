<script lang="ts">
  import MechanicalButton from '$lib/components/MechanicalButton.svelte';
</script>

<svelte:head>
  <title>Resume - Zain Ahmed</title>
  <meta name="description" content="Resume for Zain Ahmed, a UI/UX designer and web developer." />
</svelte:head>

<div class="page-shell resume-page">
  <header class="resume-header"><div><p class="eyebrow">Profile document / 06</p><h1 class="display-title chrome-text">Resume</h1><p class="body-copy">Zain Ahmed<br />UI/UX Designer / Web Developer</p></div><div class="resume-actions"><MechanicalButton href="/resume.pdf" label="Open PDF" external /><a class="download-button" href="/resume.pdf" download="Zain-Ahmed-Resume.pdf">DOWNLOAD PDF</a></div></header>
  <section class="resume-viewer" aria-labelledby="resume-viewer-title"><h2 id="resume-viewer-title" class="screen-reader-only">Embedded resume PDF</h2><iframe src="/resume.pdf" title="Zain Ahmed resume PDF" loading="lazy"></iframe></section>
</div>

<style>
  .resume-header { display: flex; align-items: end; justify-content: space-between; gap: 30px; padding-bottom: clamp(40px, 6vw, 70px); } .resume-header h1 { margin: 18px 0 22px; } .resume-header .body-copy { margin: 0; } .resume-actions { display: flex; flex-wrap: wrap; gap: 10px; } .download-button { display: inline-flex; min-height: 46px; align-items: center; padding: 0 18px; border: 1px solid rgba(206, 214, 226, 0.38); border-radius: 3px; color: var(--paper); background: linear-gradient(180deg, #313946 0%, #111620 48%, #242b37 52%, #0c1018 100%); box-shadow: 0 3px 0 #020309, inset 0 1px 0 rgba(255, 255, 255, 0.16); font: 700 0.75rem/1 var(--mono); letter-spacing: 0.08em; text-decoration: none; } .download-button:hover { color: var(--cyan); } .resume-viewer { min-height: min(1100px, 78vh); overflow: hidden; border: 1px solid rgba(202, 209, 222, 0.34); background: #212633; box-shadow: 0 16px 45px rgba(0, 0, 0, 0.35), inset 0 1px 0 rgba(255, 255, 255, 0.13); } .resume-viewer iframe { display: block; width: 100%; height: min(1100px, 78vh); min-height: 720px; border: 0; background: white; } @media (max-width: 680px) { .resume-header { align-items: flex-start; flex-direction: column; } .resume-actions { width: 100%; } .resume-actions :global(.mechanical-button), .download-button { flex: 1; justify-content: center; } .resume-viewer, .resume-viewer iframe { min-height: 760px; height: 82vh; } }
</style>
