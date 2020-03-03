const notifications = document.querySelectorAll(".notification-card")
const notificationContainer = document.querySelector(".notification-container")
const noNotificationMessage = document.querySelector(".no-notification-message")

if (notificationContainer) {
  if (notifications === undefined || notifications.length == 0) {
    notificationContainer.classList.add("d-none")
    noNotificationMessage.classList.remove("d-none")
  }
  else {
    notificationContainer.classList.remove("d-none")
    noNotificationMessage.classList.add("d-none")
  }
}
