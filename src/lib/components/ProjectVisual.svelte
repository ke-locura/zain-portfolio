<script lang="ts">
  import type { Project } from '$lib/types';

  let {
    project,
    compact = false,
    decorative = false
  }: { project: Project; compact?: boolean; decorative?: boolean } = $props();
</script>

<div
  class:compact
  class="preview-frame {project.preview}"
  style={`--project-accent: ${project.accent}`}
  role={decorative ? undefined : 'img'}
  aria-label={decorative ? undefined : `${project.name} interface concept preview`}
  aria-hidden={decorative ? 'true' : undefined}
>
  <div class="preview-frame__rim">
    <div class="preview-toolbar">
      <div class="preview-toolbar__brand">
        <span class="signal-square" aria-hidden="true"></span>
        <span>{project.name}</span>
      </div>
      <div class="preview-toolbar__meta">
        <span>UI MODE</span>
        <span>{project.number} / {project.year}</span>
      </div>
    </div>

    <div class="preview-screen">
      {#if project.preview === 'cadence'}
        <div class="cadence-ui">
          <aside class="cadence-sidebar">
            <div class="mini-logo">C</div>
            <span class="side-line active"></span>
            <span class="side-line"></span>
            <span class="side-line short"></span>
            <div class="side-spacer"></div>
            <span class="side-dot"></span>
            <span class="side-dot"></span>
          </aside>
          <div class="cadence-workspace">
            <div class="workspace-tabs">
              <span>SCREENPLAY_04</span>
              <span>DRAFT / EDIT</span>
            </div>
            <div class="script-sheet">
              <span class="script-label">42.</span>
              <div class="script-copy">
                <span class="script-heading"></span>
                <span></span><span></span><span class="short"></span>
                <span class="dialogue"></span><span class="dialogue short"></span>
                <span></span><span></span>
              </div>
              <div class="annotation">NOTE<br />03:18</div>
            </div>
            <div class="cadence-timeline">
              <span style="--w: 18%"></span>
              <span style="--w: 30%"></span>
              <span style="--w: 12%"></span>
              <span style="--w: 25%"></span>
            </div>
          </div>
        </div>
      {:else if project.preview === 'galactico'}
        <div class="galactico-ui">
          <div class="formation-panel">
            <div class="field-markings">
              {#each ['09', '11', '07', '10', '08', '06', '03', '04', '05', '02', '01'] as player}
                <span class="player"><b>{player}</b></span>
              {/each}
            </div>
            <div class="formation-caption"><span>4 / 3 / 3</span><span>FORMATION A</span></div>
          </div>
          <aside class="squad-panel">
            <div class="squad-title"><span>SQUAD</span><strong>XI</strong></div>
            {#each [93, 84, 88, 79, 91] as rating, i}
              <div class="squad-row">
                <span>{String(i + 1).padStart(2, '0')}</span>
                <span class="squad-name"></span>
                <b>{rating}</b>
              </div>
            {/each}
            <div class="squad-data">
              <span>POSSESSION</span><strong>58</strong><small>%</small>
            </div>
          </aside>
        </div>
      {:else if project.preview === 'frontoffice'}
        <div class="frontoffice-ui">
          <div class="score-strip">
            <span>FRONT OFFICE / SEASON</span>
            <div><b>24</b><em>/</em><b>18</b></div>
            <span>SIMULATION LIVE</span>
          </div>
          <div class="frontoffice-body">
            <div class="performance-panel">
              <div class="panel-label"><span>TEAM VALUE</span><span>WEEK 16</span></div>
              <div class="bar-chart" aria-hidden="true">
                {#each [36, 52, 44, 68, 58, 76, 64, 88, 80, 94] as height}
                  <span style={`--bar-height:${height}%`}></span>
                {/each}
              </div>
              <div class="chart-axis"><span>01</span><span>05</span><span>10</span></div>
            </div>
            <div class="roster-panel">
              <div class="panel-label"><span>ROSTER</span><span>OVR</span></div>
              {#each ['GUARD', 'WING', 'CENTER', 'FORWARD'] as position, i}
                <div class="roster-row">
                  <b>{String(i + 1).padStart(2, '0')}</b>
                  <span>{position}</span>
                  <i style={`--meter:${82 - i * 9}%`}></i>
                  <em>{91 - i * 4}</em>
                </div>
              {/each}
            </div>
          </div>
        </div>
      {:else}
        <div class="registry-ui">
          <div class="registry-map">
            <div class="map-grid"></div>
            <span class="map-node n1">A1</span>
            <span class="map-node n2">B4</span>
            <span class="map-node n3">C2</span>
            <span class="map-node n4">D7</span>
            <div class="map-crosshair"><span></span></div>
            <p>REGISTRY AREA / 04</p>
          </div>
          <div class="registry-records">
            <div class="record-head"><span>RECORDS</span><b>0218</b></div>
            <div class="record-card selected">
              <span class="record-avatar">VR</span>
              <div><b>ENTRY_001</b><span>VERIFIED / ACTIVE</span></div>
            </div>
            <div class="record-card">
              <span class="record-avatar">VR</span>
              <div><b>ENTRY_002</b><span>PENDING / REVIEW</span></div>
            </div>
            <div class="record-card">
              <span class="record-avatar">VR</span>
              <div><b>ENTRY_003</b><span>ARCHIVE / 2026</span></div>
            </div>
          </div>
        </div>
      {/if}
    </div>

    <div class="preview-deck">
      <span>DESIGN SYSTEM / RESPONSIVE UI</span>
      <div class="deck-track"><i></i></div>
      <span>{project.category}</span>
    </div>
  </div>
  <span class="frame-screw top-left" aria-hidden="true"></span>
  <span class="frame-screw top-right" aria-hidden="true"></span>
  <span class="frame-screw bottom-left" aria-hidden="true"></span>
  <span class="frame-screw bottom-right" aria-hidden="true"></span>
</div>

<style>
  .preview-frame {
    position: relative;
    width: 100%;
    aspect-ratio: 16 / 10;
    padding: clamp(7px, 1.2vw, 13px);
    overflow: hidden;
    border: 1px solid rgba(242, 245, 250, 0.66);
    border-radius: 5px;
    background:
      repeating-linear-gradient(90deg, transparent 0 2px, rgba(255, 255, 255, 0.045) 2px 3px),
      linear-gradient(145deg, #dfe3e9, #626c7a 16%, #f4f6f9 24%, #343b47 51%, #9ca5b2 82%, #e5e9ee);
    box-shadow:
      0 24px 55px rgba(0, 0, 0, 0.46),
      inset 0 1px white,
      inset 0 -2px rgba(0, 0, 0, 0.72);
  }

  .preview-frame::before {
    position: absolute;
    z-index: 3;
    top: -35%;
    bottom: -35%;
    left: -45%;
    width: 30%;
    pointer-events: none;
    content: '';
    transform: skewX(-18deg);
    opacity: 0;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.18), transparent);
    transition:
      left 500ms cubic-bezier(0.22, 0.8, 0.22, 1),
      opacity 180ms ease;
  }

  .preview-frame:hover::before {
    left: 115%;
    opacity: 0.85;
  }

  .preview-frame__rim {
    display: grid;
    height: 100%;
    grid-template-rows: auto 1fr auto;
    overflow: hidden;
    border: 2px solid #070910;
    border-radius: 3px;
    background: #0a0d14;
    box-shadow:
      inset 0 0 0 1px rgba(238, 242, 248, 0.13),
      0 1px 0 rgba(255, 255, 255, 0.32);
  }

  .preview-toolbar,
  .preview-deck {
    position: relative;
    z-index: 2;
    display: flex;
    min-height: clamp(30px, 4vw, 42px);
    align-items: center;
    justify-content: space-between;
    gap: 14px;
    padding-inline: clamp(11px, 1.8vw, 20px);
    border-bottom: 1px solid rgba(205, 214, 227, 0.3);
    color: var(--silver);
    background: linear-gradient(180deg, #303846, #10141e 46%, #242b37 52%, #090d14);
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.12);
    font: 700 clamp(0.42rem, 0.6vw, 0.58rem)/1 var(--mono);
    letter-spacing: 0.1em;
    text-transform: uppercase;
  }

  .preview-toolbar__brand,
  .preview-toolbar__meta {
    display: flex;
    align-items: center;
    gap: 10px;
  }

  .preview-toolbar__meta {
    color: var(--muted-dark);
  }

  .preview-toolbar__meta span + span::before {
    margin-right: 10px;
    content: '/';
  }

  .signal-square {
    width: 6px;
    height: 6px;
    background: var(--project-accent);
    box-shadow: 0 0 8px var(--project-accent);
  }

  .preview-screen {
    position: relative;
    min-height: 0;
    overflow: hidden;
    background: #090c14;
  }

  .preview-screen::after {
    position: absolute;
    z-index: 10;
    inset: 0;
    pointer-events: none;
    content: '';
    opacity: 0.09;
    background: repeating-linear-gradient(0deg, transparent 0 3px, rgba(255, 255, 255, 0.18) 4px);
  }

  .preview-deck {
    min-height: clamp(28px, 3.5vw, 38px);
    border-top: 1px solid rgba(205, 214, 227, 0.25);
    border-bottom: 0;
    color: var(--muted-dark);
  }

  .preview-deck > span:last-child {
    max-width: 40%;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .deck-track {
    position: relative;
    flex: 1;
    max-width: 110px;
    height: 3px;
    overflow: hidden;
    background: #05070b;
    box-shadow: inset 0 1px 2px black;
  }

  .deck-track i {
    position: absolute;
    left: 0;
    width: 43%;
    height: 100%;
    background: linear-gradient(90deg, var(--project-accent), var(--cyan));
    animation: deck-scan 3.8s ease-in-out infinite alternate;
  }

  @keyframes deck-scan {
    from { transform: translateX(0); }
    to { transform: translateX(130%); }
  }

  .frame-screw {
    position: absolute;
    z-index: 5;
    width: 4px;
    height: 4px;
    border-radius: 50%;
    background: #252a32;
    box-shadow: inset 1px 1px rgba(255, 255, 255, 0.55);
  }

  .top-left { top: 4px; left: 4px; }
  .top-right { top: 4px; right: 4px; }
  .bottom-left { bottom: 4px; left: 4px; }
  .bottom-right { right: 4px; bottom: 4px; }

  /* Cadence */
  .cadence-ui {
    display: grid;
    height: 100%;
    grid-template-columns: 13% 1fr;
    color: #dfe3ea;
    background:
      radial-gradient(circle at 76% 22%, rgba(157, 124, 255, 0.14), transparent 34%),
      #0b0b15;
  }

  .cadence-sidebar {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 9%;
    padding: 10% 14%;
    border-right: 1px solid rgba(157, 124, 255, 0.2);
    background: linear-gradient(180deg, rgba(49, 35, 76, 0.88), rgba(14, 12, 24, 0.94));
  }

  .mini-logo {
    display: grid;
    width: clamp(18px, 2.6vw, 34px);
    aspect-ratio: 1;
    place-items: center;
    margin-bottom: 7%;
    border: 1px solid var(--project-accent);
    font: 700 clamp(0.55rem, 1vw, 0.9rem)/1 var(--display);
  }

  .side-line {
    width: 68%;
    height: 3px;
    background: #5d5b69;
  }

  .side-line.active {
    width: 88%;
    background: var(--project-accent);
    box-shadow: 0 0 8px rgba(157, 124, 255, 0.6);
  }

  .side-line.short { width: 48%; }
  .side-spacer { flex: 1; }
  .side-dot { width: 6px; height: 6px; border: 1px solid #686373; border-radius: 50%; }

  .cadence-workspace {
    display: grid;
    min-width: 0;
    grid-template-rows: auto 1fr auto;
    padding: 3% 4% 2.5%;
  }

  .workspace-tabs,
  .panel-label {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding-bottom: 2.5%;
    color: #767180;
    font: 700 clamp(0.38rem, 0.58vw, 0.58rem)/1 var(--mono);
    letter-spacing: 0.08em;
  }

  .workspace-tabs span:first-child { color: var(--project-accent); }

  .script-sheet {
    position: relative;
    display: grid;
    width: 82%;
    height: 90%;
    grid-template-columns: 9% 1fr;
    justify-self: center;
    padding: 5% 6%;
    color: #1b1a23;
    background:
      linear-gradient(90deg, transparent 0 7%, rgba(91, 79, 130, 0.1) 7% 7.3%, transparent 7.3%),
      #e9e7ed;
    box-shadow: 9px 9px 0 rgba(111, 74, 194, 0.15), 0 12px 32px rgba(0, 0, 0, 0.35);
  }

  .script-label { font: 700 clamp(0.4rem, 0.7vw, 0.68rem)/1 var(--mono); }
  .script-copy { display: flex; flex-direction: column; gap: 7%; padding-left: 7%; }
  .script-copy span { display: block; width: 92%; height: 3px; background: #77737d; }
  .script-copy span.short { width: 54%; }
  .script-copy .script-heading { width: 43%; height: 5px; margin-bottom: 4%; background: #1f1d27; }
  .script-copy span.dialogue { width: 56%; margin-left: 18%; background: #9e99a4; }

  .annotation {
    position: absolute;
    top: 18%;
    right: -6%;
    padding: 5px;
    border: 1px solid var(--project-accent);
    color: #eae5f3;
    background: #211830;
    font: 700 clamp(0.32rem, 0.48vw, 0.48rem)/1.4 var(--mono);
  }

  .cadence-timeline {
    display: flex;
    height: 8px;
    gap: 3px;
    margin-top: 2%;
    background: #05060a;
  }

  .cadence-timeline span { width: var(--w); background: linear-gradient(90deg, #554173, var(--project-accent)); }

  /* Galactico */
  .galactico-ui {
    display: grid;
    height: 100%;
    grid-template-columns: 1.55fr 0.72fr;
    gap: 2.5%;
    padding: 3%;
    background:
      linear-gradient(135deg, rgba(38, 90, 142, 0.16), transparent 45%),
      #060d19;
  }

  .formation-panel,
  .squad-panel {
    position: relative;
    min-width: 0;
    overflow: hidden;
    border: 1px solid rgba(91, 213, 255, 0.28);
    background: linear-gradient(145deg, rgba(22, 55, 88, 0.76), rgba(7, 16, 31, 0.94));
    box-shadow: inset 0 1px rgba(255, 255, 255, 0.08);
  }

  .formation-panel { display: grid; grid-template-rows: 1fr auto; padding: 5%; }

  .field-markings {
    position: relative;
    border: 1px solid rgba(117, 207, 255, 0.36);
    background:
      linear-gradient(90deg, transparent 49.8%, rgba(117, 207, 255, 0.23) 50%, transparent 50.2%),
      linear-gradient(180deg, rgba(18, 69, 105, 0.3), rgba(7, 26, 47, 0.18));
  }

  .field-markings::before {
    position: absolute;
    top: 50%;
    left: 50%;
    width: 20%;
    aspect-ratio: 1;
    content: '';
    transform: translate(-50%, -50%);
    border: 1px solid rgba(117, 207, 255, 0.3);
    border-radius: 50%;
  }

  .player {
    position: absolute;
    display: grid;
    width: clamp(13px, 2vw, 25px);
    aspect-ratio: 1;
    place-items: center;
    transform: translate(-50%, -50%);
    border: 1px solid var(--project-accent);
    border-radius: 50%;
    color: #e8f8ff;
    background: #102940;
    box-shadow: 0 0 10px rgba(91, 213, 255, 0.26);
    font: 700 clamp(0.3rem, 0.48vw, 0.48rem)/1 var(--mono);
  }

  .player:nth-child(1) { left: 50%; top: 12%; }
  .player:nth-child(2) { left: 27%; top: 26%; }
  .player:nth-child(3) { left: 73%; top: 26%; }
  .player:nth-child(4) { left: 50%; top: 38%; }
  .player:nth-child(5) { left: 30%; top: 50%; }
  .player:nth-child(6) { left: 70%; top: 50%; }
  .player:nth-child(7) { left: 16%; top: 69%; }
  .player:nth-child(8) { left: 38%; top: 72%; }
  .player:nth-child(9) { left: 62%; top: 72%; }
  .player:nth-child(10) { left: 84%; top: 69%; }
  .player:nth-child(11) { left: 50%; top: 90%; }

  .formation-caption {
    display: flex;
    justify-content: space-between;
    padding-top: 4%;
    color: #8ca6bb;
    font: 700 clamp(0.34rem, 0.55vw, 0.55rem)/1 var(--mono);
  }

  .formation-caption span:first-child { color: var(--project-accent); }

  .squad-panel { display: flex; flex-direction: column; padding: 7%; }
  .squad-title { display: flex; align-items: end; justify-content: space-between; margin-bottom: 8%; color: #8ca6bb; font: 700 clamp(0.4rem, 0.6vw, 0.58rem)/1 var(--mono); }
  .squad-title strong { color: var(--project-accent); font: 700 clamp(1rem, 2.7vw, 2.7rem)/0.8 var(--display); }
  .squad-row { display: grid; grid-template-columns: auto 1fr auto; align-items: center; gap: 8%; padding: 5% 0; border-bottom: 1px solid rgba(105, 182, 224, 0.13); color: #71899c; font: 700 clamp(0.32rem, 0.5vw, 0.5rem)/1 var(--mono); }
  .squad-name { height: 3px; background: linear-gradient(90deg, #7694a9 60%, transparent 60%); }
  .squad-row b { color: #dbeaf4; }
  .squad-data { display: flex; align-items: end; margin-top: auto; color: #71899c; font: 700 clamp(0.33rem, 0.5vw, 0.5rem)/1 var(--mono); }
  .squad-data strong { margin-left: auto; color: var(--project-accent); font: 700 clamp(1.15rem, 2.6vw, 2.8rem)/0.8 var(--display); }
  .squad-data small { color: var(--project-accent); }

  /* Front Office */
  .frontoffice-ui { display: grid; height: 100%; grid-template-rows: auto 1fr; color: #dce0e5; background: linear-gradient(145deg, rgba(117, 70, 25, 0.16), transparent 40%), #0c0e13; }
  .score-strip { display: grid; grid-template-columns: 1fr auto 1fr; align-items: center; gap: 4%; padding: 2.5% 4%; border-bottom: 1px solid rgba(241, 184, 91, 0.27); background: rgba(33, 30, 28, 0.72); color: #80796e; font: 700 clamp(0.36rem, 0.55vw, 0.55rem)/1 var(--mono); letter-spacing: 0.08em; }
  .score-strip > span:last-child { text-align: right; }
  .score-strip div { display: flex; align-items: center; gap: clamp(7px, 1.4vw, 18px); }
  .score-strip b { color: var(--project-accent); font: 700 clamp(1rem, 2.2vw, 2.2rem)/0.8 var(--display); }
  .score-strip em { color: #5c5852; font-style: normal; }
  .frontoffice-body { display: grid; grid-template-columns: 1.2fr 1fr; gap: 2.4%; padding: 3%; min-height: 0; }
  .performance-panel, .roster-panel { min-width: 0; padding: 5%; border: 1px solid rgba(220, 188, 137, 0.18); background: linear-gradient(150deg, rgba(48, 42, 35, 0.7), rgba(11, 12, 16, 0.96)); }
  .panel-label span:first-child { color: var(--project-accent); }
  .bar-chart { display: flex; height: 75%; align-items: end; gap: 4%; padding: 8% 4% 0; border-bottom: 1px solid rgba(217, 203, 179, 0.25); background: repeating-linear-gradient(0deg, transparent 0 24%, rgba(169, 159, 142, 0.1) 25%); }
  .bar-chart span { flex: 1; height: var(--bar-height); background: linear-gradient(180deg, var(--project-accent), #49371f); box-shadow: inset 1px 0 rgba(255, 255, 255, 0.14); }
  .chart-axis { display: flex; justify-content: space-between; padding-top: 2.5%; color: #68645e; font: 700 clamp(0.3rem, 0.46vw, 0.46rem)/1 var(--mono); }
  .roster-panel { display: flex; flex-direction: column; }
  .roster-row { display: grid; grid-template-columns: auto minmax(0, 1fr) minmax(25px, 0.8fr) auto; align-items: center; gap: 6%; flex: 1; border-bottom: 1px solid rgba(202, 188, 166, 0.1); color: #777168; font: 700 clamp(0.3rem, 0.48vw, 0.48rem)/1 var(--mono); }
  .roster-row b { color: var(--project-accent); }
  .roster-row i { position: relative; height: 3px; overflow: hidden; background: #292722; }
  .roster-row i::before { position: absolute; width: var(--meter); height: 100%; content: ''; background: var(--project-accent); }
  .roster-row em { color: #dcd5ca; font-style: normal; }

  /* Registry */
  .registry-ui { display: grid; height: 100%; grid-template-columns: 1.15fr 0.85fr; gap: 2.5%; padding: 3%; color: #e2eaf4; background: linear-gradient(135deg, rgba(72, 120, 184, 0.18), transparent 42%), #09101a; }
  .registry-map, .registry-records { position: relative; min-width: 0; overflow: hidden; border: 1px solid rgba(131, 183, 255, 0.24); background: rgba(10, 24, 39, 0.82); }
  .map-grid { position: absolute; inset: 0; opacity: 0.36; background-image: linear-gradient(rgba(131, 183, 255, 0.22) 1px, transparent 1px), linear-gradient(90deg, rgba(131, 183, 255, 0.22) 1px, transparent 1px); background-size: 12% 14%; transform: perspective(300px) rotateX(5deg); }
  .registry-map::before { position: absolute; width: 65%; height: 100%; content: ''; transform: translate(18%, 6%) rotate(-13deg); border: 1px solid rgba(131, 183, 255, 0.34); border-radius: 46% 36% 54% 32%; box-shadow: inset 0 0 35px rgba(65, 113, 174, 0.1); }
  .map-node { position: absolute; z-index: 2; display: grid; width: clamp(18px, 2.5vw, 30px); aspect-ratio: 1; place-items: center; border: 1px solid var(--project-accent); color: var(--project-accent); background: #0a1624; box-shadow: 0 0 10px rgba(131, 183, 255, 0.22); font: 700 clamp(0.32rem, 0.48vw, 0.48rem)/1 var(--mono); }
  .n1 { left: 25%; top: 24%; } .n2 { right: 22%; top: 31%; } .n3 { left: 37%; bottom: 20%; } .n4 { right: 12%; bottom: 15%; }
  .map-crosshair { position: absolute; top: 52%; left: 54%; width: 24%; aspect-ratio: 1; transform: translate(-50%, -50%); border: 1px solid rgba(131, 183, 255, 0.3); border-radius: 50%; }
  .map-crosshair::before, .map-crosshair::after { position: absolute; top: 50%; left: 50%; content: ''; background: rgba(131, 183, 255, 0.33); }
  .map-crosshair::before { width: 145%; height: 1px; transform: translate(-50%, -50%); }
  .map-crosshair::after { width: 1px; height: 145%; transform: translate(-50%, -50%); }
  .map-crosshair span { position: absolute; inset: 37%; background: var(--project-accent); box-shadow: 0 0 10px var(--project-accent); }
  .registry-map p { position: absolute; bottom: 4%; left: 5%; margin: 0; color: #7890a9; font: 700 clamp(0.33rem, 0.5vw, 0.5rem)/1 var(--mono); letter-spacing: 0.08em; }
  .registry-records { display: flex; flex-direction: column; gap: 3%; padding: 6%; }
  .record-head { display: flex; align-items: end; justify-content: space-between; padding-bottom: 3%; color: #7d91a9; font: 700 clamp(0.35rem, 0.54vw, 0.54rem)/1 var(--mono); }
  .record-head b { color: var(--project-accent); font: 700 clamp(1.1rem, 2.2vw, 2.2rem)/0.8 var(--display); }
  .record-card { display: grid; grid-template-columns: auto 1fr; align-items: center; gap: 7%; flex: 1; padding: 3% 5%; border: 1px solid rgba(131, 183, 255, 0.12); background: #0b1420; }
  .record-card.selected { border-color: rgba(131, 183, 255, 0.46); background: linear-gradient(90deg, rgba(55, 100, 158, 0.34), #0b1420); }
  .record-avatar { display: grid; width: clamp(20px, 3vw, 36px); aspect-ratio: 1; place-items: center; border: 1px solid #607995; color: var(--project-accent); font: 700 clamp(0.35rem, 0.52vw, 0.52rem)/1 var(--mono); }
  .record-card div { display: flex; min-width: 0; flex-direction: column; gap: 5px; }
  .record-card b { color: #d8e2ee; font: 700 clamp(0.34rem, 0.5vw, 0.5rem)/1 var(--mono); }
  .record-card div span { color: #687d94; font: 400 clamp(0.28rem, 0.42vw, 0.42rem)/1 var(--mono); }

  .compact {
    aspect-ratio: 4 / 3;
  }

  @media (max-width: 600px) {
    .preview-frame {
      aspect-ratio: 4 / 3;
    }

    .preview-toolbar__meta span:first-child,
    .preview-deck > span:last-child {
      display: none;
    }

    .preview-deck {
      justify-content: flex-start;
    }

    .deck-track {
      margin-left: auto;
    }

    .cadence-ui { grid-template-columns: 16% 1fr; }
    .script-sheet { width: 88%; }
    .galactico-ui { grid-template-columns: 1.45fr 0.65fr; gap: 2%; padding: 2.5%; }
    .squad-panel { padding: 8% 6%; }
    .squad-row { gap: 5%; }
    .frontoffice-body { gap: 2%; padding: 2.5%; }
    .registry-ui { gap: 2%; padding: 2.5%; }
  }

  @media (hover: none) {
    .preview-frame::before { display: none; }
  }
</style>
