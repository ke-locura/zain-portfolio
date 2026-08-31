<script lang="ts">
  import { FileText, Github, Linkedin, Mail } from 'lucide-svelte';

  const socialLinks = [
    { label: 'Email', href: 'mailto:zainahmed23professional@gmail.com', icon: Mail },
    { label: 'GitHub', href: 'https://github.com/ke-locura', icon: Github },
    { label: 'LinkedIn', href: 'https://www.linkedin.com/in/zain-ahmed-982aa434?utm_source=share_via&utm_content=profile&utm_medium=member_android', icon: Linkedin },
    { label: 'Resume', href: '/resume', icon: FileText }
  ];
  const siteLinks = [
    { label: 'Work', href: '/work' },
    { label: 'About', href: '/about' },
    { label: 'Web', href: '/web' },
    { label: 'Lab', href: '/lab' },
    { label: 'Contact', href: '/contact' }
  ];
</script>

<footer class="site-footer">
  <div class="footer-rail chrome-rail"><div class="content-shell footer-rail__inner"><span>PORTFOLIO SIGNAL / LIVE</span><span>BEST VIEWED WITH CURIOSITY / INTENT</span><span>© 2026 Zain Ahmed</span></div></div>
  <div class="content-shell footer-main">
    <div class="footer-identity"><p class="micro-label">UI/UX DESIGNER / WEB DEVELOPER</p><p class="footer-name chrome-text">ZAIN AHMED</p></div>
    <nav class="footer-site-links" aria-label="Site navigation"><p class="micro-label">SITE INDEX</p>{#each siteLinks as link}<a href={link.href}>{link.label}</a>{/each}</nav>
    <nav class="footer-links" aria-label="Contact links">
      {#each socialLinks as link}<a class="footer-link" href={link.href} target={link.label === 'Email' || link.label === 'Resume' ? undefined : '_blank'} rel={link.label === 'Email' || link.label === 'Resume' ? undefined : 'noopener noreferrer'}><svelte:component this={link.icon} size={17} strokeWidth={1.6} aria-hidden="true" /><span>{link.label}</span></a>{/each}
    </nav>
  </div>
</footer>

<style>
  .footer-site-links a { display: flex; min-height: 28px; align-items: center; }
  .site-footer { position: relative; border-top: 1px solid rgba(195, 204, 218, 0.2); background: linear-gradient(120deg, rgba(71, 91, 201, 0.08), transparent 34%, rgba(133, 79, 183, 0.07)), #070911; } .footer-rail__inner { display: grid; grid-template-columns: 1fr auto 1fr; min-height: 34px; align-items: center; gap: 20px; font: 700 0.56rem/1 var(--mono); letter-spacing: 0.08em; } .footer-rail__inner span:nth-child(2) { text-align: center; } .footer-rail__inner span:last-child { text-align: right; }
  .footer-main { display: grid; grid-template-columns: 1fr auto auto; align-items: end; gap: clamp(30px, 5vw, 75px); padding-block: clamp(48px, 7vw, 90px); } .footer-identity .micro-label { margin-bottom: 11px; } .footer-name { margin: 0; font: 700 clamp(3.7rem, 8vw, 8.8rem)/0.72 var(--display); letter-spacing: -0.06em; } .footer-site-links { display: grid; grid-template-columns: repeat(2, minmax(70px, 1fr)); gap: 8px 18px; min-width: 160px; } .footer-site-links .micro-label { grid-column: 1 / -1; margin-bottom: 2px; } .footer-site-links a { color: var(--muted); font: 700 0.61rem/1 var(--mono); letter-spacing: 0.07em; text-decoration: none; text-transform: uppercase; } .footer-site-links a:hover { color: var(--cyan); }
  .footer-links { display: grid; grid-template-columns: repeat(2, minmax(120px, 1fr)); gap: 4px; } .footer-link { display: flex; min-height: 44px; align-items: center; gap: 10px; padding-inline: 14px; border: 1px solid rgba(179, 190, 207, 0.24); border-radius: 2px; color: var(--silver); background: linear-gradient(180deg, rgba(49, 57, 70, 0.82), rgba(10, 13, 20, 0.95)); box-shadow: inset 0 1px rgba(255, 255, 255, 0.08); font: 700 0.61rem/1 var(--mono); letter-spacing: 0.07em; text-decoration: none; text-transform: uppercase; } .footer-links a:hover { color: white; border-color: rgba(99, 216, 255, 0.55); }
  @media (max-width: 1000px) { .footer-main { grid-template-columns: 1fr auto; } .footer-site-links { grid-column: 1; grid-row: 2; } .footer-links { grid-column: 2; grid-row: 2; } } @media (max-width: 800px) { .footer-rail__inner { grid-template-columns: 1fr auto; } .footer-rail__inner span:nth-child(2) { display: none; } .footer-main { grid-template-columns: 1fr; align-items: start; gap: 34px; } .footer-name { font-size: clamp(3.4rem, 18vw, 6rem); } .footer-site-links, .footer-links { grid-column: auto; grid-row: auto; width: 100%; } } @media (max-width: 430px) { .footer-links { grid-template-columns: 1fr; } }
</style>
