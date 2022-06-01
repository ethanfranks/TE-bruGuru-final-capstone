import axios from 'axios';

export default {

    getBreweries() {
        return axios.get('/breweries/')
    },

    getBreweryById(breweryID) {
        return axios.get(`/breweries/${breweryID}`)

    },

    addBrewery(newBrewery) {
        return axios.post('/breweries/createBrewery', newBrewery)
    },

    // getBeersByBreweryID(breweryId) {
    //     return axios.get(`/breweries/`)
    // }

}