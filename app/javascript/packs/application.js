import "bootstrap";

import { graph  } from "../components/charts_teacher_home";
graph();

import { initMarkdown } from 'pluggins/init_markdown';

import "../components/footer"

initMarkdown();

import { initTranslateMarkdown } from 'pluggins/init_turndown';

initTranslateMarkdown();
