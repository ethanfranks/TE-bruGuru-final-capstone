<template>
  <div>
    <div id="beer-reviews-page">
      <div id="beer-area">
        <h2>{{ beer.name }}</h2>
        <img :src="beer.imageURL" alt="" />
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
        <br />
        <router-link
          v-bind:to="{
            name: 'brewery-details',
            params: { id: beer.breweryId },
          }"
          >Brewery Page</router-link
        >
      </div>

      <div id="reviews-area">
        <div v-if="!isLoggedIn" id="create-account-router">
          <router-link class="account-link" v-bind:to="{ name: 'register' }"
            >Create an account</router-link
          >
          <p> or </p>
          <router-link class="account-link" v-bind:to="{ name: 'login' }"
            >login here</router-link
          >
          to leave a review!
        </div>
        <div v-if="isLoggedIn" id="add-review-container">
          <div>
            <button @click="toggleReviewForm">Leave a Review</button>
          </div>
          <br />
          <form action.prevent v-show="showReviewForm">
            <textarea
              name="review"
              id="review-text"
              cols="30"
              rows="10"
              v-model="newReview.reviewBody"
            ></textarea
            ><br />
            <div id="select-rating-submit">
              <div>
                <label for="rating">Select rating: </label>
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
              </div>
              <button
                id="review-submit-button"
                @click="submitNewReview(newReview)"
              >
                Submit
              </button>
            </div>
          </form>
        </div>

        <div id="reviews-list-container">
          <!-- <div v-if="!reviews.length" id="no-reviews">
            <p>There are currently no reviews for this beer.</p>
            <img src="../assets/bruGuru.svg">
          </div> -->

          <beer-review-card
            id="beer-review"
            class="beer-review-card"
            v-for="review in beer.reviews"
            v-bind:key="review.id"
            v-bind:review="review"
          ></beer-review-card>
        </div>
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
  computed: {
    isLoggedIn() {
      return this.$store.state.user.authorities;
    },
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
        if (response.status == 200) {
          window.alert("Review Submitted!");
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
#no-reviews {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  height: 100%;
}

#no-reviews > img {
  max-width: 25%;
}

#create-account-router {
  text-align: center;
  text-decoration: none;
}

#create-account-router > .account-link {
  text-decoration: none;
}

#create-account-router > p {
  display: inline;
}

#beer-reviews-page {
  font-family: "Nunito Sans", sans-serif;
  display: grid;
  grid-template-areas: "beer reviews";
  grid-template-columns: 1fr 2fr;
  height: 100%;
  width: 100%;
  overflow: hidden;
}

#beer-area {
  align-content: center;
  grid-area: "beer";
  overflow-y: auto;
  max-width: 100%;
  max-height: 100%;
}

#reviews-area {
  overflow-y: auto;
  overflow-x: hidden;
}

#beer-review {
  display: flex;
  flex-direction: column;
  grid-area: "reviews";
  justify-content: center;
  align-items: center;
}

#beer-review-container {
  grid-area: "reviews";
  overflow-y: auto;
}

#add-review-container {
  grid-area: "add-review";
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  max-width: 100%;
  max-height: 100%;
  overflow-y: auto;
}

#reviews-list-container {
  grid-area: "reviews";
  max-width: 100%;
  height: 95%;
}

.characteristic-tag {
  font-weight: bold;
  display: inline;
}

.description-tag {
  font-weight: bold;
  text-decoration: underline;
}

#beer-area > img {
  max-height: 25%;
  width: fit-content;
  justify-content: center;
  display: block;
  margin-left: auto;
  margin-right: auto;
}

#beer-area > h2 {
  margin: 0;
  text-align: center;
}

#select-rating-submit {
  display: flex;
  justify-content: space-between;
}
</style>