let chart = document.getElementById('myChart').getContext('2d');
let myChart = new Chart(chart, {
    type: 'doughnut',
    data: {
        labels: ['Compris', "Pas compris"],
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
          text:"T ES 3",
          fontSize: 24,
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
