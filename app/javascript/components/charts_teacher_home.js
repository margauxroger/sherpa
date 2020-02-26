let charts = document.querySelectorAll('.chart-teacher-show');
  if (charts) {
  charts.forEach(element => {
    let chart = element.querySelector('.myCharts')
    let myChart = new Chart(chart, {
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
            reponsive: true,
            maintainAspectRatio: false,
            title:{
              display: true,
              text: element.dataset.division,
              fontSize: 18,
            },
            legend: {
              display: false,
            },
            scales: {
                yAxes: [{
                    ticks: {
                        display: false,
                        beginAtZero: true
                    },
                    gridLines : {
                      display: false,
                    }
                }]
            }
        }
    });
  });
  }
