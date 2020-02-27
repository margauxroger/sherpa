const lineGraph = () => {
  let chart = document.getElementById("lineChart")
  if (chart) {
  new Chart(chart, {
    type: 'line',
    data: {
      labels: ["Chapter 1", "Chapter 2", "Chapter 3", "Chapter 4", "Chapter 5", "Chapter 6"],
      datasets: [{
          data: [86, 72, 19, 29, 98, 37],
          label: "Flashcards done",
          borderColor: "purple",
          fill: false
        },
      ]
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
                  display: true,
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

export { lineGraph };
