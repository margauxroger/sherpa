import "bootstrap";

import { graph  } from "../components/charts_teacher_home";
graph();

import { initMarkdown } from 'pluggins/init_markdown';

import "../components/footer"

initMarkdown();

import { lineGraph } from '../components/charts_courses_show_line';
lineGraph();

import { scatterGraph } from '../components/charts_courses_show_scatter';
scatterGraph();

import { initTranslateMarkdown } from 'pluggins/init_turndown';
initTranslateMarkdown();

import { lineGraphStudent } from '../components/charts_courses_student_show_line';
lineGraphStudent();

import { scrollLastMessageIntoView } from '../components/messages';
scrollLastMessageIntoView();

//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree


import { dougnhutGraphStudent } from '../components/charts_courses_student_show_dougnhut_flash';
dougnhutGraphStudent();



import { displayIndividualChart } from '../components/display_individual_student_chart';
displayIndividualChart ();

import { showChapterFlashcards } from '../components/flashcard_chapter';
showChapterFlashcards();

