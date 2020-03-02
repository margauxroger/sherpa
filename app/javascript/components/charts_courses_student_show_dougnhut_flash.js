const dougnhutGraphStudent = () => {
  let chart = document.getElementById("dougnhutChartStudentFlash")
  if (chart) {
  new Chart(chart, {
    type: 'doughnut',
   data: {
       labels: ['Flashcards done', "Flashcards not done"],
       datasets: [{
           label: 'Flashcards done',
           data: [78, 22],
           backgroundColor: [
               'rgba(79, 42, 205, 0.6)',
               'rgba(79, 42, 205, 0.1)'
           ],
           borderColor: [
               'rgba(79, 42, 205, 1)',
               'rgba(79, 42, 205, 0.6)'
           ],
           borderWidth: 1
       }]
   },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: false,
      },
      title: {
        display: true,
        text: "Flashcards progression over chapters"
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
