import axios from 'axios';

export default {

    getBreweries() {
        return axios.get('/breweries/')
    },

    getBreweryById(breweryID) {
        return axios.get(`/breweries/${breweryID}`)

    },

}