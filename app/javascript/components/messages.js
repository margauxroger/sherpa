// const message_history = document.querySelector('.message-history');

// scrollMessages = () => {
// //   if (message_history) {
// // message_history.scrollTop = message_history.scrollHeight;
// //   }
// // }

// window.onload=function () {
//     const message_history = document.querySelector('.message-history');

//     if (message_history) {
//       message_history.scrollTop = message_history.scrollHeight;
//     }
// }
// }

// export { scrollMessages };
const scrollLastMessageIntoView = () => {
  const forumBtn = document.getElementById('v-pills-forum-tab')
  if (forumBtn) {
    forumBtn.addEventListener('click', (event) => {
      console.log("hey")
      const messages = document.querySelectorAll('.message');
      const lastMessage = messages[messages.length - 1];
      lastMessage.scrollIntoView();
    })
  }

}

export { scrollLastMessageIntoView }


