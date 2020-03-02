const showChapterFlashcards = () => {
  const chapterRows = Array.from(document.querySelectorAll(".row-flashcards-chapter"));

  if (chapterRows) {
    chapterRows.forEach((chapterRow) => {
      const chapterName = chapterRow.firstElementChild;
      chapterName.addEventListener('click', (event) => {
        event.preventDefault();
        console.log('hello in there')
        console.log(chapterName.nextElementSibling)
        let flashcardTeacher = chapterName.nextElementSibling;
            while (flashcardTeacher !== chapterRow.lastElementChild) {
              console.log(flashcardTeacher)
              flashcardTeacher.classList.toggle('no-show')
              flashcardTeacher = flashcardTeacher.nextElementSibling
            }
        chapterRow.lastElementChild.classList.toggle('no-show')
      })
    })
  }


}

export { showChapterFlashcards }
