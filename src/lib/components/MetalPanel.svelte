<script lang="ts">
  import type { Snippet } from 'svelte';

  let {
    children,
    className = '',
    label
  }: { children: Snippet; className?: string; label?: string } = $props();
</script>

<div class="metal-panel panel {className}">
  {#if label}<span class="panel__label">{label}</span>{/if}
  <div class="panel__content">{@render children()}</div>
</div>

<style>
  .panel {
    padding: clamp(20px, 3vw, 34px);
  }

  .panel__label {
    position: absolute;
    z-index: 1;
    top: -1px;
    right: 18px;
    padding: 6px 12px;
    color: var(--ink-950);
    background: var(--silver);
    font: 700 0.58rem/1 var(--mono);
    letter-spacing: 0.12em;
    text-transform: uppercase;
  }

  .panel__content {
    position: relative;
    z-index: 1;
  }
</style>
