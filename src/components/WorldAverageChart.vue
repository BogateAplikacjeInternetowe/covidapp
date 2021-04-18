<template>
  <div class="chart-container">
      <h3 class="text-center">ŚWIAT</h3>
      <h6 class="text-center">LICZBA PRZYPADKÓW ORAZ ZASZCZEPIONYCH</h6>
      <hr/>
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
              label: "Liczba zaszczepionych",
              data: this.chartData.map((d) => d.vaccines),
              backgroundColor: "#74A57F",
              borderColor: "#077187",
              borderWidth: 2,
            },
            {
              label: "Liczba przypadków",
              data: this.chartData.map((d) => d.cases),
              backgroundColor: "rgba(161, 105, 105)",
              borderColor: "rgba(209, 0, 0)",
              borderWidth: 2,
            },
          ],
        },
      });
    },
  },
};
</script>
<style scoped>
#world-average-chart {
  height: 250%;
}
</style>