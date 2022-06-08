<template>
  <div>
    
    <h3 class="beer-name">{{ beer.name }}</h3>

    <div id="beer-card-grid-container">
      <div class="beer-img"><img :src="beer.imageURL" /></div>

      <div id="beer-card-details">
        <div class="beer-style"><p class="characteristic-tag">Type: </p>{{ beer.style }}</div>
        <div class="beer-abv"><p class="characteristic-tag">ABV: </p>{{ beer.abv }}</div>
        <div class="flavor-profile"><p class="characteristic-tag">Flavor Profile: </p>{{ beer.profile }}</div>
        <div class="description-tag">Description</div>
        <div class="beer-description">{{ beer.description }}</div>
      </div>

      <div id="beer-card-reviews">
        <div class= "average-rating">Average Rating: {{beer.averageRating}} / 5</div>
        <button @click="goToReviews" class = "viewAllReviews">View All Reviews</button>
      </div>
    </div>

  </div>
</template>

<script>
export default {
  name: "beer-card",
  props: ["beer"],
  components: {
  },
  methods: {
    isBrewer() {
      for (let i = 0; i < this.permissions.length; i++) {
        if (this.permissions[i].name == "ROLE_BREWER") {
          return true;
        }
      }
    },
      goToReviews(){
        this.$router.push({name: 'beer-review-list', params: {id: `${this.beer.id}`}})
  }
  }
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
  grid-area: "name";
  margin: 0;
}

#beer-card-grid-container {
  display: grid;
  grid-template-areas: "img info reviews";
}

.beer-img > img {
  grid-area: "img";
  max-height: 20%;
}

#beer-card-details {
  grid-area: "details";
}

#beer-card-reviews {
  grid-area: "reviews";
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
</style>