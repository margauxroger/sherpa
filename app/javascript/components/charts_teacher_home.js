let chart = document.getElementById('myChart')
if (chart) {
chart.getContext('2d');
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
          text:"T ES 1",
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

let chart2 = document.getElementById('myChart2').getContext('2d');
let myChart2 = new Chart(chart2, {
    type: 'doughnut',
    data: {
        labels: ['Flashcards done', "Flashcards not done"],
        datasets: [{
            label: 'Flashcards done',
            data: [58, 42],
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
          text:"T ES 2",
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

let chart3 = document.getElementById('myChart3').getContext('2d');
let myChart3 = new Chart(chart3, {
    type: 'doughnut',
    data: {
        labels: ['Flashcards done', "Flashcards not done"],
        datasets: [{
            label: 'Flashcards done',
            data: [33, 67],
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

let chart4 = document.getElementById('myChart4').getContext('2d');
let myChart4 = new Chart(chart4, {
    type: 'doughnut',
    data: {
        labels: ['Flashcards done', "Flashcards not done"],
        datasets: [{
            label: 'Flashcards done',
            data: [92, 8],
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
          text:"T ES 4",
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
}
