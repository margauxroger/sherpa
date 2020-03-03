const handleClickOnStudentsList = () => {

  const clickOnStudentElement = document.getElementById('click_on_student_list');

  if (clickOnStudentElement) {
    const click = clickOnStudentElement.dataset.click

    if (click) {
      const tab = document.getElementById('v-pills-students-tab');
      tab.click();
    }
  }
}


export { handleClickOnStudentsList };
