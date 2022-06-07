package com.techelevator.controller;


import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import com.techelevator.model.BreweryDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;


@RestController
@CrossOrigin
@RequestMapping(path = "/breweries")
public class BreweryController {

    private Principal principal;

    @Autowired
    //Google API service. Handles Geolocation of new Breweries
    GeoLocationServiceImpl geoLocationService = new GeoLocationServiceImpl("${gmaps.api.key}");

    @Autowired
    BreweryDao breweryDao;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public List<Brewery> getAllBreweries() {
        return breweryDao.getAllBreweries();
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@Valid @PathVariable long id){
        return breweryDao.getBreweryByID(id);
    }

    @RequestMapping(path = "/getBrewery", method = RequestMethod.GET)
    public Brewery getBreweryByUsername(@Valid Principal principal){
        return breweryDao.getBreweryByID(breweryDao.getBreweryIdByUserName(principal.getName()));
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public Brewery updateBreweryDetails(@Valid @PathVariable String id, @RequestBody BreweryDTO breweryDTO){
        System.out.println(breweryDTO);
        if(breweryDTO.getGpsLocation() == null) {
            BreweryDTO locatedBrewery = geoLocationService.computeGeoLocation(breweryDTO);
            return breweryDao.updateBreweryDetails(breweryDTO);
        }
        System.out.println(breweryDTO.getGpsLocation());
        return breweryDao.updateBreweryDetails(breweryDTO);

    }

    // Changed the addNewBrewery method to return a boolean instead of a Brewery object
    // Added Principal to take care of the authentication aspect
    // Added @Valid annotation to make sure the variable annotations in our DTO are active
    // Added @ResponseStatus annotation but not totally sure when and where we will need it
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping(path="/createBrewery", method = RequestMethod.POST)
    public boolean addNewBrewery(@Valid @RequestBody BreweryDTO breweryDTO){
        return breweryDao.createBrewery(breweryDTO.getBrewer_id(), breweryDTO.getName());
    }

    @RequestMapping(path = "/username", method = RequestMethod.GET)
    public long getBreweryIdByUsername(Principal principal) {
        String username = principal.getName();
        return breweryDao.getBreweryIdByUserName(username);
    }

}
