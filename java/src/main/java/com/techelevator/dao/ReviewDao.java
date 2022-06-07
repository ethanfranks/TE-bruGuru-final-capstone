package com.techelevator.dao;

import com.techelevator.model.BeerReview;
import com.techelevator.model.BeerReviewDTO;
import com.techelevator.model.BreweryReview;

import java.util.List;

public interface ReviewDao {

    List<BeerReview> getBeerReviews(long id);

    List<BreweryReview> getBreweryReviews(long id);

    boolean postNewBeerReview(BeerReviewDTO beerReviewDTO);
}
