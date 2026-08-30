<script lang="ts">
  let {
    number,
    title,
    kicker = 'Portfolio index'
  }: { number: string; title: string; kicker?: string } = $props();
</script>

<header class="section-header">
  <div class="section-header__meta">
    <span>{number}</span>
    <span>{kicker}</span>
  </div>
  <h2>{title}</h2>
  <span class="section-header__mark" aria-hidden="true">◆</span>
</header>

<style>
  .section-header {
    display: grid;
    grid-template-columns: minmax(150px, 0.6fr) minmax(0, 2fr) auto;
    align-items: end;
    gap: 22px;
    padding: 0 0 15px;
    border-bottom: 1px solid rgba(190, 201, 218, 0.42);
  }

  .section-header__meta {
    display: flex;
    gap: 18px;
    padding-bottom: 6px;
    color: var(--muted);
    font: 700 0.61rem/1 var(--mono);
    letter-spacing: 0.12em;
    text-transform: uppercase;
  }

  h2 {
    margin: 0;
    font: 700 clamp(2.8rem, 6.2vw, 6.6rem)/0.76 var(--display);
    letter-spacing: -0.045em;
    text-transform: uppercase;
  }

  .section-header__mark {
    padding-bottom: 3px;
    color: var(--cyan);
    font-size: 0.65rem;
    filter: drop-shadow(0 0 6px rgba(99, 216, 255, 0.65));
  }

  @media (max-width: 680px) {
    .section-header {
      grid-template-columns: 1fr auto;
      gap: 12px;
    }

    .section-header__meta {
      grid-column: 1 / -1;
    }

    h2 {
      font-size: clamp(2.6rem, 14vw, 4.5rem);
    }
  }
</style>
