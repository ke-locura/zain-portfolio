import type { LabExperiment, Project, SkillGroup } from '$lib/types';

export const projectDescription =
  'A focused product direction shaped through interface design, development, and the systems needed to make the experience work.';

const cadenceCase = {
  overview:
    'Cadence explores how screenwriting software can feel less like technical formatting software and more like a focused writing environment. The project combines interface design, document editing, screenplay structure, local persistence, and full stack application development.',
  context:
    'The product brings writing, screenplay structure, and project organization into one calm workspace for writers working across languages and formats.',
  problem:
    'Screenwriting tools often expose too much complexity to the writer. Cadence focuses on reducing that friction while still supporting the structure and formatting required by screenplay writing.',
  uxThinking:
    'The interface is designed around keeping the writer focused on the document. Formatting behavior, scene organization, character workflows, and navigation should feel predictable without constantly demanding attention.',
  userFlow:
    'A writer opens a project, orients around the current scene, edits the document, checks structure, and returns to the story without losing context.',
  wireframes:
    'Early structure keeps the document central, with navigation and project tools available without competing with the writing surface.',
  visualDesign:
    'The visual system uses quiet surfaces, clear hierarchy, and compact controls so the writing space stays legible while the product still feels distinct.',
  interactionDesign:
    'Focused states, predictable formatting behavior, and lightweight scene navigation keep frequent actions close to the document.',
  development:
    'The project combines a modern web interface with structured document editing, persistent project data, testing, and application architecture designed for increasingly complex writing workflows.',
  technicalArchitecture:
    'The architecture separates the editor experience, structured screenplay data, persistence, and application services so each layer can evolve without making the writing surface harder to use.',
  challenges:
    'The main challenge is balancing screenplay rules and multilingual workflows with an interface that remains calm and direct.',
  result:
    'Cadence is a focused product direction for writing, formatting, and organizing screenplays in one connected workspace.',
  whatILearned:
    'Complex tools become easier to approach when the interface protects the primary task and makes advanced structure available at the right moment.',
  futureImprovements:
    'Future work can deepen collaboration, expand formatting coverage, and make long-form project navigation even more flexible.'
};

const galacticoCase = {
  overview:
    'Galactico11 is an exploration of football tactics, squad construction, player profiles, and match decision making through an interactive web application.',
  context:
    'The product treats football knowledge as a connected system of roles, relationships, strengths, weaknesses, and match situations.',
  problem:
    'Many football games reduce players and tactical decisions to a small collection of ratings. Galactico11 is designed around the idea that football decisions should make sense because of roles, tactical relationships, strengths, weaknesses, and match situations.',
  uxThinking:
    'The interface needs to communicate complicated football information without making the user feel like they are operating a spreadsheet. Tactical choices should remain understandable and connected to what happens on the pitch.',
  userFlow:
    'A manager reviews the squad, compares roles, shapes a plan, makes a match decision, and reads the result through the relationships on the pitch.',
  wireframes:
    'The structure gives squad information, tactical controls, and match context clear zones so decisions can be scanned before they are made.',
  visualDesign:
    'The visual language combines information-dense panels with a pitch-inspired spatial layer, keeping data readable without flattening the character of the product.',
  interactionDesign:
    'Selection, comparison, and tactical changes are designed as connected actions so the user can understand why a choice matters before committing to it.',
  development:
    'The project combines frontend interaction, structured football data, application state, backend services, and a match system designed around football phases and tactical reasoning.',
  technicalArchitecture:
    'The application separates football data, squad state, tactical decisions, and match resolution so the rules can grow without making the interface opaque.',
  challenges:
    'The challenge is presenting a large tactical model in a way that still feels like football rather than a spreadsheet of isolated numbers.',
  result:
    'Galactico11 is a product direction for exploring football decisions through roles, relationships, and match context.',
  whatILearned:
    'Domain-heavy interfaces work best when each data point is connected to a decision the user can understand.',
  futureImprovements:
    'Future work can expand match situations, squad planning depth, and the ways users compare tactical alternatives.'
};

