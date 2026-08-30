<script lang="ts">
  import { ChevronDown, Crosshair } from 'lucide-svelte';
  import MechanicalButton from './MechanicalButton.svelte';
</script>

<section class="hero" aria-labelledby="hero-title">
  <div class="hero-stage content-shell">
    <div class="hero-grid" aria-hidden="true"></div>
    <div class="axis axis-one" aria-hidden="true"></div>
    <div class="axis axis-two" aria-hidden="true"></div>

    <div class="hero-copy">
      <div class="hero-index">
        <span>SELECT PROFILE / 01</span>
        <span>DESIGN / DEVELOPMENT</span>
      </div>

      <h1 id="hero-title" aria-label="Zain Ahmed">
        <span class="chrome-text">ZAIN</span>
        <span class="chrome-text">AHMED</span>
      </h1>

      <div class="role-plaque">
        <Crosshair size={15} strokeWidth={1.5} aria-hidden="true" />
        <strong>UI/UX DESIGNER</strong>
        <span>/</span>
        <strong>WEB DEVELOPER</strong>
      </div>

      <p class="hero-description">
        I design and build digital products, combining thoughtful interfaces with the engineering needed to make them work.
      </p>

      <div class="hero-actions">
        <MechanicalButton href="/work" label="View work" />
        <MechanicalButton href="/web" label="Explore web" variant="dark" />
        <MechanicalButton href="/contact" label="Contact" variant="dark" />
      </div>
    </div>

    <div class="hero-machine">
      <div class="machine-readout readout-top"><span>INTERFACE</span><b>01.26</b></div>
      <div class="portrait-frame">
        <div class="portrait-grid" aria-hidden="true"></div>
        <div class="portrait-crosshair portrait-crosshair--one" aria-hidden="true"></div>
        <div class="portrait-crosshair portrait-crosshair--two" aria-hidden="true"></div>
        <span class="portrait-label portrait-label--top">PRIMARY VISUAL / 01</span>
        <img src="/zain.png" alt="Zain Ahmed" />
      </div>
      <div class="machine-readout readout-bottom"><span>OUTPUT</span><b>DESIGN / CODE</b></div>
    </div>

    <a class="hero-scroll" href="#work">
      <span>SCROLL / SELECTED WORK</span>
      <ChevronDown size={16} strokeWidth={1.6} aria-hidden="true" />
    </a>
  </div>

  <div class="discipline-rail chrome-rail">
    <div class="content-shell discipline-rail__inner" aria-label="Core disciplines">
      <span>INTERFACE DESIGN</span><i></i><span>USER FLOWS</span><i></i><span>PROTOTYPING</span><i></i
      ><span>RESPONSIVE WEB</span><i></i><span>FULL STACK BUILD</span>
    </div>
  </div>
</section>

