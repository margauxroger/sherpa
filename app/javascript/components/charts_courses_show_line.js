const lineGraph = () => {
  let chart = document.getElementById("lineChart")

  if (chart) {
  let div_chart = document.querySelector(".lineChartClass")
  let score_hash = JSON.parse(div_chart.dataset.chapters)
  let cumulative_score_hash = JSON.parse(div_chart.dataset.score)
  console.log(score_hash)
  console.log(cumulative_score_hash)
  new Chart(chart, {
    type: 'bar',
    data: {
      labels: Object.keys(score_hash),
      datasets: [{
          data: Object.values(score_hash),
          label: "Flashcards done",
          borderColor: "purple",
          backgroundColor: "rgba(79, 42, 205, 0.1)",
          fill: false
        },
        {
          data: Object.values(cumulative_score_hash),
          label: "Flashcards done",
          borderColor: "rgba(112,115,190,0.8)",
          backgroundColor: "blue",
          fill: false,
          type: 'line',
                },
        ],
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
