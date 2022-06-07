<template>
  <div class="card">
    <div class="beer-name">{{ beer.name }}</div>
    <div class="beer-img"><img :src="beer.imageURL" /></div>
    <!-- Need to link to the breweries table with brewery id to get brewery name -->
    <!-- <div class="brewery-name">{{ beer.brewery_name }}</div> -->
    <div class="beer-style">
      <p class="characteristic-tag">Type:</p>
      {{ beer.style }}
    </div>
    <div class="beer-abv">
      <p class="characteristic-tag">ABV:</p>
      {{ beer.abv }}
    </div>
    <div class="flavor-profile">
      <p class="characteristic-tag">Flavor Profile:</p>
      {{ beer.profile }}
    </div>
    <div class="description-tag">Description</div>
    <div class="beer-description">{{ beer.description }}</div>
    <div class="average-rating">
      Average Rating: {{ beer.averageRating }} / 5
    </div>
    <button @click="goToReviews" class="viewAllReviews">
      View All Reviews
    </button>
    <beer-reviews></beer-reviews>
  </div>
</template>

<script>
import beerReviews from "@/components/BeerReviews";
export default {
  name: "beer-card",
  props: ["beer"],
  components: {
    beerReviews,
  },
  methods: {
    isBrewer() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name == "ROLE_BREWER") {
          return true;
        }
      }
    },
    goToReviews() {
      this.$router.push({
        name: "beer-review-list",
        params: { id: `${this.beer.id}` },
      });
    },
  },
};
</script>

<style>
.card {
  border: 2px solid black;
  border-radius: 10px;
  width: 250px;
  height: 550px;
  margin: 20px;
}

.card .beer-name {
  font-size: 1.5rem;
}

.card .beer-img {
  height: 10rem;
  display: flex;
  justify-content: center;
}

.card .brewery-name {
  font-size: 1rem;
}

.card .description-tag {
  font-weight: bold;
  text-decoration: underline;
}

.card .characteristic-tag {
  font-weight: bold;
  display: inline;
}

.card .is-available {
  font-weight: bold;
}

.card .not-available {
}
</style>