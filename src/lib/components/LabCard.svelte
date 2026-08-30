<script lang="ts">
  import { Activity } from 'lucide-svelte';
  import type { LabExperiment } from '$lib/types';

  let { item, index }: { item: LabExperiment; index: number } = $props();
</script>

<article class="lab-card variant-{index % 3}">
  <div class="lab-card__display" aria-hidden="true">
    <div class="oscilloscope"><span></span><i></i><b></b></div>
    <span class="lab-code">{item.signal}</span>
    <span class="cross c1">+</span>
    <span class="cross c2">+</span>
  </div>
  <div class="lab-card__body">
    <div class="lab-card__meta"><span>{item.number}</span><span>{item.field}</span></div>
    <h3>{item.title}</h3>
    <p>{item.description}</p>
    <div class="lab-status">
      <span>EXPERIMENT SIGNAL</span><Activity size={17} strokeWidth={1.7} aria-hidden="true" />
    </div>
  </div>
</article>

<style>
  .lab-card {
    position: relative;
    display: grid;
    min-height: 430px;
    grid-template-rows: 1.12fr 0.88fr;
    overflow: hidden;
    border: 1px solid rgba(187, 199, 218, 0.31);
    border-radius: 3px;
    background: #0a0d15;
    box-shadow:
      0 15px 36px rgba(0, 0, 0, 0.32),
      inset 0 1px rgba(255, 255, 255, 0.08);
  }

  .lab-card__display {
    position: relative;
    overflow: hidden;
    border-bottom: 1px solid rgba(190, 200, 216, 0.25);
    background:
      radial-gradient(circle at 55% 50%, rgba(91, 114, 255, 0.2), transparent 34%),
      repeating-linear-gradient(0deg, transparent 0 19px, rgba(120, 145, 196, 0.08) 20px),
      repeating-linear-gradient(90deg, transparent 0 19px, rgba(120, 145, 196, 0.08) 20px),
      #080d18;
  }

  .variant-1 .lab-card__display {
    background:
      radial-gradient(circle at 35% 45%, rgba(97, 216, 255, 0.17), transparent 28%),
      repeating-linear-gradient(45deg, transparent 0 13px, rgba(97, 216, 255, 0.06) 14px),
      #080d18;
  }

  .variant-2 .lab-card__display {
    background:
      radial-gradient(circle at 67% 38%, rgba(201, 107, 239, 0.16), transparent 25%),
      repeating-linear-gradient(135deg, transparent 0 22px, rgba(154, 125, 255, 0.06) 23px),
      #0c0a15;
  }

  .oscilloscope {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 62%;
    aspect-ratio: 1;
    transform: translate(-50%, -50%) rotate(18deg);
    border: 1px solid rgba(103, 218, 255, 0.36);
    border-radius: 50%;
    box-shadow:
      0 0 0 21px rgba(101, 118, 255, 0.035),
      0 0 0 42px rgba(101, 118, 255, 0.025);
    animation: lab-orbit 9s linear infinite;
  }

  .oscilloscope::before,
  .oscilloscope::after,
  .oscilloscope span {
    position: absolute;
    content: '';
    border: 1px solid rgba(154, 125, 255, 0.45);
  }

  .oscilloscope::before { inset: 18%; transform: rotate(36deg); }
  .oscilloscope::after { inset: 37%; border-color: rgba(211, 109, 245, 0.68); border-radius: 50%; }
  .oscilloscope span { top: 50%; left: -18%; width: 136%; height: 1px; border: 0; background: linear-gradient(90deg, transparent, var(--cyan), transparent); }
  .oscilloscope i, .oscilloscope b { position: absolute; width: 7px; height: 7px; background: var(--cyan); box-shadow: 0 0 12px var(--cyan); }
  .oscilloscope i { top: 8%; left: 28%; }
  .oscilloscope b { right: 9%; bottom: 26%; background: var(--violet); box-shadow: 0 0 12px var(--violet); }

  @keyframes lab-orbit { to { transform: translate(-50%, -50%) rotate(378deg); } }

  .lab-code { position: absolute; bottom: 12px; left: 14px; color: #8290a7; font: 700 0.55rem/1 var(--mono); letter-spacing: 0.1em; }
  .cross { position: absolute; color: rgba(220, 229, 241, 0.45); font: 400 0.72rem/1 var(--mono); }
  .c1 { top: 12px; right: 14px; } .c2 { bottom: 13px; right: 15px; }

  .lab-card__body {
    display: flex;
    flex-direction: column;
    padding: clamp(20px, 3vw, 30px);
    background:
      repeating-linear-gradient(0deg, transparent 0 2px, rgba(255, 255, 255, 0.012) 2px 3px),
      linear-gradient(145deg, #222936, #0d1119);
  }

  .lab-card__meta { display: flex; justify-content: space-between; color: var(--muted); font: 700 0.57rem/1 var(--mono); letter-spacing: 0.08em; text-transform: uppercase; }
  h3 { margin: 18px 0 10px; font: 700 clamp(2.6rem, 4vw, 4rem)/0.78 var(--display); letter-spacing: -0.04em; text-transform: uppercase; }
  p { margin: 0 0 24px; color: var(--muted); font-size: 0.88rem; line-height: 1.55; }
  .lab-status { display: inline-flex; min-height: 42px; align-items: center; justify-content: space-between; gap: 15px; margin-top: auto; padding: 0; border-top: 1px solid rgba(191, 202, 218, 0.22); color: var(--muted); font: 700 0.58rem/1 var(--mono); letter-spacing: 0.08em; }
  .lab-status :global(svg) { color: var(--cyan); }
</style>
