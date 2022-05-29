import axios from 'axios';

export default {

    getBreweries() {
        return axios.get('/breweries/')
    },

    getBreweryById(breweryID) {
        return axios.get(`/breweries/${breweryID}`)

    },
    getBreweryCoords(address) {
        return axios.get("https://maps.googleapis.com/maps/api/geocode/json?address="+address+'&key='+'AIzaSyBwEN5W_3SgcAVL-hJJZQHBe1upWvQoO8w')
    }

}