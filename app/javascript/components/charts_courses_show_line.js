const lineGraph = () => {
  let chart = document.getElementById("lineChart")

  // console.log(typeof score_hash)
  // console.log(score_hash)

  if (chart) {
  let div_chart = document.querySelector(".lineChartClass")
  let score_hash = JSON.parse(div_chart.dataset.chapters)
  new Chart(chart, {
    type: 'bar',
    data: {
      labels: Object.keys(score_hash),
      datasets: [{
          data: Object.values(score_hash),
          label: "Flashcards done",
          borderColor: "purple",
          backgroundColor: "purple",
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
                  beginAtZero: true,
              },
              gridLines : {
                display: false,
              }
          }],
          xAxes: [{
              ticks: {
                  display: true,
                  beginAtZero: true,
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
