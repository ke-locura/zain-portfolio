<script lang="ts">
  import SectionHeader from '$lib/components/SectionHeader.svelte';
  import WebProject from '$lib/components/WebProject.svelte';
  import { projects } from '$lib/data/projects';
</script>

<svelte:head>
  <title>My Web - Zain Ahmed</title>
  <meta name="description" content="A personal directory of websites and applications by Zain Ahmed." />
</svelte:head>

<div class="page-shell web-page">
  <header class="page-intro">
    <div><p class="eyebrow">Personal internet directory / 03</p><h1 class="display-title chrome-text">My web</h1><p class="body-copy">My projects do not all live inside this portfolio. This section acts as a directory for the websites and applications I build and deploy across the web.</p></div>
    <aside class="page-intro__side recessed"><div class="web-readout"><span>DIRECTORY STATUS</span><strong>{projects.length.toString().padStart(2, '0')}</strong></div><p class="micro-label">PROJECT CHANNELS INDEXED</p><div class="web-meter" aria-hidden="true"><i></i></div></aside>
  </header>

  <section class="web-list" aria-labelledby="directory-title"><div id="directory-title"><SectionHeader number="03.A" title="Directory" kicker="Sites / live systems" /></div><div class="web-list__chassis metal-panel"><div class="web-list__labels" aria-hidden="true"><span>NO.</span><span>IDENTITY / TYPE</span><span>TECHNOLOGY</span><span>STATUS</span><span>VISIT</span></div>{#each projects as project}<WebProject {project} />{/each}</div></section>

  <section class="web-note" aria-labelledby="web-note-title"><span class="web-note__mark" aria-hidden="true">WWW</span><div><p class="eyebrow">About this directory</p><h2 id="web-note-title">A personal portal for work across the web.</h2></div><p>Project status here is maintained as a simple project note, not live monitoring. Open a project when you want to explore its interface and case study.</p></section>
</div>

<style>
  .web-readout { display: flex; align-items: end; justify-content: space-between; gap: 20px; color: var(--muted); font: 700 0.58rem/1 var(--mono); letter-spacing: 0.08em; } .web-readout strong { color: var(--cyan); font: 700 3.5rem/0.75 var(--display); } .page-intro__side .micro-label { display: block; margin-top: 13px; } .web-meter { position: relative; height: 4px; margin-top: 22px; overflow: hidden; background: #02040a; box-shadow: inset 0 1px 2px black; } .web-meter i { display: block; width: 74%; height: 100%; background: linear-gradient(90deg, var(--cobalt), var(--cyan)); }
  .web-list__chassis { margin-top: clamp(42px, 6vw, 72px); padding: 0; overflow: hidden; } .web-list__chassis::after { display: none; } .web-list__labels { display: grid; grid-template-columns: 54px minmax(220px, 1.3fr) minmax(210px, 0.8fr) auto auto; gap: clamp(15px, 2.5vw, 38px); padding: 11px clamp(16px, 2.4vw, 30px); color: var(--ink-950); background: linear-gradient(180deg, #e5e8ed, #858e9b 44%, #cbd0d8 53%, #626c79); font: 700 0.52rem/1 var(--mono); letter-spacing: 0.08em; }
  .web-note { position: relative; display: grid; grid-template-columns: minmax(0, 1.2fr) minmax(280px, 0.7fr); align-items: end; gap: clamp(35px, 7vw, 100px); margin-top: clamp(100px, 13vw, 190px); padding: clamp(34px, 6vw, 70px); overflow: hidden; border-block: 1px solid rgba(190, 201, 218, 0.25); background: linear-gradient(110deg, rgba(78, 105, 224, 0.11), transparent 55%, rgba(154, 125, 255, 0.07)); } .web-note > div, .web-note > p { position: relative; z-index: 1; } .web-note h2 { max-width: 15ch; margin: 18px 0 0; font: 700 clamp(3rem, 5vw, 5.8rem)/0.82 var(--display); letter-spacing: -0.05em; text-transform: uppercase; } .web-note > p { margin: 0; color: var(--muted); line-height: 1.65; } .web-note__mark { position: absolute; right: 2%; bottom: -16%; opacity: 0.05; font: 700 clamp(8rem, 21vw, 21rem)/0.8 var(--display); letter-spacing: -0.08em; }
  @media (max-width: 950px) { .web-list__labels { grid-template-columns: 40px 1fr auto; } .web-list__labels span:nth-child(3), .web-list__labels span:nth-child(5) { display: none; } } @media (max-width: 700px) { .web-list__labels { display: none; } .web-note { grid-template-columns: 1fr; align-items: start; padding-inline: 20px; } }
</style>
