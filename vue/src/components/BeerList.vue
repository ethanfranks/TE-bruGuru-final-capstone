<template>
  <div class="beer-list">
    <beer-card
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

<style>
.beer-list {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
</style>