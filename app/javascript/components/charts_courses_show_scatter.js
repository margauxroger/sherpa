const scatterGraph = () => {
  let chart = document.getElementById("scatterChart")
  if (chart) {
  new Chart(chart, {
    type: 'scatter',
 data: {
       datasets: [{
           label: 'Scatter Dataset',
           pointBackgroundColor: ['blue', 'blue', 'blue', 'blue', 'blue', 'green', 'green', 'green', 'green', 'green', 'purple', 'purple', 'purple', 'purple', 'purple', 'purple'],
           data: [{
               x: 10,
               y: 10
           }, {
               x: 9,
               y: 9
           }, {
               x: 10,
               y: 9
           },{
               x: 10,
               y: 8
           },{
              x: 8,
              y: 10
           },{
               x: 6,
               y: 4
           }, {
               x: 4,
               y: 4
           }, {
               x: 6,
               y: 6
           },{
               x: 5,
               y: 6
           },{
              x: 4,
              y: 6
           },
           {
               x: 1,
               y: 1
           }, {
               x: 2,
               y: 2
           }, {
               x: 1,
               y: 2
           },{
               x: 3,
               y: 2
           },{
              x: 1,
              y: 3
           },{
              x: 3,
              y: 1
           }
           ]
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
                      labelString: 'Sherpa performance'
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
                      labelString: 'Class performance'
                    }
          }]
      },
    }
  });
  }
};

export { scatterGraph };
