import axios from 'axios';

export default {
    getBeersByBreweryId(breweryId) {
        return axios.get(`/beer/${breweryId}`);
    },
    addNewBeer(newBeer) {
        return axios.post(`/beer/${newBeer.breweryId}/addBeer`, newBeer);
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
<<<<<<< HEAD
    getBeerById(id) {
        return axios.get(`/beer/beerById/${id}`)
=======
    deleteBeer(beer_id) {
        return axios.delete(`/beer/update-beer/`, beer_id);
>>>>>>> 10cb37e35318adc1a3cc9c136b18a6072a65be61
    }
}