const dougnhutGraphStudent = (score, bool = false) => {
  let chart = document.getElementById("dougnhutChartStudentFlash")
  if (chart) {
  new Chart(chart, {
    type: 'doughnut',
   data: {
       labels: ['Flashcards done', "Flashcards not done"],
       datasets: [{
           label: 'Flashcards done',
           data: [score,100-score],
           backgroundColor: [
               'rgba(79, 42, 205, 0.6)',
               'rgba(79, 42, 205, 0.1)'
           ],
           borderColor: [
               'rgba(79, 42, 205, 1)',
               'rgba(79, 42, 205, 0.6)'
           ],
           borderWidth: 0
       }]
   },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: bool,
      },
      title: {
        display: bool,
        text: "Flashcards progression over all chapters"
      },
      scales: {
          yAxes: [{
              ticks: {
                  display: false,
                  beginAtZero: false,
              },
              gridLines : {
                display: false,
              }
          }],
          xAxes: [{
              ticks: {
                  display: false,
                  beginAtZero: false,
              },
              gridLines : {
                display: false,
              }
          }]
      },
    }
  });
  }
};

export { dougnhutGraphStudent };
