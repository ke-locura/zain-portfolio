<script lang="ts">
  import MechanicalButton from './MechanicalButton.svelte';

  let submitted = $state(false);

  function handleSubmit(event: SubmitEvent) {
    event.preventDefault();
    submitted = true;
  }
</script>

<form id="contact-form" class="contact-form metal-panel" onsubmit={handleSubmit}>
  <div class="form-topline">
    <span>TRANSMISSION FORM</span>
    <span>NO. 0047</span>
  </div>

  <p class="form-supporting">Tell me what you are working on and what you need help with.</p>

  <div class="form-grid">
    <label>
    <span>NAME</span>
      <input name="name" autocomplete="name" placeholder="Your name" required />
    </label>
    <label>
    <span>EMAIL</span>
      <input name="email" type="email" autocomplete="email" placeholder="you@example.com" required />
    </label>
  </div>

  <label>
    <span>SUBJECT</span>
    <input name="subject" placeholder="Project, role, or collaboration" required />
  </label>

  <label>
    <span>MESSAGE</span>
    <textarea name="message" rows="7" placeholder="Tell me what you would like to make." required></textarea>
  </label>

  <div class="form-actions">
    <MechanicalButton label="Send message" type="submit" />
    <p class:visible={submitted} aria-live="polite" aria-atomic="true">
      {submitted ? 'FORM UI ONLY / TRANSMISSION NOT SENT' : ''}
    </p>
  </div>
</form>

<style>
  .contact-form {
    display: flex;
    flex-direction: column;
    gap: 22px;
    padding: clamp(22px, 4vw, 42px);
  }

  .contact-form > * {
    position: relative;
    z-index: 1;
  }

  .form-topline {
    display: flex;
    justify-content: space-between;
    padding-bottom: 12px;
    border-bottom: 1px solid rgba(192, 203, 219, 0.3);
    color: var(--muted);
    font: 700 0.58rem/1 var(--mono);
    letter-spacing: 0.1em;
  }

  .form-supporting {
    margin: -8px 0 0;
    color: var(--muted);
    font-size: 0.9rem;
    line-height: 1.55;
  }

  .form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 16px;
  }

  label {
    display: flex;
    flex-direction: column;
    gap: 8px;
    color: var(--silver);
    font: 700 0.59rem/1 var(--mono);
    letter-spacing: 0.1em;
  }

  input,
  textarea {
    width: 100%;
    border: 1px solid rgba(177, 189, 207, 0.31);
    border-radius: 2px;
    color: var(--paper);
    background: linear-gradient(180deg, #070911, #0d121c);
    box-shadow:
      inset 0 3px 9px rgba(0, 0, 0, 0.82),
      0 1px rgba(255, 255, 255, 0.08);
    font: 400 0.92rem/1.4 var(--body);
    transition:
      border-color 160ms ease,
      background 160ms ease;
  }

  input {
    min-height: 50px;
    padding: 0 14px;
  }

  textarea {
    min-height: 150px;
    padding: 14px;
    resize: vertical;
  }

  input::placeholder,
  textarea::placeholder {
    color: #677181;
  }

  input:focus,
  textarea:focus {
    outline: none;
    border-color: var(--cyan);
    background: #090e19;
    box-shadow:
      inset 0 3px 9px rgba(0, 0, 0, 0.82),
      0 0 0 1px rgba(99, 216, 255, 0.2);
  }

  .form-actions {
    display: flex;
    align-items: center;
    gap: 20px;
    padding-top: 3px;
  }

  .form-actions p {
    margin: 0;
    opacity: 0;
    color: var(--amber);
    font: 700 0.55rem/1.4 var(--mono);
    letter-spacing: 0.08em;
    transition: opacity 180ms ease;
  }

  .form-actions p.visible {
    opacity: 1;
  }

  @media (max-width: 620px) {
    .form-grid {
      grid-template-columns: 1fr;
    }

    .form-actions {
      align-items: stretch;
      flex-direction: column;
    }
  }
</style>
