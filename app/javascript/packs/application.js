import "bootstrap";

import { graph  } from "../components/charts_teacher_home";
graph();

import { initMarkdown } from 'pluggins/init_markdown';

initMarkdown();

import { lineGraph } from '../components/charts_courses_show_line';
lineGraph();

import { scatterGraph } from '../components/charts_courses_show_scatter';
scatterGraph();
