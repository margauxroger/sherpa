const handleClickOnForum = () => {

  const clickOnForum = document.getElementById('click_on_forum');

  if (clickOnForum) {
    const click = clickOnForum.dataset.click

    if (click) {
      const tab = document.getElementById('v-pills-forum-tab');
      tab.click();
    }
  }
}


export { handleClickOnForum };
