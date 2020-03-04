const lineGraph = () => {
  let chart = document.getElementById("lineChart")

  if (chart) {
  let div_chart = document.querySelector(".lineChartClass")
  let score_hash = JSON.parse(div_chart.dataset.chapters)
  console.log(score_hash)
  let cumulative_score_hash = JSON.parse(div_chart.dataset.score)
  console.log(cumulative_score_hash)
  new Chart(chart, {
    type: 'bar',
    data: {
      labels: Object.keys(score_hash),
      datasets: [{
          data: Object.values(score_hash),
          label: "Flashcards score",
          borderColor: "purple",
          backgroundColor: "rgba(79, 42, 205, 0.1)",
          fill: false,
          yAxisID: 'A',
        },
        {
          data: Object.values(cumulative_score_hash),
          label: "Flashcards cumulative score",
          borderColor: "rgba(112,115,190,0.8)",
          backgroundColor: "blue",
          fill: false,
          type: 'line',
          yAxisID: 'B',
                },
        ],
    },
    options: {
      responsive: true,
      maintainAspectRatio: false,
      legend: {
        display: true,
      },
      title: {
        display: true,
        text: "Flashcards progression over chapters"
      },
      scales: {
          yAxes: [
              {
                id: 'A',
                type: 'linear',
                position: 'left',
                ticks: {
                    display: true,
                    beginAtZero: true,
                },
                gridLines : {
                  display: false,
                },
                scaleLabel: {
                  display: true,
                  labelString: 'Score of class for each chapter'
                }
              },
              {
                id: 'B',
                type: 'linear',
                position: 'right',
                ticks: {
                    display: true,
                    beginAtZero: true,
                },
                gridLines : {
                  display: false,
                },
                scaleLabel: {
                  display: true,
                  labelString: 'Cumulative core of class'
                }
              }
          ],
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
