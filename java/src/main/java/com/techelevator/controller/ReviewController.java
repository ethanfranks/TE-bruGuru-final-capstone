package com.techelevator.controller;


import com.techelevator.dao.BreweryDao;
import com.techelevator.dao.ReviewDao;
import com.techelevator.model.BeerReview;
import com.techelevator.model.BeerReviewDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin
@RestController
@RequestMapping(path = "/reviews")
public class ReviewController {

    @Autowired
    ReviewDao reviewDao;
    @Autowired
    BreweryDao breweryDao;

    //This returns individual beer reviews in list form. --Dave
    @GetMapping(path = "/beer/{id}")
    public List<BeerReview> getBeerReviewsById(@PathVariable long id) {
        return reviewDao.getBeerReviews(id);
    }

    @PostMapping(path = "/beer/{id}")
    public boolean postNewBeerReview(@PathVariable long id, @RequestBody BeerReviewDTO beerReviewDTO) {
        beerReviewDTO.setBreweryId(breweryDao.getBreweryByBeerId(beerReviewDTO.getBeerId()));
        if(reviewDao.postNewBeerReview(beerReviewDTO)) {
            return true;
        }
        return false;

    }
}