const frontOfficeCase = {
  overview:
    'The Front Office is a basketball management application focused on the decisions made away from the court. It explores roster construction, trades, contracts, team building, and long term decision making.',
  context:
    'The product frames a basketball team as a set of connected roster, contract, draft, and planning decisions.',
  problem:
    'Front office simulations need to surface a large amount of team information while keeping the next decision understandable.',
  uxThinking:
    'Management applications contain a huge amount of information. The interface focuses on making that information easier to scan, compare, and act on without losing the depth expected from a serious simulation.',
  userFlow:
    'A manager reviews the roster, inspects a constraint, compares options, commits to a move, and returns to the wider team plan.',
  wireframes:
    'The information architecture gives roster, contracts, draft choices, and transactions distinct places while preserving a consistent decision pattern.',
  visualDesign:
    'A compact desktop workspace supports dense information with clear groupings, restrained color, and strong numeric hierarchy.',
  interactionDesign:
    'Comparison states and transaction feedback help users understand the consequences of a move before they continue.',
  development:
    'The project combines a desktop focused interface with application logic, persistent data, and systems designed around basketball front office decisions.',
  challenges:
    'The key challenge is keeping depth available while reducing the effort required to scan a team and choose the next action.',
  result:
    'The Front Office is a basketball management direction centered on roster construction, trades, contracts, and long term team building.',
  whatILearned:
    'Information density is useful when hierarchy and comparison are treated as part of the product, not as decoration.',
  futureImprovements:
    'Future work can extend the simulation model, improve planning views, and make more decision paths visible in the same workspace.'
};

const registryCase = {
  overview:
    'Village Registry is a structured records application designed to make large amounts of household and community information easier to enter, search, update, and manage.',
  context:
    'The application brings household, resident, property, utility, and community records into one searchable workflow.',
  problem:
    'Administrative data can quickly become difficult to work with when information is spread across forms, documents, and disconnected records.',
  uxThinking:
    'The interface focuses on reducing the friction of data entry while keeping individual records understandable and searchable.',
  userFlow:
    'An operator searches for a record, checks the current details, updates the relevant fields, and returns to the record list with confidence.',
  wireframes:
    'The structure keeps search and record context visible while separating data entry from supporting details and actions.',
  visualDesign:
    'The interface uses a clear data hierarchy, restrained surfaces, and visible record states to support careful administrative work.',
  interactionDesign:
    'Search, create, edit, and review actions follow a consistent pattern so records remain easy to understand as they change.',
  development:
    'The application combines a responsive frontend, structured database models, authentication, search, CRUD workflows, and persistent records.',
  technicalArchitecture:
    'The system is organized around authenticated access, relational records, searchable queries, and predictable create, update, and review flows.',
  challenges:
    'The challenge is making repetitive data work feel clear and reliable without hiding important record context.',
  result:
    'Village Registry is a full stack records direction for entering, searching, and maintaining community information.',
  whatILearned:
    'Administrative products benefit from the same care in hierarchy and interaction that consumer products receive.',
  futureImprovements:
    'Future work can refine permissions, reporting, import workflows, and the way related records are explored.'
};

