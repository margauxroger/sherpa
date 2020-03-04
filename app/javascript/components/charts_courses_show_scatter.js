const scatterGraph = () => {
  let chart = document.getElementById("scatterChart")
  if (chart) {
    let div_chart = document.querySelector(".scatterChartClass")
    let score_hash = JSON.parse(div_chart.dataset.score)
    console.log(score_hash)
    let array_color = []
    let array_coordinates = []
    Object.entries(score_hash).forEach(([key,value]) => {
      array_color.push(value.color)
      array_coordinates.push({x: value.x, y: value.y})
    });
    console.log(array_color)
    console.log(array_coordinates)
  new Chart(chart, {
    type: 'scatter',
 data: {
       datasets: [{
           label: 'Scatter Dataset',
           pointBackgroundColor: array_color,
           data: array_coordinates
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
        text: "Sudent clustering by level"
      },
      scales: {
          yAxes: [{
              ticks: {
                  display: true,
                  beginAtZero: true,
              },
              gridLines : {
                display: true,
              },
              scaleLabel: {
                      display: true,
                      labelString: 'Sentiment score'
                    }
          }],
          xAxes: [{
              ticks: {
                  display: true,
                  beginAtZero: true,
              },
              gridLines : {
                display: true,
              },
              scaleLabel: {
                      display: true,
                      labelString: 'Sherpa performance'
                    }
          }]
      },
    }
  });
  }
};

export { scatterGraph };
