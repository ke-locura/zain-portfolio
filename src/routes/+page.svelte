<script lang="ts">
  import { ArrowRight, Braces, PenTool } from 'lucide-svelte';
  import Hero from '$lib/components/Hero.svelte';
  import MechanicalButton from '$lib/components/MechanicalButton.svelte';
  import MetalPanel from '$lib/components/MetalPanel.svelte';
  import ProjectGrid from '$lib/components/ProjectGrid.svelte';
  import SectionHeader from '$lib/components/SectionHeader.svelte';
  import WebProject from '$lib/components/WebProject.svelte';
  import { projects, skillGroups } from '$lib/data/projects';
</script>

<svelte:head>
  <title>Zain Ahmed - UI/UX Designer</title>
  <meta name="description" content="The portfolio of Zain Ahmed, a UI/UX designer and web developer working across interface design, frontend applications, and full stack products." />
</svelte:head>

<Hero />

<section id="work" class="selected-work content-shell" aria-labelledby="selected-work-heading">
  <div class="heading-anchor" id="selected-work-heading">
    <SectionHeader number="01" title="Selected work" kicker="Portfolio / featured" />
  </div>
  <p class="section-intro body-copy">A selection of products I have designed, developed, or shaped across UI/UX, web development, full stack engineering, and interactive software.</p>
  <ProjectGrid projects={projects.filter((project) => project.featured)} />
  <div class="section-action"><MechanicalButton href="/work" label="Open project archive" variant="dark" /></div>
</section>

<section class="dual-practice" aria-labelledby="dual-practice-heading">
  <div class="dual-practice__rail chrome-rail">
    <div class="content-shell dual-practice__rail-inner">
      <span>ONE PRACTICE</span><span>DESIGN / DEVELOPMENT</span><span>END TO END</span>
    </div>
  </div>
  <div class="content-shell dual-practice__body">
    <div class="practice-side practice-side--design">
      <div class="practice-icon"><PenTool size={28} strokeWidth={1.3} aria-hidden="true" /></div>
      <p class="eyebrow">I design the system</p>
      <h2 id="dual-practice-heading">Interfaces with<br />a point of view.</h2>
      <p>I work between design and development. I enjoy taking an idea from the interface and interaction design through to a working product.</p>
      <ul><li>User flows</li><li>Wireframes</li><li>Visual systems</li><li>Interaction design</li></ul>
    </div>
    <div class="practice-coupler" aria-hidden="true"><span>×</span><i></i><b></b><i></i><span>+</span></div>
    <div class="practice-side practice-side--development">
      <div class="practice-icon"><Braces size={29} strokeWidth={1.3} aria-hidden="true" /></div>
      <p class="eyebrow">Then I ship it</p>
      <h2>Built for the<br />actual web.</h2>
      <p>That can mean building the frontend, connecting the backend, designing the data model, or figuring out how the whole experience should fit together.</p>
      <ul><li>Responsive UI</li><li>Frontend apps</li><li>APIs</li><li>Full stack systems</li></ul>
    </div>
  </div>
</section>

