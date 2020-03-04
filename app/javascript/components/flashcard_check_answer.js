const showFlashcardAnswer = () => {

  const btnCheckAnswer = document.querySelectorAll('.button-submit-flashcard')
  // const hiddenAnswer = document.querySelectorAll('.hidden-answer')


  if (btnCheckAnswer) {
    btnCheckAnswer.forEach((checkAnswer) => {
      checkAnswer.addEventListener('click', (event) => {
        checkAnswer.classList.add('no-show')
        checkAnswer.nextElementSibling.classList.remove('no-show')
      })
    })
  }
}

export { showFlashcardAnswer }
