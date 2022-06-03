<template>
  <div class="update-beer">
      <h2 class="form-title">Update Beer Information</h2>
      <form class="update-beer-form" v-on:submit.prevent="updateBeer">
          <select name="beer" id="beer">
              <option :value="null">Select Beer to be Updated</option>
              <option value=""></option>
          </select>
      </form>

      <h2 class="form-title">Delete Beer</h2>
      <form class="delete-beer-form" v-on:submit.prevent="deleteBeer"></form>
  </div>
</template>

<script>
import beerService from '@/services/BeerService'

export default {
name: 'update-beer',
data() {
    return {
        beers: []
    }
},
  created() {
    const thisId = this.$route.params.id;
    return beerService.getBeersByBreweryId(thisId).then((response) => {
      this.beers = response.data;
    });
  },
methods: {}
}
</script>

<style>

</style>