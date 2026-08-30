<script lang="ts">
  let { label }: { label: string } = $props();
</script>

<span class="tech-tag">{label}</span>

<style>
  .tech-tag {
    display: inline-flex;
    min-height: 26px;
    align-items: center;
    padding: 3px 9px;
    border: 1px solid rgba(175, 187, 205, 0.28);
    border-radius: 2px;
    color: #bec6d2;
    background: linear-gradient(180deg, rgba(59, 69, 84, 0.78), rgba(18, 23, 32, 0.92));
    box-shadow:
      inset 0 1px rgba(255, 255, 255, 0.08),
      0 1px 0 #03040a;
    font: 400 0.61rem/1 var(--mono);
    letter-spacing: 0.08em;
    text-transform: uppercase;
  }
</style>
