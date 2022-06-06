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

    updateBrewery(updatedBrewery){
        return axios.put(`breweries/${updatedBrewery.id}`, updatedBrewery)
    },

    getBreweryByUsername() {
        return axios.get(`breweries/getBrewery`)
    }

    /* Using for update beer functionality. Added by Ethan. */
    // getBreweryIdByCurrentUser() {
    //     return axios.get('/breweries/username');
    // }


}