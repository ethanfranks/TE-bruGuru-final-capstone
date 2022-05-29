package com.techelevator.controller;


import com.techelevator.dao.BreweryDao;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin
@RequestMapping(path = "/breweries")
public class BreweryController {

    @Autowired
    BreweryDao breweryDao;

    @RequestMapping(path = "/", method = RequestMethod.GET)
    public List<Brewery> getAllBreweries() {
        return breweryDao.getAllBreweries();
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Brewery getBreweryById(@PathVariable long id){
        return breweryDao.getBreweryByID(id);
    }

}
