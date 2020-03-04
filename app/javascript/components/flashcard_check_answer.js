const showFlashcardAnswer = () => {

  const btnCheckAnswer = document.querySelectorAll('.button-submit-flashcard')
  // const hiddenAnswer = document.querySelectorAll('.hidden-answer')


  if (btnCheckAnswer) {
    btnCheckAnswer.forEach((btn) => {
      btn.addEventListener('click', (event) => {
        btn.classList.add('no-show')
        btn.nextElementSibling.classList.remove('no-show')
      })
    })
  }
}

export { showFlashcardAnswer }
