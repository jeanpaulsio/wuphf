class PagesController < ApplicationController
  def investors
    @dataset = {
        labels: ["Month 1", "Month 2", "Month 3", "Month 4", "Month 5", "Month 6"],
        datasets: [
            {
                label: "Projected 6 Month Revenue",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(252,133,46,1)",
                borderColor: "rgba(252,133,46,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(118,22,211,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(118,22,211,1)",
                pointHoverBorderColor: "rgba(118,22,211,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: [143657, 298736475, 512398745, 698736475, 919837465, 1000000000],
                spanGaps: false,
            },
            {
                label: "Daily Active Users",
                fill: false,
                lineTension: 0.1,
                backgroundColor: "rgba(118,22,211,1)",
                borderColor: "rgba(118,22,211,1)",
                borderCapStyle: 'butt',
                borderDash: [],
                borderDashOffset: 0.0,
                borderJoinStyle: 'miter',
                pointBorderColor: "rgba(118,22,211,1)",
                pointBackgroundColor: "#fff",
                pointBorderWidth: 1,
                pointHoverRadius: 5,
                pointHoverBackgroundColor: "rgba(118,22,211,1)",
                pointHoverBorderColor: "rgba(118,22,211,1)",
                pointHoverBorderWidth: 2,
                pointRadius: 1,
                pointHitRadius: 10,
                data: [1000000, 200000000, 400000000, 600000000, 900000000, 1000000000],
                spanGaps: false,
            },
        ]
    }
  end
end
