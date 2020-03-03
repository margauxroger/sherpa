import "bootstrap";
import "../components/footer"
import "../components/dashboardNotifications"

import { graph  } from "../components/charts_teacher_home";
import { initMarkdown } from 'pluggins/init_markdown';
import { lineGraph } from '../components/charts_courses_show_line';
import { scatterGraph } from '../components/charts_courses_show_scatter';
import { initTranslateMarkdown } from 'pluggins/init_turndown';
import { lineGraphStudent } from '../components/charts_courses_student_show_line';
import { dougnhutGraphStudent } from '../components/charts_courses_student_show_dougnhut_flash';
import { handleClickOnStudentsList } from '../components/handleClickOnStudentsList';
import { handleClickOnForum } from '../components/handleClickOnForum';
import { handleClickOnFeedbackList } from '../components/handleClickOnFeedbackList';


graph();
initMarkdown();
lineGraph();
scatterGraph();
initTranslateMarkdown();
lineGraphStudent();
dougnhutGraphStudent();
handleClickOnStudentsList();
handleClickOnForum();
handleClickOnFeedbackList();


import { scrollLastMessageIntoView } from '../components/messages';
scrollLastMessageIntoView();

//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree


import { dougnhutGraphStudent } from '../components/charts_courses_student_show_dougnhut_flash';
dougnhutGraphStudent();

import { barGraphTeacherReview } from '../components/charts_courses_teacher_reviews';
barGraphTeacherReview();


import { displayIndividualChart } from '../components/display_individual_student_chart';
displayIndividualChart ();

import { showChapterFlashcards } from '../components/flashcard_chapter';
showChapterFlashcards();
