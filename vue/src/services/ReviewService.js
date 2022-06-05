import axios from "axios";

export default {
    getBeerReviewsById(id) {
        return axios.get(`/reviews/beer/${id}`)
    },
    submitNewBeerReview(review) {
        return axios.post(`/reviews/beer/${review.beerId}`, review)
    }
}