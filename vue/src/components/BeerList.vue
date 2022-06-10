<template>
  <div>
    <!-- <h3>Our Selection</h3> -->
    <beer-card
      class="beer-card"
      v-for="beer in beers"
      v-bind:key="beer.beer_id"
      v-bind:beer="beer"
    ></beer-card>
  </div>
</template>

<script>
import beerCard from "@/components/BeerCard";
import beerService from "@/services/BeerService";
import BreweryService from "@/services/BreweryService";

export default {
  name: "beer-list",
  components: {
    beerCard,
  },

  data() {
    return {
      beers: [],
    };
  },
  created() {
    let thisId = this.$route.params.id;
    if (thisId != null) {
        return beerService.getBeersByBreweryId(thisId).then((response) => {
        this.beers = response.data;
      });
    } else {
        let brewery = {};
        BreweryService.getBreweryByUsername().then((response) => {
        brewery = response.data;
        thisId = brewery.brewery_id;
        return beerService.getBeersByBreweryId(thisId).then((response) => {
        this.beers = response.data;
      });
      })
    }
  },
};
</script>

<style scoped>
#beer-list {
  font-family: "Nunito Sans", sans-serif;
  height: 100%;
  width: 100%;
}

.beer-card {
  margin: 0.2%;
}
</style>