<style>
  .hero { position: relative; overflow: hidden; border-bottom: 1px solid rgba(232, 236, 243, 0.22); }
  .hero-stage { position: relative; display: grid; min-height: min(780px, calc(100svh - 98px)); grid-template-columns: minmax(0, 1.05fr) minmax(400px, 0.9fr); align-items: center; gap: 20px; padding-block: clamp(48px, 6vw, 88px) 78px; }
  .hero-stage::before, .hero-stage::after { position: absolute; width: 8px; height: 8px; content: ''; border-top: 1px solid rgba(218, 224, 234, 0.55); border-left: 1px solid rgba(218, 224, 234, 0.55); }
  .hero-stage::before { top: 22px; left: 0; }
  .hero-stage::after { right: 0; bottom: 24px; transform: rotate(180deg); }
  .hero-grid { position: absolute; z-index: -1; right: -8%; bottom: 1%; width: 76%; height: 76%; transform: perspective(540px) rotateX(63deg) rotateZ(-3deg); transform-origin: center bottom; opacity: 0.28; background-image: linear-gradient(rgba(114, 137, 191, 0.45) 1px, transparent 1px), linear-gradient(90deg, rgba(114, 137, 191, 0.45) 1px, transparent 1px); background-size: 42px 42px; mask-image: linear-gradient(to top, black, transparent 90%); }
  .axis { position: absolute; z-index: -1; height: 1px; transform-origin: left; }
  .axis::after { position: absolute; top: -2px; right: 22%; width: 5px; height: 5px; content: ''; background: currentColor; box-shadow: 0 0 12px currentColor; }
  .axis-one { right: 3%; bottom: 35%; width: 50%; transform: rotate(-19deg); color: var(--cobalt); background: linear-gradient(90deg, transparent, var(--cobalt), transparent); box-shadow: 0 0 9px rgba(89, 118, 255, 0.55); }
  .axis-two { right: 2%; bottom: 24%; width: 42%; transform: rotate(13deg); color: var(--violet); background: linear-gradient(90deg, transparent, var(--violet), transparent); box-shadow: 0 0 9px rgba(154, 125, 255, 0.5); }
  .hero-copy { position: relative; z-index: 4; padding-left: clamp(0px, 2vw, 24px); }
  .hero-index { display: flex; max-width: 670px; justify-content: space-between; margin-bottom: clamp(22px, 4vw, 42px); padding-bottom: 10px; border-bottom: 1px solid rgba(184, 198, 218, 0.34); color: var(--muted); font: 700 0.57rem/1 var(--mono); letter-spacing: 0.11em; }
  h1 { position: relative; width: max-content; max-width: 100%; margin: 0; font: 700 clamp(6rem, 12.2vw, 12.6rem)/0.64 var(--display); letter-spacing: -0.075em; text-transform: uppercase; }
  h1 span { position: relative; display: block; width: max-content; padding-right: 0.08em; }
  h1 span:last-child { margin-left: 0.27em; }
  .role-plaque { display: inline-flex; min-height: 38px; align-items: center; gap: 11px; margin-top: clamp(26px, 4vw, 46px); padding: 0 14px; border: 1px solid rgba(218, 224, 234, 0.62); border-radius: 2px; color: #12151c; background: linear-gradient(180deg, #e6eaf0, #8993a0 46%, #d2d7df 52%, #717b89); box-shadow: 0 3px 0 #020308, inset 0 1px white; font: 700 clamp(0.63rem, 0.85vw, 0.78rem)/1 var(--mono); letter-spacing: 0.08em; }
  .role-plaque span { color: #5e6979; }
  .hero-description { max-width: 600px; margin: clamp(24px, 3vw, 36px) 0 0; color: var(--muted); font-size: clamp(0.92rem, 1.1vw, 1.04rem); line-height: 1.65; }
  .hero-actions { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 28px; }
  .hero-machine { position: relative; z-index: 2; width: min(100%, 540px); aspect-ratio: 1; justify-self: end; }
  .portrait-frame { position: absolute; inset: 7%; display: grid; place-items: center; overflow: hidden; border: 1px solid rgba(160, 183, 220, 0.5); background: radial-gradient(circle at 50% 42%, rgba(88, 118, 225, 0.15), transparent 58%), linear-gradient(145deg, rgba(35, 47, 76, 0.62), rgba(5, 8, 17, 0.94)); box-shadow: 0 0 70px rgba(74, 92, 190, 0.14), inset 0 0 40px rgba(103, 216, 255, 0.07), 10px 10px 0 rgba(10, 13, 24, 0.62); }
  .portrait-frame::before, .portrait-frame::after { position: absolute; z-index: 2; width: 20px; height: 20px; content: ''; border-color: rgba(222, 230, 245, 0.72); }
  .portrait-frame::before { top: 18px; left: 18px; border-top: 1px solid; border-left: 1px solid; }
  .portrait-frame::after { right: 18px; bottom: 18px; border-right: 1px solid; border-bottom: 1px solid; }
  .portrait-grid { position: absolute; inset: 0; opacity: 0.28; background-image: linear-gradient(rgba(114, 137, 191, 0.35) 1px, transparent 1px), linear-gradient(90deg, rgba(114, 137, 191, 0.35) 1px, transparent 1px); background-size: 28px 28px; mask-image: radial-gradient(circle, black 25%, transparent 77%); }
  .portrait-frame img { position: relative; z-index: 1; width: 92%; height: 92%; object-fit: contain; object-position: center; filter: drop-shadow(0 20px 18px rgba(0, 0, 0, 0.42)); }
  .portrait-label { position: absolute; z-index: 3; padding: 7px 9px; border: 1px solid rgba(188, 202, 226, 0.32); color: var(--muted); background: rgba(7, 10, 18, 0.78); font: 700 0.51rem/1 var(--mono); letter-spacing: 0.08em; }
  .portrait-label--top { top: 20px; right: 22px; }
  .portrait-crosshair { position: absolute; z-index: 2; background: linear-gradient(90deg, transparent, rgba(99, 216, 255, 0.55), transparent); }
  .portrait-crosshair--one { top: 50%; left: 0; width: 100%; height: 1px; }
  .portrait-crosshair--two { top: 0; left: 50%; width: 1px; height: 100%; background: linear-gradient(transparent, rgba(154, 125, 255, 0.5), transparent); }
  .machine-readout { position: absolute; z-index: 5; display: flex; min-width: 130px; justify-content: space-between; gap: 18px; padding: 8px 10px; border: 1px solid rgba(185, 198, 218, 0.28); color: var(--muted-dark); background: rgba(8, 11, 18, 0.74); font: 700 0.5rem/1 var(--mono); letter-spacing: 0.08em; backdrop-filter: blur(5px); }
  .machine-readout b { color: var(--cyan); font-weight: 700; }
  .readout-top { top: 6%; right: 0; }
  .readout-bottom { bottom: 7%; left: 0; }
  .hero-scroll { position: absolute; z-index: 6; bottom: 25px; left: clamp(0px, 2vw, 24px); display: flex; align-items: center; gap: 12px; color: var(--muted); font: 700 0.55rem/1 var(--mono); letter-spacing: 0.1em; text-decoration: none; }
  .hero-scroll:hover { color: var(--cyan); }
  .discipline-rail__inner { display: flex; min-height: 36px; align-items: center; justify-content: space-between; gap: 15px; font: 700 0.57rem/1 var(--mono); letter-spacing: 0.07em; white-space: nowrap; }
  .discipline-rail i { width: 4px; height: 4px; transform: rotate(45deg); background: #303744; }
  @media (max-width: 1060px) {
    .hero-stage { min-height: 760px; grid-template-columns: minmax(0, 1fr) minmax(300px, 0.7fr); }
    h1 { font-size: clamp(6rem, 14vw, 10rem); }
    .hero-machine { width: min(45vw, 460px); margin-left: -10%; }
    .discipline-rail__inner span:nth-of-type(4), .discipline-rail__inner i:nth-of-type(4) { display: none; }
  }
  @media (max-width: 760px) {
    .hero-stage { display: block; min-height: 710px; padding-top: 46px; }
    .hero-copy { padding: 0; }
    .hero-index { margin-bottom: 30px; }
    h1 { font-size: clamp(5.1rem, 24vw, 8.5rem); line-height: 0.62; }
    .hero-description { max-width: 490px; }
    .hero-machine { position: absolute; z-index: 1; right: -22%; bottom: -3%; width: min(77vw, 500px); opacity: 0.72; }
    .hero-copy { z-index: 4; }
    .hero-scroll { bottom: 19px; }
    .discipline-rail__inner { justify-content: flex-start; overflow: hidden; }
    .discipline-rail__inner span:nth-of-type(n + 4), .discipline-rail__inner i:nth-of-type(n + 3) { display: none; }
  }
  @media (max-width: 440px) {
    .hero-stage { min-height: 720px; }
    .hero-index span:last-child { display: none; }
    .role-plaque { display: grid; width: max-content; grid-template-columns: auto 1fr; gap: 5px 9px; padding-block: 9px; }
    .role-plaque span { display: none; }
    .hero-actions { display: grid; grid-template-columns: 1fr 1fr; }
    .hero-actions :global(.mechanical-button:first-child) { grid-column: 1 / -1; }
    .hero-machine { right: -29%; bottom: 1%; width: 92vw; }
  }
</style>
