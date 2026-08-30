import { error } from '@sveltejs/kit';
import type { EntryGenerator, PageLoad } from './$types';
import { getNextProject, getProject, projects } from '$lib/data/projects';

export const entries: EntryGenerator = () => projects.map(({ slug }) => ({ slug }));

export const load: PageLoad = ({ params }) => {
  const project = getProject(params.slug);

  if (!project) {
    error(404, 'Project not found');
  }

  return {
    project,
    nextProject: getNextProject(project.slug)
  };
};
