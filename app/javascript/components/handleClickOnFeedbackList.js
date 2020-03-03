const handleClickOnFeedbackList = () => {

  const clickOnFeedbackList = document.getElementById('click_on_feedback_list');

  if (clickOnFeedbackList) {
    const click = clickOnFeedbackList.dataset.click

    if (click) {
      const tab = document.getElementById('v-pills-feedbacks-tab');
      tab.click();
    }
  }
}


export { handleClickOnFeedbackList };
