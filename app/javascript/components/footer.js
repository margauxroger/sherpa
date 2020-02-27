const footer = document.querySelector('.home-footer');
if (document.body.clientHeight < window.innerHeight) {
  footer.classList.add('fixed-bottom');
}
