<template>
  <div class="chart-container">
    <canvas id="world-average-chart"></canvas>
  </div>
</template>
<script>
import Chart from "chart.js";
export default {
  name: "WorldAverageChart",
  data: () => ({
    loaded: false,
    chartData: [],
    labels: [],
  }),
  mounted() {
    fetch("https://my.api.mockaroo.com/global_vaccines_cases.json?key=d80167b0")
      .then((response) => response.json())
      .then((data) => (this.chartData = data))
      .then(() => this.renderChart());
  },
  methods: {
    renderChart() {
      console.log(this.chartData);
      const ctx = document.getElementById("world-average-chart");
      new Chart(ctx, {
        type: "bar",
        data: {
          labels: this.chartData.map((d) => d.country),
          datasets: [
            {
              label: "Number of Vaccines",
              data: this.chartData.map((d) => d.vaccines),
              backgroundColor: "rgba(54,73,93,.5)",
              borderColor: "#36495d",
              borderWidth: 3,
            },
            {
              label: "Number of Cases",
              data: this.chartData.map((d) => d.cases),
              backgroundColor: "rgba(71, 183,132,.5)",
              borderColor: "#47b784",
              borderWidth: 3,
            },
          ],
        },
      });
    },
  },
};
</script>
<style scoped>
</style>
