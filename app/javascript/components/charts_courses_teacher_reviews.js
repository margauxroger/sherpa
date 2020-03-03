const barGraphTeacherReview = () => {
  let chart = document.getElementById("barGraphTeacherReview")

  if (chart) {
  let div_chart = document.querySelector(".barGraphTeacherReviewClass")
  let reviews_hash = JSON.parse(div_chart.dataset.reviews)
  new Chart(chart, {
    type: 'horizontalBar',
    data: {
      labels: Object.keys(reviews_hash),
      datasets: [{
          data: Object.values(reviews_hash),
          label: "percentage overall",
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
        text: "Percentage of votes for each stars"
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
                  labelString: '% of ratings'
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

export { barGraphTeacherReview };
