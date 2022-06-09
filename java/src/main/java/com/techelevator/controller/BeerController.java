package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.UserDao;
import com.techelevator.model.Beer;
import com.techelevator.model.BeerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(path = "/beer")
public class BeerController {

    @Autowired
    BeerDao beerDao;

    @Autowired
    BreweryDao breweryDao;

    @Autowired
    UserDao userDao;

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public List<Beer> getBeersByBreweryId(@PathVariable long id) {
        return beerDao.getBeersByBreweryId(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/{id}/addBeer", method = RequestMethod.POST)
    public boolean addBeer(@Valid @PathVariable long id, @RequestBody BeerDTO beerDTO, Principal principal) {
        long breweryId = breweryDao.getBreweryIdByUserName(principal.getName());
        return beerDao.addBeer(id, beerDTO.getName(), beerDTO.getDescription(), beerDTO.getAbv(), beerDTO.getStyle(),
                beerDTO.getImageURL(), beerDTO.getProfile(), beerDTO.isAvailable());
    }

    @RequestMapping(path = "/updateBeer", method = RequestMethod.PUT)
    public boolean updateBeer(@Valid @RequestBody BeerDTO beerDTO, Principal principal) {
        long breweryId = breweryDao.getBreweryIdByUserName(principal.getName());
        return beerDao.updateBeer(beerDTO.getName(), beerDTO.getDescription(), beerDTO.getAbv(), beerDTO.getStyle(),
                beerDTO.getImageURL(), beerDTO.getProfile(), breweryId, beerDTO.isAvailable(), beerDTO.getId());
    }

    @GetMapping(path = "")
    public List<Beer> getSearchedBeers(@Valid @RequestParam String filter, @RequestParam String profile) {
        if(profile != "") {
            return beerDao.getBeersBySearchParameters(filter, profile);
        }
        return beerDao.getBeersBySearchParameters(filter);
    }
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/delete-beer/{id}", method = RequestMethod.DELETE)
    public void deleteBeer(@PathVariable @Valid Long id){
        beerDao.deleteBeer(id);
    }

}
