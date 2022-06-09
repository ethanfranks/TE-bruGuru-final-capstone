<template>
  <div>
    <div id="beer-reviews-page">
      <div id="beer-area">
        <h2>{{ beer.name }}</h2>
        <div id="beer-card-details">
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
        </div>
      </div>
      <beer-review-card
        id="beer-review"
        class="beer-review-card"
        v-for="review in beer.reviews"
        v-bind:key="review.id"
        v-bind:review="review"
      ></beer-review-card>
      <div>
        <button @click="toggleReviewForm">Submit a review</button>
      </div>
      <div>
        <form action.prevent v-show="showReviewForm">
          <textarea
            name="review"
            id="review-text"
            cols="30"
            rows="10"
            v-model="newReview.reviewBody"
          ></textarea
          ><br />
          <label for="rating">Select rating</label>
          <select
            name="rating"
            id="rating-select"
            v-model="newReview.beerRating"
          >
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
          </select>
          <button @click="submitNewReview(newReview)">Submit</button>
        </form>
      </div>
    </div>
  </div>
</template> 

<script>
import reviewService from "@/services/ReviewService";
import BeerReviewCard from "../components/BeerReviewCard.vue";
import BeerService from "../services/BeerService";

export default {
  data() {
    return {
      showReviewForm: false,
      beer: {},
      newReview: {
        userId: this.$store.state.user.id,
        reviewerUsername: this.$store.state.user.username,
        beerId: this.$route.params.id,
        reviewBody: "",
        beerRating: 1,
        breweryId: "",
      },
    };
  },
  components: { BeerReviewCard },

  created() {
    return BeerService.getBeerById(this.$route.params.id).then((response) => {
      this.beer = response.data;
    });
  },
  methods: {
    goToAddReview() {
      this.$router.push();
    },
    toggleReviewForm() {
      this.showReviewForm = !this.showReviewForm;
    },
    submitNewReview(review) {
      return reviewService.submitNewBeerReview(review).then((response) => {
        if (response == "true") {
          window.alert("Review submitted");
        } else {
          window.alert("Something went wrong");
        }
        this.newReview = {
          userId: this.$store.state.user.id,
          reviewerUsername: this.$store.state.user.username,
          beerId: this.$route.params.id,
          reviewBody: "",
          beerRating: 1,
          breweryId: "",
        };
        this.showUpdateForm = false;
        return reviewService
          .getBeerReviewsById(this.$route.params.id)
          .then((response) => {
            this.reviews = response.data;
          });
      });
    },
  },
};
</script>

<style scoped>
#beer-reviews-page {
  display: grid;
  grid-template-areas:
    "beer reviews"
    "beer reviews";
  grid-template-columns: 1fr 2fr;
  height: 100%;
  width: 100%;
  overflow: hidden;
}
#beer-area {
align-content: center;
  grid-area: "beer";
}
#beer-area > p {
    text-transform: bold;
}

#beer-review {
    display: flex;
    flex-direction: column;
  grid-area: "reviews";
  justify-content: center;
  align-items: center;
  overflow-y: auto;
}

</style>