export const projects: Project[] = [
  {
    name: 'Cadence', slug: 'cadence', number: '01',
    description: 'A screenwriting platform focused on making screenplay writing, formatting, organization, and multilingual workflows feel simpler and more natural.',
    category: 'PRODUCT DESIGN / FULL STACK', web_label: 'Screenwriting Platform', role: 'UI/UX / FRONTEND / FULL STACK',
    disciplines: ['UI/UX', 'WEB', 'FULL STACK'], technologies: ['SvelteKit', 'TypeScript', 'Supabase'],
    live_url: 'https://example.com/cadence', github_url: '', prototype_url: '', status: 'ONLINE',
    domain: 'cadence.example.com', last_deployment: 'PLACEHOLDER', deployment_history: ['PLACEHOLDER'], uptime: 'STATIC STATUS', health_check: 'NOT CONNECTED',
    featured: true, image: 'cadence-interface-preview', preview: 'cadence', accent: '#9d7cff', year: '2026', caseStudy: cadenceCase
  },
  {
    name: 'Galactico11', slug: 'galactico11', number: '02',
    description: 'A football management and tactical decision making platform built around football knowledge rather than turning players into simple visible ratings.',
    category: 'WEB APPLICATION / FOOTBALL', web_label: 'Football Platform', role: 'PRODUCT / UI/UX / FULL STACK',
    disciplines: ['UI/UX', 'WEB', 'FULL STACK'], technologies: ['Svelte', 'TypeScript', 'REST API'],
    live_url: 'https://example.com/galactico11', github_url: '', prototype_url: '', status: 'ONLINE',
    domain: 'galactico11.example.com', last_deployment: 'PLACEHOLDER', deployment_history: ['PLACEHOLDER'], uptime: 'STATIC STATUS', health_check: 'NOT CONNECTED',
    featured: true, image: 'galactico11-interface-preview', preview: 'galactico', accent: '#5bd5ff', year: '2026', caseStudy: galacticoCase
  },
  {
    name: 'The Front Office', slug: 'the-front-office', number: '03',
    description: 'A basketball front office simulation exploring roster construction, trades, contracts, draft decisions, and the systems behind running an NBA team.',
    category: 'DESKTOP APPLICATION / SPORTS', web_label: 'Basketball GM Simulation', role: 'UI/UX / SOFTWARE DEVELOPMENT',
    disciplines: ['UI/UX', 'FULL STACK', 'EXPERIMENTAL'], technologies: ['SvelteKit', 'PostgreSQL', 'APIs'],
    live_url: 'https://example.com/the-front-office', github_url: '', prototype_url: '', status: 'DEVELOPMENT',
    domain: 'front-office.example.com', last_deployment: 'PLACEHOLDER', deployment_history: ['PLACEHOLDER'], uptime: 'STATIC STATUS', health_check: 'NOT CONNECTED',
    featured: true, image: 'front-office-interface-preview', preview: 'frontoffice', accent: '#f1b85b', year: '2026', caseStudy: frontOfficeCase
  },
  {
    name: 'Village Registry', slug: 'village-registry', number: '04',
    description: 'A full stack records application for organizing household, resident, property, utility, and community information through a searchable interface.',
    category: 'FULL STACK / DATA MANAGEMENT', web_label: 'Data Management', role: 'UI/UX / FULL STACK',
    disciplines: ['UI/UX', 'WEB', 'FULL STACK'], technologies: ['React', 'TypeScript', 'Database'],
    live_url: 'https://example.com/village-registry', github_url: '', prototype_url: '', status: 'ONLINE',
    domain: 'village-registry.example.com', last_deployment: 'PLACEHOLDER', deployment_history: ['PLACEHOLDER'], uptime: 'STATIC STATUS', health_check: 'NOT CONNECTED',
    featured: true, image: 'village-registry-interface-preview', preview: 'registry', accent: '#83b7ff', year: '2026', caseStudy: registryCase
  }
];

export const skillGroups: SkillGroup[] = [
  { number: 'A', title: 'Design', skills: ['UI Design', 'UX Design', 'Interaction Design', 'Wireframing', 'Prototyping', 'Design Systems', 'Responsive Design'] },
  { number: 'B', title: 'Web Development', skills: ['HTML', 'CSS', 'JavaScript', 'TypeScript', 'Svelte', 'SvelteKit', 'Vue', 'React', 'Tailwind CSS'] },
  { number: 'C', title: 'Full Stack', skills: ['APIs', 'PostgreSQL', 'Supabase', 'Authentication', 'Databases'] },
  { number: 'D', title: 'Engineering', skills: ['Git', 'Testing', 'Performance', 'Software Architecture', 'Web Development'] },
  { number: 'E', title: 'Experimental', skills: ['Rust', 'WebGL', 'OpenCV', 'Computer Vision', 'AI', 'Audio / VST'] }
];

export const labExperiments: LabExperiment[] = [
  { number: 'L.01', title: 'WebGL', field: 'Realtime graphics', description: 'Exploring responsive graphics, motion, and spatial interfaces in the browser.', signal: 'VERTEX / FRAGMENT' },
  { number: 'L.02', title: 'OpenCV', field: 'Computer vision', description: 'Testing ways for software to interpret images, motion, and visual input.', signal: 'VISION / INPUT' },
  { number: 'L.03', title: 'Rust', field: 'Systems experiments', description: 'Learning through small systems programs where memory, speed, and control matter.', signal: 'MEMORY / SPEED' },
  { number: 'L.04', title: 'AI', field: 'Applied intelligence', description: 'Prototyping useful interactions around models, prompts, and structured responses.', signal: 'MODEL / RESPONSE' },
  { number: 'L.05', title: 'Audio / VST', field: 'Digital signal', description: 'Exploring sound, signal flow, and the interface patterns of audio tools.', signal: 'WAVE / FILTER' },
  { number: 'L.06', title: 'Experimental interfaces', field: 'Technical prototypes', description: 'A place for unfinished interface ideas that are still worth testing.', signal: 'UNKNOWN / GOOD' }
];

export function getProject(slug: string) { return projects.find((project) => project.slug === slug); }
export function getNextProject(slug: string) {
  const index = projects.findIndex((project) => project.slug === slug);
  return projects[(index + 1) % projects.length];
}
