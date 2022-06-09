<template>
  <div>
    <h3 class="beer-name">{{ beer.name }}</h3>

    <div id="beer-card-grid-container">
      
      <div class="beer-img"><img :src="beer.imageURL" /></div>

      <div id="beer-card-details">
        <div class="beer-style">
          <p class="characteristic-tag"><b>Type:</b></p>
          {{ beer.style }}
        </div>
        <div class="beer-abv">
          <p class="characteristic-tag"><b>ABV:</b></p>
          {{ beer.abv }}
        </div>
        <div class="flavor-profile">
          <p class="characteristic-tag"><b>Flavor Profile:</b></p>
          {{ beer.profile }}
        </div>
        <div class="description-tag"><b>Description</b></div>
        <div class="beer-description">{{ beer.description }}</div>
      </div>

      <div id="beer-card-reviews">
        <div class="average-rating">
          <div v-if="beer.averageRating != 'NaN'">
            Average Rating: {{ beer.averageRating }} / 5
          </div>
        </div>
        <button @click="goToReviews" class="viewAllReviews">
          {{ beer.averageRating != 'NaN' ? 'View All Reviews' : 'Be the first to review!'}}
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "beer-card",
  props: ["beer"],
  components: {},
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

<style scoped>
.beer-card {
  font-family: "Nunito Sans", sans-serif;
  border: 2px solid black;
  border-radius: 10px;
  width: 97%;
  min-height: 20%;
  max-height: 50%;
  margin: 0;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.beer-name {
  margin: 0;
}

div > p {
  display: inline;
}

#beer-card-grid-container {
  display: grid;
  grid-template-areas: "img details reviews";
  grid-template-columns: 1fr 3fr 1fr;
  grid-template-rows: 100%;
  overflow: hidden;
  margin-bottom: 1%;
}

.beer-img {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  width: 100%;
}

.beer-img > img {
  grid-area: "img";
  max-width: 90%;
  max-height: 90%;
}

#beer-card-details {
  grid-area: "details";
  overflow-y: auto;
  max-height: 100%;
}

#beer-card-reviews {
  grid-area: "reviews";
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  margin-right: 5%;
}

#beer-card-details > div > p {
  margin: 0;
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
  /* display: inline; */
}

.description-tag {
  text-decoration: underline;
}

.average-rating {
  text-align: center;
  padding-bottom: 5%;
}
</style>
