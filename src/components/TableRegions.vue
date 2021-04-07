<template>
  <div class="table-container">
    <table class="table">
      <thead>
        <tr>
          <th scope="col">Województwo</th>
          <th scope="col">Zakażonych</th>
          <th scope="col">Wyzdrowiało</th>
          <th scope="col">Zmarło</th>
          <th scope="col">Przetestowano</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(region, index) in responseTotalCases.infectedByRegion" v-bind:key="index">
          <th scope="row">{{ region.region }}</th>
          <td>{{ region.infectedCount }}</td>
          <td>{{ region.recoveredCount }}</td>
          <td>{{ region.deceasedCount }}</td>
          <td>{{ region.testedCount }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  name: 'TableRegions',
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

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
thead {
  background-color: rgb(247, 244, 244);
}
tr {
  text-align: center;
}
tr:hover {
  transition: 0.3s;
  background-color: rgb(247, 244, 244);
}
</style>
