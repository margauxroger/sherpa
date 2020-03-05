import { dougnhutGraphStudent } from './charts_courses_student_show_dougnhut_flash';
import { lineGraphStudent } from './charts_courses_student_show_line';


const displayIndividualChart= () => {
  const cardsStudent = document.querySelectorAll(".card-student-list")
  const dashboardStudentFirstName = document.querySelector(".first_name_student_list")
  const dashboardStudentScore = document.querySelector(".score_student_list")
  const dashboardStudentPhoto = document.querySelector(".photo_student_list")
    cardsStudent.forEach((item) => {

      item.addEventListener("click", (event) => {
        dashboardStudentFirstName.innerHTML=item.dataset.name;
        dashboardStudentScore.innerHTML=item.dataset.score;
        dashboardStudentPhoto.src=item.dataset.photo;
        dougnhutGraphStudent(item.dataset.score, true);
        console.log(dougnhutGraphStudent)
        const values = JSON.parse(item.dataset.value);
        lineGraphStudent(values);



      });
  });



};

export { displayIndividualChart };
