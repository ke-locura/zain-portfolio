<script lang="ts">
  import { ArrowRight, ArrowUpRight } from 'lucide-svelte';

  type Variant = 'primary' | 'dark' | 'ghost';

  let {
    href,
    label,
    variant = 'primary',
    external = false,
    disabled = false,
    type = 'button',
    onclick
  }: {
    href?: string;
    label: string;
    variant?: Variant;
    external?: boolean;
    disabled?: boolean;
    type?: 'button' | 'submit';
    onclick?: (event: MouseEvent) => void;
  } = $props();
</script>

{#if href && !disabled}
  <a
    class="mechanical-button {variant}"
    {href}
    target={external ? '_blank' : undefined}
    rel={external ? 'noopener noreferrer' : undefined}
  >
    <span>{label}</span>
    {#if external}
      <ArrowUpRight size={16} strokeWidth={1.8} aria-hidden="true" />
    {:else}
      <ArrowRight size={16} strokeWidth={1.8} aria-hidden="true" />
    {/if}
  </a>
{:else}
  <button class="mechanical-button {variant}" {type} {disabled} {onclick}>
    <span>{label}</span>
    <ArrowRight size={16} strokeWidth={1.8} aria-hidden="true" />
  </button>
{/if}

<style>
  .mechanical-button {
    position: relative;
    display: inline-flex;
    min-height: 46px;
    align-items: center;
    justify-content: space-between;
    gap: 28px;
    padding: 0 18px;
    overflow: hidden;
    border: 1px solid #f5f7fa;
    border-radius: 3px;
    color: #080a10;
    background:
      linear-gradient(90deg, transparent 0 48%, rgba(255, 255, 255, 0.28) 50%, transparent 53%),
      linear-gradient(180deg, #f7f8fa 0%, #a6aebb 18%, #e7eaf0 49%, #747e8d 52%, #cbd1da 100%);
    background-size: 220% 100%, 100% 100%;
    box-shadow:
      0 3px 0 #03050a,
      inset 0 1px 0 white,
      inset 0 -1px 0 #555e6b;
    font: 700 0.75rem/1 var(--mono);
    letter-spacing: 0.08em;
    text-decoration: none;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      transform 120ms ease,
      box-shadow 120ms ease,
      background-position 360ms ease;
  }

  .mechanical-button:hover {
    background-position: -120% 0, 0 0;
  }

  .mechanical-button:active {
    transform: translateY(2px);
    box-shadow:
      0 1px 0 #03050a,
      inset 0 2px 5px rgba(0, 0, 0, 0.5);
  }

  .mechanical-button.dark {
    color: var(--paper);
    border-color: rgba(206, 214, 226, 0.38);
    background:
      linear-gradient(90deg, transparent 0 48%, rgba(112, 220, 255, 0.18) 50%, transparent 53%),
      linear-gradient(180deg, #313946 0%, #111620 48%, #242b37 52%, #0c1018 100%);
    background-size: 220% 100%, 100% 100%;
    box-shadow:
      0 3px 0 #020309,
      inset 0 1px 0 rgba(255, 255, 255, 0.16);
  }

  .mechanical-button.ghost {
    color: var(--silver);
    border-color: rgba(206, 214, 226, 0.25);
    background: rgba(9, 12, 20, 0.66);
    box-shadow:
      0 2px 0 #020309,
      inset 0 1px 0 rgba(255, 255, 255, 0.07);
  }

  .mechanical-button:disabled {
    color: var(--muted-dark);
    cursor: not-allowed;
    filter: grayscale(0.7);
  }

  @media (max-width: 440px) {
    .mechanical-button {
      width: 100%;
    }
  }
</style>
