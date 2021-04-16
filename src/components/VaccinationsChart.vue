<script>
import { Line } from "vue-chartjs";
export default {
  extends: Line,
  props: {
    label: {
      type: String
    },
    chartData: {
      type: Array
    },
    options: {
      type: Object
    },
    chartColors: {
      type: Object
    }
  },
  mounted() {
    const tests = this.chartData.map(d => d.liczba_szczepien_ogolem).reverse();
    const totals = this.chartData.map(d => d.total).reverse();
    const {
      borderColor,
      pointBorderColor,
      pointBackgroundColor,
      backgroundColor
    } = this.chartColors;
    
    this.renderChart(
      {
        labels: totals,
        datasets: [
          {
            label: this.label,
            data: tests,
            borderColor: borderColor,
            pointBorderColor: pointBorderColor,
            pointBackgroundColor: pointBackgroundColor,
            backgroundColor: backgroundColor
          }
        ]
      },
      this.options
    );
  }
};
</script>