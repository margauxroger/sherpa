const displayIndividualChart= () => {
  const cardsStudent = document.querySelectorAll(".card-student-list")
  const dashboardStudentFirstName = document.querySelector(".first_name_student_list")
  const dashboardStudentScore = document.querySelector(".score_student_list")
  const dashboardStudentPhoto = document.querySelector(".photo_student_list")
  console.log(dashboardStudentPhoto)
  console.log(dashboardStudentScore)

    cardsStudent.forEach((item) => {

      item.addEventListener("click", (event) => {
        dashboardStudentFirstName.innerHTML=item.dataset.name
        dashboardStudentScore.innerHTML=item.dataset.score
        dashboardStudentPhoto.src=item.dataset.photo
      });
  });

};

export { displayIndividualChart };