<section class="capabilities content-shell" aria-labelledby="capabilities-heading">
  <div id="capabilities-heading"><SectionHeader number="02" title="Capabilities" kicker="Design leads / code delivers" /></div>
  <p class="section-intro body-copy">My work sits across the boundary between visual design and software engineering, so my toolkit covers both the interface people interact with and the systems underneath it.</p>
  <div class="skill-console">
    {#each skillGroups as group, index}
      <MetalPanel className={`skill-panel ${index < 2 ? 'skill-panel--primary' : ''}`} label={`BANK ${group.number}`}>
        <div class="skill-panel__title"><span>{group.number}</span><h3>{group.title}</h3></div>
        <ul>{#each group.skills as skill, skillIndex}<li><span>{String(skillIndex + 1).padStart(2, '0')}</span><b>{skill}</b></li>{/each}</ul>
      </MetalPanel>
    {/each}
  </div>
</section>

<section class="web-directory content-shell" aria-labelledby="web-heading">
  <div id="web-heading"><SectionHeader number="03" title="My web" kicker="Sites / platforms / applications" /></div>
  <div class="directory-intro">
    <p class="body-copy">My projects do not all live inside this portfolio. This section acts as a directory for the websites and applications I build and deploy across the web.</p>
    <MechanicalButton href="/web" label="Open directory" variant="dark" />
  </div>
  <div class="directory-list metal-panel">{#each projects.slice(0, 3) as project}<WebProject {project} />{/each}</div>
</section>

<section class="portal-strip" aria-label="Explore more">
  <div class="content-shell portal-strip__grid">
    <a href="/lab" class="portal portal--lab">
      <div><span class="micro-label">04 / Experimental lab</span><h2>Enter the lab</h2><p>Computer vision, graphics, systems programming, AI, audio, and technical prototypes.</p><span class="portal-cta">OPEN LAB <ArrowRight size={15} strokeWidth={1.5} aria-hidden="true" /></span></div>
      <div class="portal-signal" aria-hidden="true"><i></i><i></i><i></i><i></i><i></i></div>
    </a>
    <a href="/about" class="portal portal--about">
      <div><span class="micro-label">05 / Profile</span><h2>Design + development</h2><p>I am Zain Ahmed, a UI/UX designer and web developer interested in the space where design and engineering overlap.</p><span class="portal-cta">VIEW PROFILE <ArrowRight size={15} strokeWidth={1.5} aria-hidden="true" /></span></div>
      <span class="portal-mark chrome-text" aria-hidden="true">ZA</span>
    </a>
  </div>
</section>

<section class="contact-callout content-shell" aria-labelledby="contact-callout-title">
  <span class="contact-callout__index">06 / NEW CONNECTION</span>
  <div><p class="eyebrow">Have a project in mind?</p><h2 id="contact-callout-title" class="chrome-text">LET'S MAKE<br />SOMETHING.</h2></div>
  <div class="contact-callout__action"><p>Have a project, role, idea, or something interesting to build? Get in touch.</p><MechanicalButton href="/contact" label="Start a conversation" /></div>
</section>

<style>
  .selected-work, .capabilities, .web-directory { padding-top: clamp(90px, 12vw, 180px); }
  .heading-anchor { scroll-margin-top: 120px; }
  .section-intro { max-width: 760px; margin: 28px 0 0; }
  .section-action { display: flex; justify-content: flex-end; margin-top: 20px; }
  .dual-practice { margin-top: clamp(90px, 10vw, 160px); border-bottom: 1px solid rgba(186, 197, 214, 0.2); background: linear-gradient(90deg, rgba(87, 113, 255, 0.07), transparent 38%, rgba(152, 108, 228, 0.07)), #090b12; }
  .dual-practice__rail-inner { display: grid; grid-template-columns: 1fr auto 1fr; min-height: 34px; align-items: center; gap: 20px; font: 700 0.57rem/1 var(--mono); letter-spacing: 0.08em; }
  .dual-practice__rail-inner span:nth-child(2) { text-align: center; } .dual-practice__rail-inner span:last-child { text-align: right; }
  .dual-practice__body { display: grid; grid-template-columns: 1fr 68px 1fr; align-items: stretch; }
  .practice-side { position: relative; padding: clamp(54px, 8vw, 105px) clamp(0px, 3vw, 42px); }
  .practice-side--design { padding-left: 0; border-right: 1px solid rgba(188, 199, 215, 0.16); } .practice-side--development { padding-right: 0; border-left: 1px solid rgba(188, 199, 215, 0.16); }
  .practice-icon { display: grid; width: 48px; height: 48px; place-items: center; margin-bottom: 30px; border: 1px solid rgba(201, 210, 224, 0.36); color: var(--cyan); background: linear-gradient(145deg, #262e3c, #0a0d14); box-shadow: 0 3px 0 #030409, inset 0 1px rgba(255, 255, 255, 0.12); }
  .practice-side--development .practice-icon { color: var(--violet); }
  .practice-side h2 { margin: 18px 0 24px; font: 700 clamp(3.2rem, 5.6vw, 6rem)/0.8 var(--display); letter-spacing: -0.05em; text-transform: uppercase; }
  .practice-side > p:not(.eyebrow) { max-width: 50ch; color: var(--muted); line-height: 1.65; }
  .practice-side ul { display: grid; grid-template-columns: repeat(2, 1fr); max-width: 500px; margin: 32px 0 0; padding: 0; border-top: 1px solid rgba(188, 199, 215, 0.22); list-style: none; }
  .practice-side li { position: relative; padding: 12px 10px 12px 18px; border-bottom: 1px solid rgba(188, 199, 215, 0.14); color: var(--silver); font: 700 0.62rem/1.3 var(--mono); letter-spacing: 0.05em; text-transform: uppercase; }
  .practice-side li::before { position: absolute; top: 16px; left: 2px; width: 5px; height: 5px; content: ''; background: var(--cyan); } .practice-side--development li::before { background: var(--violet); }
  .practice-coupler { display: flex; align-items: center; justify-content: center; flex-direction: column; gap: 10px; color: var(--muted); font: 700 0.7rem/1 var(--mono); }
  .practice-coupler i { width: 1px; height: 45px; background: rgba(186, 198, 216, 0.34); } .practice-coupler b { width: 11px; height: 11px; transform: rotate(45deg); border: 1px solid var(--cyan); background: #111723; box-shadow: 0 0 12px rgba(99, 216, 255, 0.25); }
  .skill-console { display: grid; grid-template-columns: repeat(6, 1fr); gap: 9px; margin-top: clamp(42px, 6vw, 74px); }
  :global(.skill-panel) .skill-panel__title { display: flex; align-items: end; gap: 18px; padding-bottom: 18px; border-bottom: 1px solid rgba(189, 200, 216, 0.25); }
  :global(.skill-panel) .skill-panel__title > span { color: var(--cyan); font: 700 0.7rem/1 var(--mono); } :global(.skill-panel) .skill-panel__title h3 { margin: 0; font: 700 clamp(2.4rem, 4vw, 4rem)/0.76 var(--display); letter-spacing: -0.04em; text-transform: uppercase; }
  :global(.skill-panel) ul { display: grid; grid-template-columns: repeat(2, 1fr); margin: 18px 0 0; padding: 0; list-style: none; } :global(.skill-panel) li { display: flex; min-height: 39px; align-items: center; gap: 12px; padding: 6px 8px; border-bottom: 1px solid rgba(190, 202, 219, 0.12); color: var(--silver); font-size: 0.86rem; } :global(.skill-panel) li span { color: var(--muted-dark); font: 400 0.52rem/1 var(--mono); } :global(.skill-panel) li b { font-weight: 400; }
  :global(.skill-panel--primary) { grid-column: span 3; } :global(.skill-panel:not(.skill-panel--primary)) { grid-column: span 2; }
  .directory-intro { display: flex; align-items: center; justify-content: space-between; gap: 28px; padding-block: 34px; } .directory-intro p { margin: 0; } .directory-list { padding: 0; overflow: hidden; } .directory-list::after { display: none; }
  .portal-strip { margin-top: clamp(90px, 12vw, 180px); border-block: 1px solid rgba(187, 199, 216, 0.2); background: #090c14; } .portal-strip__grid { display: grid; grid-template-columns: 1fr 1fr; }
  .portal { position: relative; display: block; min-height: 340px; overflow: hidden; padding: clamp(30px, 5vw, 60px); color: var(--paper); text-decoration: none; } .portal:first-child { border-right: 1px solid rgba(190, 201, 218, 0.2); } .portal::after { position: absolute; right: 0; bottom: 0; left: 0; height: 3px; content: ''; transform: scaleX(0); transform-origin: left; background: linear-gradient(90deg, var(--cobalt), var(--cyan)); transition: transform 220ms ease; } .portal:hover::after { transform: scaleX(1); }
  .portal h2 { margin: 13px 0 16px; font: 700 clamp(3rem, 5vw, 5.6rem)/0.78 var(--display); letter-spacing: -0.05em; text-transform: uppercase; } .portal p { max-width: 40ch; margin: 0; color: var(--muted); line-height: 1.55; } .portal--lab { background: radial-gradient(circle at 80% 20%, rgba(83, 117, 255, 0.16), transparent 32%); } .portal--about { background: radial-gradient(circle at 75% 32%, rgba(171, 105, 232, 0.13), transparent 35%); }
  .portal-cta { display: inline-flex; align-items: center; gap: 8px; margin-top: 28px; color: var(--silver); font: 700 0.59rem/1 var(--mono); letter-spacing: 0.1em; } .portal-signal { position: absolute; top: 25%; right: 8%; display: flex; height: 44px; align-items: center; gap: 5px; opacity: 0.28; } .portal-signal i { display: block; width: 3px; height: 30%; background: var(--cyan); } .portal-signal i:nth-child(2) { height: 70%; } .portal-signal i:nth-child(3) { height: 100%; } .portal-signal i:nth-child(4) { height: 55%; } .portal-signal i:nth-child(5) { height: 82%; } .portal-mark { position: absolute; top: 16%; right: 9%; opacity: 0.12; font: 700 clamp(6rem, 12vw, 11rem)/1 var(--display); transform: rotate(-8deg); }
  .contact-callout { display: grid; grid-template-columns: 100px minmax(0, 1.4fr) minmax(280px, 0.65fr); align-items: end; gap: clamp(25px, 5vw, 80px); padding-block: clamp(105px, 14vw, 210px); } .contact-callout__index { align-self: start; color: var(--muted); font: 700 0.57rem/1.4 var(--mono); letter-spacing: 0.08em; writing-mode: vertical-rl; } .contact-callout h2 { margin: 21px 0 0; font: 700 clamp(4.3rem, 9vw, 9.5rem)/0.69 var(--display); letter-spacing: -0.065em; } .contact-callout__action { padding-bottom: 6px; } .contact-callout__action p { margin: 0 0 27px; color: var(--muted); line-height: 1.65; }
  @media (max-width: 900px) { .dual-practice__body { grid-template-columns: 1fr; } .practice-side--design { border-right: 0; border-bottom: 1px solid rgba(188, 199, 215, 0.16); } .practice-side--development { border-left: 0; } .practice-coupler { display: none; } .skill-console { grid-template-columns: repeat(2, 1fr); } :global(.skill-panel--primary), :global(.skill-panel:not(.skill-panel--primary)) { grid-column: span 1; } .portal-strip__grid { grid-template-columns: 1fr; } .portal:first-child { border-right: 0; border-bottom: 1px solid rgba(190, 201, 218, 0.2); } .contact-callout { grid-template-columns: 1fr; align-items: start; } .contact-callout__index { writing-mode: initial; } .contact-callout__action { max-width: 540px; } }
  @media (max-width: 620px) { .dual-practice__rail-inner { grid-template-columns: 1fr auto; } .dual-practice__rail-inner span:last-child { display: none; } .practice-side ul, :global(.skill-panel) ul { grid-template-columns: 1fr; } .directory-intro { align-items: flex-start; flex-direction: column; } .portal { min-height: 280px; padding-inline: 22px; } .portal h2 { font-size: clamp(2.7rem, 15vw, 4rem); } .contact-callout { padding-block: 100px; } .contact-callout h2 { font-size: clamp(4rem, 20vw, 6.6rem); } .skill-console { grid-template-columns: 1fr; } :global(.skill-panel--primary), :global(.skill-panel:not(.skill-panel--primary)) { grid-column: 1; } }
</style>
