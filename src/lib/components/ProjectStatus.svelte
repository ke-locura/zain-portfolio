<script lang="ts">
  import type { ProjectStatus } from '$lib/types';

  let { status }: { status: ProjectStatus } = $props();

  const statusClass = $derived(status.toLowerCase().replaceAll(' ', '-'));
</script>

<span class="project-status {statusClass}">
  <span class="status-light" aria-hidden="true"></span>
  <span>{status}</span>
</span>

<style>
  .project-status {
    display: inline-flex;
    min-height: 28px;
    align-items: center;
    gap: 8px;
    padding: 4px 9px;
    border: 1px solid rgba(176, 188, 207, 0.28);
    border-radius: 2px;
    color: var(--silver);
    background: #0b0f17;
    box-shadow: inset 0 2px 5px rgba(0, 0, 0, 0.8);
    font: 700 0.58rem/1 var(--mono);
    letter-spacing: 0.1em;
    white-space: nowrap;
  }

  .status-light {
    width: 6px;
    height: 6px;
    border-radius: 1px;
    background: var(--cyan);
    box-shadow: 0 0 8px rgba(99, 216, 255, 0.72);
    animation: signal 2.4s ease-in-out infinite;
  }

  .in-development .status-light,
  .development .status-light {
    background: var(--amber);
    box-shadow: 0 0 8px rgba(239, 187, 98, 0.62);
  }

  .prototype .status-light {
    background: var(--violet);
    box-shadow: 0 0 8px rgba(154, 125, 255, 0.65);
  }

  @keyframes signal {
    0%, 68%, 100% { opacity: 1; }
    76% { opacity: 0.32; }
  }
</style>
