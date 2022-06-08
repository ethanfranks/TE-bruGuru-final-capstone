<template>
  <div>
      <beer-card class="beer-card" v-for="beer in beers" v-bind:key="beer.beer_id" v-bind:beer="beer"></beer-card>
  </div>
</template>

<script>
import beerCard from "@/components/BeerCard";
import beerService from "@/services/BeerService";

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
    const thisId = this.$route.params.id;
    return beerService.getBeersByBreweryId(thisId).then((response) => {
      this.beers = response.data;
    });
  },
};
</script>

<style scoped>
#beer-list {
  height: 100%;
  width: 100%;
}

.beer-card {
  margin: 0.2%;
}

</style>