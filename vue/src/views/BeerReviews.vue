<template>
  <div>
      <div id="beer-reviews-page">
        <beer-card id="beer-area">{{beer.name}}</beer-card>
        <beer-review-card id="beer-review" class="beer-review-card" v-for="review in reviews" v-bind:key="review.id" v-bind:review="review"></beer-review-card>
        <div>
        <button @click="toggleReviewForm">Submit a review</button>
        </div>
        <div>
        <form action.prevent v-show="showReviewForm">
            <textarea name="review" id="review-text" cols="30" rows="10" v-model="newReview.reviewBody"></textarea><br>
            <label for="rating">Select rating</label>
            <select name="rating" id="rating-select" v-model="newReview.beerRating">
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
import reviewService from '@/services/ReviewService'
import BeerReviewCard from '../components/BeerReviewCard.vue'
import BeerCard from '../components/BeerCard.vue'


export default {
    data () {
        return {
                showReviewForm : false,
                reviews : [],
                newReview : {
                   userId: this.$store.state.user.id,
                   reviewerUsername: this.$store.state.user.username,
                   beerId: this.$route.params.id,
                   reviewBody: '',
                   beerRating: 1,
                   breweryId: ''
               }

        }
    },
  components: { BeerReviewCard,BeerCard },
 
    created () {
        return reviewService.getBeerReviewsById(this.$route.params.id).then(
            (response) => {
                this.reviews = response.data
            }
        )
    },
    methods: {
        goToAddReview() {
            this.$router.push()
        },
        toggleReviewForm() {
            this.showReviewForm = !this.showReviewForm
        },
        submitNewReview(review) {
            return reviewService.submitNewBeerReview(review).then((response) => {
                if(response == 'true') {
                    window.alert('Review submitted')
                }
                else {
                    window.alert('Something went wrong')
                }
                this.newReview ={
                   userId: this.$store.state.user.id,
                   reviewerUsername: this.$store.state.user.username,
                   beerId: this.$route.params.id,
                   reviewBody: '',
                   beerRating: 1,
                   breweryId: ''
               }
               this.showUpdateForm = false
               return reviewService.getBeerReviewsById(this.$route.params.id).then(
                (response) => {
                this.reviews = response.data
            })                
            })
        }
    }
}
</script>

<style scoped>
#beer-reviews-page {
    display: grid;
    grid-template-areas: 
    "beers reviews"
    "beers reviews";
    grid-template-columns: 1fr 2fr;
    height: 100%;
    width: 100%;
    overflow: hidden;
}
#beer-area {
    
    grid-area: "beers";
}

#beer-review {
    display: flex;
    grid-area: "reviews";
    justify-content: center;
    align-items: center;
    overflow-y: auto;
}


</style>