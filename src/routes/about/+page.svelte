<script lang="ts">
  import MechanicalButton from '$lib/components/MechanicalButton.svelte';
  import SectionHeader from '$lib/components/SectionHeader.svelte';
  import { skillGroups } from '$lib/data/projects';

  const sections = [
    { number: '01', title: 'Introduction', copy: 'I am Zain Ahmed, a UI/UX designer and web developer interested in the space where design and engineering overlap.' },
    { number: '02', title: 'What I do', copy: 'I like working across the full life of a digital product. That can mean designing the interface, thinking through how someone moves through it, building the frontend, connecting data and backend services, testing the result, and eventually putting it online.' },
    { number: '03', title: 'Design', copy: 'My approach to UI/UX is based on making interfaces understandable without stripping away personality. I care about hierarchy, interaction, typography, responsiveness, and giving a product a visual identity that actually belongs to it.' },
    { number: '04', title: 'Development', copy: 'Development lets me take those ideas beyond a prototype. I work across frontend and full stack development and enjoy understanding the systems behind the interface rather than treating design and engineering as completely separate jobs.' },
    { number: '05', title: 'Experiments', copy: 'I also use projects as an excuse to explore areas outside normal web development, including computer vision, WebGL, Rust, AI, audio software, simulations, and other Computer Science experiments.' },
    { number: '06', title: 'Current focus', copy: 'Right now I am focused on building stronger products, improving the way I communicate design decisions, and creating software where the interface and engineering feel like parts of the same idea.' }
  ];
</script>

<svelte:head>
  <title>About - Zain Ahmed</title>
  <meta name="description" content="About Zain Ahmed, a UI/UX designer and web developer." />
</svelte:head>

