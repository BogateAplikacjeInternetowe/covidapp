<template>
  <div class="home-container">
    <div class="home">
      <div class="container">
        <div class="row">
          <img alt="" width="5%" height="5%" src="../assets/icons/covid-icon.png"/>
          <h1><span class="font-weight-bold">Polska</span> COVID-21 STATISTICS</h1>
        </div>
      </div>  
    </div>

    <div class="container">
      <div class="row home-first-line-patients-numbers">
        <div class="col-2 patients">
          CHORYCH
        </div>
        <div class="col-2 patients">
          WYZDROWIAŁYCH
        </div>
        <div class="col-2 patients">
          W SZPITALU
        </div>
        <div class="col-2 patients">
          MARTWYCH
        </div>
      </div>

      <div class="row home-second-line">
        <div class="col main-page-container">
          <img alt="Vue logo" src="../assets/logo.png">
          <FirstComponent msg="TUTAJ MOZEMY UMIESCIC TABELE Z PODZIALEM NA WOJEWODZTWA"/>
        </div>
        <div class="col main-page-container">
          <img alt="Vue logo" src="../assets/logo.png">
          <SecondComponent msg="TUTAJ MOZNA JAKAS MAPKE"/>
        </div>
      </div>

      <div class="row home-third-line">
        <div class="col main-page-container">
          <img alt="Vue logo" src="../assets/logo.png">
          <ThirdComponent msg="TUTAJ WYKRES NR 1"/>
        </div>
        <div class="col main-page-container">
          <img alt="Vue logo" src="../assets/logo.png">
          <FourthComponent msg="TUTAJ WYKRES NR 2 NP NA TLE SREDNIEJ NA SWIECIE"/>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import FirstComponent from '@/components/FirstComponent.vue'
import SecondComponent from '@/components/SecondComponent.vue'
import ThirdComponent from '@/components/ThirdComponent.vue'
import FourthComponent from '@/components/FourthComponent.vue'


export default {
  name: 'Home',
  components: {
    FirstComponent,
    SecondComponent,
    ThirdComponent,
    FourthComponent
  }
}
</script>

