package com.techelevator.dao;

import com.techelevator.model.BeerReview;
import com.techelevator.model.BreweryReview;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcReviewDao implements ReviewDao{

    private JdbcTemplate jdbcTemplate;

    public JdbcReviewDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }


    @Override
    public List<BeerReview> getBeerReviews(long id) {
        List<BeerReview> reviews = new ArrayList<>();

        String sql = "SELECT * FROM beer_reviews JOIN users ON beer_reviews.user_id = users.user_id WHERE beer_id = ?";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);

        while (rs.next()) {
            BeerReview review = createBeerReviewFromRow(rs);
            reviews.add(review);
        }

        return reviews;
    }

    @Override
    public List<BreweryReview> getBreweryReviews(long id) {
        List<BreweryReview> reviews = new ArrayList<>();

        String sql = "SELECT * FROM brewery_reviews JOIN users ON brewery_reviews.user_id = users.user_id WHERE brewery_id =?";

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql,id);

        while (rs.next()) {
            BreweryReview review = createBreweryReviewFromRow(rs);
            reviews.add(review);
        }

        return reviews;
    }

    private BreweryReview createBreweryReviewFromRow(SqlRowSet rs) {
        BreweryReview review = new BreweryReview();
        review.setBreweryId(rs.getLong("brewery_id"));
        review.setRating(rs.getInt("brewery_rating"));
        review.setReview(rs.getString("brewery_review"));
        review.setUserId(rs.getLong("user_id"));
        review.setReviewerUsername(rs.getString("username"));

        return review;
    }


    private BeerReview createBeerReviewFromRow(SqlRowSet rs) {
        BeerReview review = new BeerReview();
        review.setBeerId(rs.getLong("beer_id"));
        review.setUserId(rs.getLong("user_id"));
        review.setBeerRating(rs.getInt("beer_rating"));
        review.setReviewerUsername(rs.getString("username"));

        return review;
    }
}
