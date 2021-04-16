<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col">
        <h2 class="text-center">vaccinations</h2>
        <line-chart
          :chartData="arr"
          :options="chartOptions"
          :chartColors="positiveChartColors"
          label="vaccinations"
        />
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
//import moment from "moment";
import LineChart from "./VaccinationsChart";
export default {
  components: {
    LineChart
  },
  data() {
    return {
      arr: [],
      //liczba_szczepien_ogolem: [],
      positiveChartColors: {
        borderColor: "#077187",
        pointBorderColor: "#0E1428",
        pointBackgroundColor: "#AFD6AC",
        backgroundColor: "#74A57F"
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      }
    };
  },
  async created() {
    const { data } = await axios.get("https://my.api.mockaroo.com/vaccinations.json?key=41fb0eb0");
    data.forEach(d => {
      const {
        wojewodztwo,
        liczba_szczepien_ogolem
      } = d;
      this.arr.push({liczba_szczepien_ogolem, total: wojewodztwo });
      console.log("data", this.arr);
    });
  }
};
</script>