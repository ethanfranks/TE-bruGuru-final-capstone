<template>
  <div>
    <beer-review-card v-for="review in reviews" v-bind:key="review.id" v-bind:review="review"></beer-review-card>
    <div>
    <button>Submit a review</button>
    </div>
    <div>
        <form action.prevent>
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
    {{newReview}}
  </div>
</template> 

<script>
import reviewService from '@/services/ReviewService'
import BeerReviewCard from '../components/BeerReviewCard.vue'


export default {
    data () {
        return {
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
  components: { BeerReviewCard },
 
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
               return reviewService.getBeerReviewsById(this.$route.params.id).then(
                (response) => {
                this.reviews = response.data
            })                
            })
        }
    }
}
</script>

<style>

</style>