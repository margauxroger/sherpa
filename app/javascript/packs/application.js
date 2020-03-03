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
import { scrollLastMessageIntoView } from '../components/messages';
import { barGraphTeacherReview } from '../components/charts_courses_teacher_reviews';
import { displayIndividualChart } from '../components/display_individual_student_chart';
import { showChapterFlashcards } from '../components/flashcard_chapter';


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
scrollLastMessageIntoView();
dougnhutGraphStudent();
barGraphTeacherReview();
displayIndividualChart ();
showChapterFlashcards();

//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree



import { dougnhutGraphStudent } from '../components/charts_courses_student_show_dougnhut_flash';
dougnhutGraphStudent(0);



import { displayIndividualChart } from '../components/display_individual_student_chart';
displayIndividualChart ();

import { showChapterFlashcards } from '../components/flashcard_chapter';
showChapterFlashcards();



