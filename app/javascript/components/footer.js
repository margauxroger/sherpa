const footer = document.querySelector('.home-footer');
if (footer) {
  if (document.body.clientHeight < window.innerHeight) {
    footer.classList.add('fixed-bottom');
  }

}
