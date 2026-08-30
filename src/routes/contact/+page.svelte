<script lang="ts">
  import { FileText, Github, Linkedin, Mail } from 'lucide-svelte';
  import ContactForm from '$lib/components/ContactForm.svelte';
  import MechanicalButton from '$lib/components/MechanicalButton.svelte';
  import SectionHeader from '$lib/components/SectionHeader.svelte';

  const channels = [
    { label: 'Email', value: 'zainahmed23professional@gmail.com', href: 'mailto:zainahmed23professional@gmail.com', icon: Mail },
    { label: 'GitHub', value: 'github.com/ke-locura', href: 'https://github.com/ke-locura', icon: Github },
    { label: 'LinkedIn', value: 'linkedin.com/in/zain-ahmed-982aa434', href: 'https://www.linkedin.com/in/zain-ahmed-982aa434?utm_source=share_via&utm_content=profile&utm_medium=member_android', icon: Linkedin },
    { label: 'Resume', value: 'Embedded PDF / open route', href: '/resume', icon: FileText }
  ];
</script>

<svelte:head>
  <title>Contact - Zain Ahmed</title>
  <meta name="description" content="Contact Zain Ahmed about UI/UX design and web development work." />
</svelte:head>

<div class="page-shell contact-page">
  <header class="contact-hero"><p class="eyebrow">Open channel / 05</p><h1 class="display-title chrome-text">Let's make<br />something.</h1><p class="body-copy">Have a project, role, idea, or something interesting to build? Get in touch.</p><div class="contact-axis" aria-hidden="true"><i></i><span></span></div></header>

  <section class="contact-interface" aria-labelledby="contact-form-title">
    <div class="contact-channels"><div id="contact-form-title"><SectionHeader number="05.A" title="Connect" kicker="Choose a channel" /></div><div class="channel-list">
      {#each channels as channel, index}<a class="channel-link" href={channel.href} target={channel.label === 'Email' || channel.label === 'Resume' ? undefined : '_blank'} rel={channel.label === 'Email' || channel.label === 'Resume' ? undefined : 'noopener noreferrer'}><span class="channel-number">{String(index + 1).padStart(2, '0')}</span><svelte:component this={channel.icon} size={19} strokeWidth={1.5} aria-hidden="true" /><div><strong>{channel.label}</strong><span>{channel.value}</span></div><b aria-hidden="true">↗</b></a>{/each}
    </div><p class="channel-note">PORTFOLIO CONTACT INTERFACE<br />FORM UI ONLY / TRANSMISSION NOT SENT</p><MechanicalButton href="/resume" label="View resume" variant="dark" /></div>
    <ContactForm />
  </section>
</div>

<style>
  .contact-hero { position: relative; min-height: 530px; padding: clamp(40px, 7vw, 90px) 0; overflow: hidden; } .contact-hero h1 { position: relative; z-index: 1; margin: 24px 0 32px; font-size: clamp(5rem, 11vw, 11.8rem); } .contact-hero .body-copy { position: relative; z-index: 1; } .contact-axis { position: absolute; right: 0; bottom: 8%; width: 48%; aspect-ratio: 1.7; transform: rotate(-15deg); border: 1px solid rgba(95, 126, 255, 0.24); border-radius: 50%; } .contact-axis::before, .contact-axis::after { position: absolute; content: ''; border: 1px solid rgba(154, 125, 255, 0.22); border-radius: 50%; } .contact-axis::before { inset: 18%; } .contact-axis::after { inset: 34%; } .contact-axis i { position: absolute; top: 50%; left: -15%; width: 130%; height: 1px; background: linear-gradient(90deg, transparent, var(--cyan), transparent); } .contact-axis span { position: absolute; top: 18%; left: 27%; width: 9px; height: 9px; background: var(--cyan); box-shadow: 0 0 12px var(--cyan); }
  .contact-interface { display: grid; grid-template-columns: minmax(280px, 0.72fr) minmax(440px, 1.25fr); gap: clamp(28px, 5vw, 72px); align-items: start; } .channel-list { display: flex; flex-direction: column; margin-top: 40px; border-top: 1px solid rgba(188, 200, 218, 0.22); } .channel-link { display: grid; grid-template-columns: 26px auto 1fr auto; min-height: 74px; align-items: center; gap: 15px; border-bottom: 1px solid rgba(188, 200, 218, 0.16); color: var(--silver); text-decoration: none; transition: color 160ms ease, padding 160ms ease; } .channel-link:hover { padding-left: 7px; color: white; } .channel-number { color: var(--muted-dark); font: 400 0.52rem/1 var(--mono); } .channel-link > :global(svg) { color: var(--cyan); } .channel-link div { display: flex; min-width: 0; flex-direction: column; gap: 5px; } .channel-list strong { font: 700 0.78rem/1 var(--mono); letter-spacing: 0.08em; text-transform: uppercase; } .channel-link div span { overflow: hidden; color: var(--muted); font-size: 0.78rem; text-overflow: ellipsis; white-space: nowrap; } .channel-link > b { color: var(--muted-dark); font: 400 1rem/1 var(--mono); } .channel-note { margin: 26px 0; color: var(--muted-dark); font: 400 0.52rem/1.7 var(--mono); letter-spacing: 0.08em; }
  @media (max-width: 900px) { .contact-hero { min-height: 460px; } .contact-interface { grid-template-columns: 1fr; } .contact-channels { max-width: 650px; } } @media (max-width: 520px) { .contact-hero { min-height: 500px; } .contact-hero h1 { font-size: clamp(4.25rem, 20vw, 6rem); } .contact-axis { right: -40%; width: 100%; } }
</style>
