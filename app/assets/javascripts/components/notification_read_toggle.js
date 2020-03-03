const notification = document.querySelector(".notification-card")

if (notification) {
  notification.addEventListener("click", (event) => {
    $.ajax({
        url: '/teachers/notifications/mark_as_read',
        type: 'put'
      });
  }
  , {once : true});
}
