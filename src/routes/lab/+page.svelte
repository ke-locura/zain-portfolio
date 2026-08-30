<script lang="ts">
  import LabCard from '$lib/components/LabCard.svelte';
  import SectionHeader from '$lib/components/SectionHeader.svelte';
  import { labExperiments } from '$lib/data/projects';
</script>

<svelte:head>
  <title>Lab - Zain Ahmed</title>
  <meta name="description" content="Experimental work across computer vision, WebGL, Rust, AI, audio, and technical prototypes." />
</svelte:head>

<div class="page-shell lab-page">
  <header class="page-intro lab-intro">
    <div>
      <p class="eyebrow">Experimental channel / 04</p>
      <h1 class="display-title chrome-text">The lab</h1>
      <p class="body-copy">Not everything I build needs to become a finished product. The Lab is where I experiment with computer vision, graphics, systems programming, AI, audio, strange interfaces, and whatever else seems interesting enough to try.</p>
    </div>
    <aside class="page-intro__side recessed lab-monitor" aria-hidden="true"><div class="monitor-grid"></div><div class="monitor-wave"><span></span><i></i></div><p>INPUT / UNSTABLE / 06 CHANNELS</p></aside>
  </header>

  <section aria-labelledby="experiments-title"><div id="experiments-title"><SectionHeader number="04.A" title="Experiments" kicker="Unsorted / in progress" /></div><div class="lab-categories" aria-label="Lab categories"><span>Computer Vision</span><span>OpenCV</span><span>WebGL</span><span>Rust</span><span>AI</span><span>Audio / VST</span><span>Experimental Interfaces</span><span>Technical Prototypes</span></div><div class="lab-grid">{#each labExperiments as item, index}<LabCard {item} {index} />{/each}</div></section>
</div>

<style>
  .lab-page { position: relative; } .lab-page::before { position: absolute; z-index: -1; top: 4%; right: -18%; width: 55%; aspect-ratio: 1; content: ''; transform: rotate(18deg); opacity: 0.18; background: repeating-linear-gradient(0deg, transparent 0 30px, rgba(101, 127, 255, 0.19) 31px), repeating-linear-gradient(90deg, transparent 0 30px, rgba(101, 127, 255, 0.19) 31px); mask-image: radial-gradient(circle, black, transparent 67%); }
  .lab-monitor { position: relative; min-height: 200px; overflow: hidden; } .monitor-grid { position: absolute; inset: 0; opacity: 0.22; background-image: linear-gradient(rgba(100, 213, 255, 0.24) 1px, transparent 1px), linear-gradient(90deg, rgba(100, 213, 255, 0.24) 1px, transparent 1px); background-size: 24px 24px; } .monitor-wave { position: absolute; top: 50%; left: 50%; width: 72%; height: 52%; transform: translate(-50%, -50%); border-block: 1px solid rgba(99, 216, 255, 0.2); } .monitor-wave::before { position: absolute; top: 50%; left: 0; width: 100%; height: 2px; content: ''; transform: skewY(-11deg); background: linear-gradient(90deg, transparent, var(--cyan) 15%, var(--violet) 62%, transparent); box-shadow: 0 0 9px rgba(99, 216, 255, 0.55); } .monitor-wave span, .monitor-wave i { position: absolute; width: 8px; height: 8px; background: var(--cyan); box-shadow: 0 0 10px var(--cyan); } .monitor-wave span { top: 23%; left: 32%; } .monitor-wave i { right: 18%; bottom: 17%; background: var(--violet); box-shadow: 0 0 10px var(--violet); } .lab-monitor p { position: absolute; bottom: 15px; left: 18px; margin: 0; color: var(--muted); font: 700 0.52rem/1 var(--mono); letter-spacing: 0.08em; }
  .lab-categories { display: flex; flex-wrap: wrap; gap: 7px; margin-top: 28px; } .lab-categories span { padding: 8px 11px; border: 1px solid rgba(188, 200, 218, 0.2); color: var(--muted); background: rgba(8, 12, 20, 0.65); font: 700 0.55rem/1 var(--mono); letter-spacing: 0.07em; text-transform: uppercase; }
  .lab-grid { display: grid; grid-template-columns: repeat(12, 1fr); gap: 10px; margin-top: clamp(42px, 6vw, 76px); } .lab-grid :global(.lab-card) { grid-column: span 4; } .lab-grid :global(.lab-card:nth-child(1)), .lab-grid :global(.lab-card:nth-child(5)) { grid-column: span 5; } .lab-grid :global(.lab-card:nth-child(2)), .lab-grid :global(.lab-card:nth-child(4)) { grid-column: span 7; }
  @media (max-width: 900px) { .lab-grid :global(.lab-card), .lab-grid :global(.lab-card:nth-child(1)), .lab-grid :global(.lab-card:nth-child(2)), .lab-grid :global(.lab-card:nth-child(4)), .lab-grid :global(.lab-card:nth-child(5)) { grid-column: span 6; } } @media (max-width: 600px) { .lab-grid :global(.lab-card), .lab-grid :global(.lab-card:nth-child(1)), .lab-grid :global(.lab-card:nth-child(2)), .lab-grid :global(.lab-card:nth-child(4)), .lab-grid :global(.lab-card:nth-child(5)) { grid-column: 1 / -1; } }
</style>
