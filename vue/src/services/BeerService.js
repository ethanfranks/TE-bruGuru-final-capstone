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
    },
    updateBeer(beer) {
        return axios.put(`/beer/updateBeer`, beer);
    },
    deleteBeer(beer) {
        return axios.delete(`/beer/update-beer/`, beer);
    }
}