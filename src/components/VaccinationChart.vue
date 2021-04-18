<template>
  <div class="chart-container">
    <div class="col">
      <h3 class="text-center">POLSKA</h3>
      <h6 class="text-center">ZASZCZEPIONYCH OGÓŁEM</h6>
      <hr/>
      <line-chart v-if="loaded"
        :chartData="arr"
        :options="chartOptions"
        :chartColors="positiveChartColors"
          label="Liczba zaszczepionych"/>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import LineChart from "@/components/VaccinationsChart.vue";
export default {
  components: {
    LineChart
  },
  data() {
    return {
      arr: [],
      //wait until data is loaded
      loaded: false,
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
    this.loaded=true;
  }
};
</script>
<style scoped>

</style>
