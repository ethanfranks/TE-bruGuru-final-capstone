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
    getBeerById(id) {
        return axios.get(`/beer/beerById/${id}`)
    },
    deleteBeer(beer_id) {
        return axios.delete(`/beer/delete-beer/${beer_id}`);
    }
}