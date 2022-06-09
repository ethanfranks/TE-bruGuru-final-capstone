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

export default {
  name: "beer-list",
  props: {
    id: Number,
  },
  components: {
    beerCard,
  },

  data() {
    return {
      beers: [],
    };
  },
  created() {
    // const thisId = this.id;
    return beerService.getBeersByBreweryId(2).then((response) => {
      this.beers = response.data;
    });
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