<div class="page-shell about-page">
  <header class="about-hero">
    <div class="about-hero__copy">
      <p class="eyebrow">Profile / dual practice / 02</p>
      <h1 class="display-title chrome-text">Design <span>+</span><br />development</h1>
      <p class="body-copy">I am Zain Ahmed, a UI/UX designer and web developer interested in the space where design and engineering overlap.</p>
    </div>
    <div class="about-emblem" aria-hidden="true"><span class="emblem-label label-a">DESIGN</span><span class="emblem-label label-b">DEVELOPMENT</span><div class="emblem-disc"><span>ZA</span><i></i></div><div class="emblem-orbit"></div><div class="emblem-axis"></div></div>
  </header>

  <section class="profile-sections" aria-labelledby="profile-title">
    <div id="profile-title"><SectionHeader number="02.A" title="Profile" kicker="Methods / interests / focus" /></div>
    <div class="profile-layout">
      <nav class="chapter-index" aria-label="About page sections">
        {#each sections as section}<a href={`#${section.title.toLowerCase().replaceAll(' ', '-')}`}><span>{section.number}</span>{section.title}</a>{/each}
      </nav>
      <div class="profile-copy">
        {#each sections as section}<article id={section.title.toLowerCase().replaceAll(' ', '-')}><span class="profile-number">{section.number}</span><div><h2>{section.title}</h2><p>{section.copy}</p></div></article>{/each}
      </div>
    </div>
  </section>

  <section class="about-skills" aria-labelledby="toolkit-title">
    <div id="toolkit-title"><SectionHeader number="02.B" title="Toolkit" kicker="Organized by practice" /></div>
    <div class="toolkit-rack metal-panel">
      {#each skillGroups as group}<div class="toolkit-bank"><div><span>{group.number}</span><h3>{group.title}</h3></div><ul>{#each group.skills as skill}<li>{skill}</li>{/each}</ul></div>{/each}
    </div>
  </section>

  <section class="about-next"><div><p class="eyebrow">Next channel</p><h2>See the work in motion.</h2></div><MechanicalButton href="/work" label="View project archive" /></section>
</div>

<style>
  .about-hero { position: relative; display: grid; min-height: 630px; grid-template-columns: minmax(0, 1.2fr) minmax(380px, 0.8fr); align-items: center; gap: 30px; padding-bottom: clamp(70px, 10vw, 140px); }
  .about-hero h1 { margin: 21px 0 30px; max-width: 10ch; } .about-hero h1 span { color: var(--cyan); }
  .about-emblem { position: relative; width: min(100%, 500px); aspect-ratio: 1; justify-self: end; } .emblem-disc { position: absolute; z-index: 2; top: 50%; left: 50%; display: grid; width: 44%; aspect-ratio: 1; place-items: center; transform: translate(-50%, -50%) rotate(45deg); border: 2px solid rgba(240, 244, 249, 0.7); color: #0a0d14; background: linear-gradient(145deg, #eef1f5, #737e8d 39%, #f5f6f8 50%, #535e6d 75%, #c2cad4); box-shadow: 12px 12px 0 rgba(33, 42, 57, 0.8), inset 0 1px white; } .emblem-disc span { transform: rotate(-45deg); font: 700 clamp(3rem, 7vw, 7rem)/1 var(--display); letter-spacing: -0.07em; } .emblem-disc i { position: absolute; width: 1px; height: 140%; transform: rotate(-18deg); background: rgba(255, 255, 255, 0.72); } .emblem-orbit { position: absolute; inset: 10%; transform: rotate(-22deg); border: 1px solid rgba(99, 216, 255, 0.34); border-radius: 50%; box-shadow: 0 0 0 36px rgba(83, 106, 210, 0.025), 0 0 0 72px rgba(83, 106, 210, 0.018); } .emblem-orbit::before, .emblem-orbit::after { position: absolute; width: 9px; height: 9px; content: ''; background: var(--cyan); box-shadow: 0 0 12px var(--cyan); } .emblem-orbit::before { top: 15%; left: 17%; } .emblem-orbit::after { right: 12%; bottom: 20%; background: var(--violet); box-shadow: 0 0 12px var(--violet); } .emblem-axis { position: absolute; top: 52%; left: 0; width: 100%; height: 1px; transform: rotate(23deg); background: linear-gradient(90deg, transparent, var(--cobalt), transparent); } .emblem-label { position: absolute; z-index: 3; padding: 8px 10px; border: 1px solid rgba(186, 199, 219, 0.3); color: var(--muted); background: rgba(7, 10, 17, 0.78); font: 700 0.53rem/1 var(--mono); letter-spacing: 0.08em; } .label-a { top: 9%; right: 4%; } .label-b { bottom: 8%; left: 2%; }
  .profile-layout { display: grid; grid-template-columns: 210px minmax(0, 1fr); gap: clamp(35px, 7vw, 110px); margin-top: clamp(45px, 7vw, 82px); } .chapter-index { position: sticky; top: 130px; display: flex; height: max-content; flex-direction: column; border-top: 1px solid rgba(187, 199, 217, 0.27); } .chapter-index a { display: flex; min-height: 42px; align-items: center; gap: 14px; border-bottom: 1px solid rgba(187, 199, 217, 0.13); color: var(--muted); font: 700 0.6rem/1 var(--mono); letter-spacing: 0.05em; text-decoration: none; text-transform: uppercase; } .chapter-index a:hover { color: var(--cyan); } .chapter-index a span { color: var(--muted-dark); } .profile-copy article { display: grid; grid-template-columns: 58px 1fr; gap: 20px; padding: 0 0 clamp(60px, 8vw, 105px); scroll-margin-top: 130px; } .profile-number { color: var(--cyan); font: 700 0.68rem/1 var(--mono); } .profile-copy h2 { margin: 0 0 20px; font: 700 clamp(2.8rem, 5vw, 5.2rem)/0.78 var(--display); letter-spacing: -0.045em; text-transform: uppercase; } .profile-copy p { max-width: 67ch; margin: 0 0 15px; color: var(--muted); font-size: 1.03rem; line-height: 1.72; }
  .about-skills { margin-top: 30px; } .toolkit-rack { display: grid; grid-template-columns: repeat(5, 1fr); margin-top: clamp(42px, 6vw, 72px); padding: 0; overflow: hidden; } .toolkit-rack::after { display: none; } .toolkit-bank { position: relative; z-index: 1; padding: clamp(20px, 3vw, 30px); border-right: 1px solid rgba(188, 200, 217, 0.17); } .toolkit-bank:last-child { border-right: 0; } .toolkit-bank > div { display: flex; align-items: end; gap: 12px; padding-bottom: 14px; border-bottom: 1px solid rgba(188, 200, 217, 0.2); } .toolkit-bank > div span { color: var(--cyan); font: 700 0.62rem/1 var(--mono); } .toolkit-bank h3 { margin: 0; font: 700 clamp(1.4rem, 2.4vw, 2.7rem)/0.8 var(--display); text-transform: uppercase; } .toolkit-bank ul { margin: 18px 0 0; padding: 0; list-style: none; } .toolkit-bank li { padding: 8px 0; border-bottom: 1px solid rgba(188, 200, 217, 0.09); color: var(--muted); font-size: 0.82rem; }
  .about-next { display: flex; align-items: end; justify-content: space-between; gap: 30px; margin-top: clamp(100px, 14vw, 190px); padding: clamp(38px, 5vw, 60px); border-block: 1px solid rgba(187, 199, 217, 0.24); background: linear-gradient(90deg, rgba(80, 107, 229, 0.11), rgba(151, 100, 218, 0.06)); } .about-next h2 { margin: 15px 0 0; font: 700 clamp(3rem, 6vw, 6.4rem)/0.78 var(--display); letter-spacing: -0.05em; text-transform: uppercase; }
  @media (max-width: 1000px) { .toolkit-rack { grid-template-columns: repeat(3, 1fr); } .toolkit-bank:nth-child(3) { border-right: 0; } } @media (max-width: 900px) { .about-hero { grid-template-columns: 1fr; min-height: 0; } .about-emblem { position: absolute; z-index: -1; right: -15%; bottom: 4%; width: min(70vw, 470px); opacity: 0.46; } .profile-layout { grid-template-columns: 1fr; } .chapter-index { position: static; flex-direction: row; overflow-x: auto; } .chapter-index a { min-width: max-content; padding-right: 24px; } } @media (max-width: 600px) { .about-hero { min-height: 600px; align-items: start; } .about-hero h1 { font-size: clamp(3.7rem, 18vw, 5.5rem); } .about-emblem { right: -28%; bottom: 2%; width: 90vw; } .profile-copy article { grid-template-columns: 1fr; gap: 13px; } .toolkit-rack { grid-template-columns: 1fr; } .toolkit-bank { border-right: 0; border-bottom: 1px solid rgba(188, 200, 217, 0.17); } .about-next { align-items: flex-start; flex-direction: column; padding-inline: 20px; } }
</style>
