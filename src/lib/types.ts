export type ProjectStatus = 'ONLINE' | 'DEVELOPMENT' | 'PROTOTYPE';
export type ProjectDiscipline = 'UI/UX' | 'WEB' | 'FULL STACK' | 'EXPERIMENTAL';

export type PreviewVariant = 'cadence' | 'galactico' | 'frontoffice' | 'registry';

export interface Project {
  name: string;
  slug: string;
  number: string;
  description: string;
  category: string;
  web_label: string;
  role: string;
  disciplines: ProjectDiscipline[];
  technologies: string[];
  live_url: string;
  github_url: string;
  prototype_url: string;
  status: ProjectStatus;
  domain: string;
  last_deployment: string;
  deployment_history: string[];
  uptime: string;
  health_check: string;
  featured: boolean;
  image: string;
  preview: PreviewVariant;
  accent: string;
  year: string;
  caseStudy: CaseStudyContent;
}

export interface CaseStudyContent {
  overview: string;
  context: string;
  problem: string;
  uxThinking: string;
  userFlow: string;
  wireframes: string;
  visualDesign: string;
  interactionDesign: string;
  development: string;
  technicalArchitecture?: string;
  challenges: string;
  result: string;
  whatILearned: string;
  futureImprovements: string;
}

export interface LabExperiment {
  number: string;
  title: string;
  field: string;
  description: string;
  signal: string;
}

export interface SkillGroup {
  number: string;
  title: string;
  skills: string[];
}
