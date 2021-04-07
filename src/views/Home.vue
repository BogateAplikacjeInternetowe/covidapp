<template>
  <div class="home-container">
    <div class="home">
      <div class="container">
        <div class="row">
          <img alt="" width="5%" height="5%" src="../assets/icons/covid-icon.png"/>
          <h1><span class="font-weight-bold">Poland</span> COVID-21 STATISTICS</h1>
        </div>
      </div>  
    </div>

    <div class="container">
      <div class="row justify-content-center home-first-line-patients-numbers">
        <div class="col-2 patients">
          PRZYPADKÓW: 
          <div class="infected">
            <img alt="" width="22%" height="22%" src="../assets/icons/mask.svg"/>
            {{ responseTotalCases.infected }}</div>
        </div>
        <div class="col-2 patients">
          ZAKAŻONYCH: 
          <div class="activeCase">
            <img alt="" width="20%" height="20%" src="../assets/icons/lung.svg"/>
            {{ responseTotalCases.activeCase }}</div>
        </div>
        <div class="col-2 patients">
          WYZDROWIAŁO: 
          <div class="recovered">
            <img alt="" width="20%" height="20%" src="../assets/icons/recover.svg"/>
            {{ responseTotalCases.recovered }}</div>
        </div>
        <div class="col-2 patients">
          ZMARŁO: 
          <div class="deceased">
            <img alt="" width="20%" height="20%" src="../assets/icons/hospital.svg"/>
            {{ responseTotalCases.deceased }}</div>
        </div>
      </div>

      <div class="row home-second-line">
        <div class="col main-page-container">
          <TableRegions/>
        </div>
        <div class="col main-page-container">
          <SecondComponent msg="TUTAJ MOZNA JAKAS MAPKE"/>
        </div>
      </div>

      <div class="row home-third-line">
        <div class="col main-page-container">
          <ThirdComponent msg="TUTAJ WYKRES NR 1"/>
        </div>
        <div class="col main-page-container">
          <FourthComponent msg="TUTAJ WYKRES NR 2 NP NA TLE SREDNIEJ NA SWIECIE"/>
        </div>
      </div>
    </div>
  <footer>
    <div class="date-of-data">
      Dane z dnia: {{ responseTotalCases.lastUpdatedAtSource }}
    </div>
  </footer>
</div>
</template>

<script>
// @ is an alias to /src
import TableRegions from '@/components/TableRegions.vue'
import SecondComponent from '@/components/SecondComponent.vue'
import ThirdComponent from '@/components/ThirdComponent.vue'
import FourthComponent from '@/components/FourthComponent.vue'


export default {
  name: 'Home',
  components: {
    TableRegions,
    SecondComponent,
    ThirdComponent,
    FourthComponent
  },
  data () {
    return {
      responseTotalCases: '',
    }
  },
  mounted() {
    fetch('https://api.apify.com/v2/key-value-stores/3Po6TV7wTht4vIEid/records/LATEST')
      .then((response) => response.json())
      .then(data => this.responseTotalCases = data)
  }
}
</script>

