package com.techelevator.controller;

import com.techelevator.dao.BeerDao;
import com.techelevator.model.Beer;
import com.techelevator.model.BeerDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(path = "/beer")
public class BeerController {

    private Principal principal;

    @Autowired
    BeerDao beerDao;

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public List<Beer> getBeersByBreweryId(@PathVariable long id) {
        return beerDao.getBeersByBreweryId(id);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path = "/addBeer", method = RequestMethod.POST)
    public boolean addBeer(@Valid @RequestBody BeerDTO beerDTO) {
        return beerDao.addBeer(beerDTO.getName(), beerDTO.getDescription(), beerDTO.getAbv(), beerDTO.getStyle(),
                beerDTO.getImageURL(), beerDTO.getProfile(), beerDTO.getBreweryId());
    }
}
