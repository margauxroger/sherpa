const doughnutGraphIndexStudent = () => {
  let charts = document.querySelectorAll(".doughnutChartIndexStudent")
  charts.forEach(chart =>{
    if (chart) {
    console.log(chart.dataset.course)
    const scores = JSON.parse(chart.dataset.score)
    const material = chart.dataset.course
    let value = scores[material]
    console.log(value)
    new Chart(chart, {
      type: 'doughnut',
     data: {
         labels: ['N°done', "N° not done"],
         datasets: [{
             label: 'Flashcards done',
             data: [value,100-value],
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
          text:"Flashcards 🤓"
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
  })
};

export { doughnutGraphIndexStudent };
