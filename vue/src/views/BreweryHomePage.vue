<template>
  <div>
    <div id="brewery-home-page">
      <div id="brewery-details-container">
        <brewery-details />
      </div>

      <div id="beer-list-container">
        <beer-list id="beer-list"></beer-list>
      </div>

      <div id="brewery-reviews-container">
        <brewery-reviews></brewery-reviews>
      </div>
    </div>
  </div>
</template>

<script>
import BreweryDetails from "@/components/BreweryDetails";
import BeerList from "@/components/BeerList";
import BreweryReviews from "@/components/BreweryReviews";

export default {
  components: {
    BreweryDetails,
    BeerList,
    BreweryReviews,
  },
  // data() {
  //   return {
  //     breweryId: null
  //   }
  // },
  // created() {
  //   this.breweryId 
  // }
};
</script>

<style>
#brewery-home-page {
  display: grid;
  grid-template-areas: 
  "details beers"
  "details reviews";
  grid-template-columns: 1fr 2fr;
  height: 100%;
  width: 100%;
  overflow: hidden;
}

#brewery-details-container {
  grid-area: "details";
  height: 100%;
  width: 100%;
  overflow-y: auto;
}

#beer-list-container {
  grid-area: "details";
  overflow-y: auto;
}

#brewery-reviews-container {
  grid-area: "reviews";
  display: flex;
  justify-content: center;
  align-items: center;
  grid-area: "details";
  overflow-y: auto;
}
</style>