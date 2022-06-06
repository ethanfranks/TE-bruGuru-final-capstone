import axios from 'axios';

export default {
    getBeersByBreweryId(breweryId) {
        return axios.get(`/beer/${breweryId}`);
    },
    addNewBeer(newBeer) {
        return axios.post('/beer/addBeer', newBeer);
    },
    updateAvailability(beer) {
        return axios.put('/beer/updateAvailability', beer);
    },
    getBeerBySearch(searchParams) {
        return axios.get(`/beer?filter=${searchParams.style}&profile=${searchParams.profile}`)
    }
}