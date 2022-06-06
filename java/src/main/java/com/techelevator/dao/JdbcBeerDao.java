package com.techelevator.dao;

import com.techelevator.model.Beer;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBeerDao implements BeerDao{

    private JdbcTemplate jdbcTemplate;
    private JdbcReviewDao jdbcReviewDao;

    public JdbcBeerDao(JdbcTemplate jdbcTemplate, JdbcReviewDao jdbcReviewDao) {
        this.jdbcTemplate = jdbcTemplate;
        this.jdbcReviewDao = jdbcReviewDao;
    }

    @Override
    public List<Beer> getBeersByBreweryId(long id) {
        List<Beer> beers = new ArrayList<>();
        String sql = "SELECT * FROM beers " +
                        "WHERE brewery_id = ?;";

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);

        while (rs.next()) {
            Beer beer = createBeerFromRow(rs);
            beers.add(beer);
        }

        return beers;
    }

    @Override
    public boolean addBeer(String name, String description, double abv, String style,
                            String imgURL, String profile, long breweryId, boolean isAvailable) {

        String sql = "INSERT INTO beers (beer_name, beer_description, beer_abv, " +
                        "beer_style, image_url, flavor_profile, brewery_id, beer_available) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?);";

        return jdbcTemplate.update(sql, name, description, abv, style, imgURL, profile, breweryId, isAvailable) == 1;
    }

    @Override
    public boolean updateBeer(String name, String description, double abv, String style, String imgURL, String profile, long breweryId, boolean isAvailable, long beerId) {

        String sql = "UPDATE beers SET beer_name = ?, beer_description = ?, beer_abv = ?, beer_style = ?, " +
                "image_url = ?, flavor_profile = ?, brewery_id = ?, beer_available = ? WHERE beer_id = ?;";

        return jdbcTemplate.update(sql, name, description, abv, style, imgURL,profile, breweryId, isAvailable, beerId) == 1;
    }

    public Beer createBeerFromRow(SqlRowSet rs) {
        Beer beer = new Beer();

        beer.setId(rs.getLong("beer_id"));
        beer.setBreweryId(rs.getLong("brewery_id"));
        beer.setAbv(rs.getDouble("beer_abv"));
        beer.setDescription(rs.getString("beer_description"));
        beer.setName(rs.getString("beer_name"));
        beer.setStyle(rs.getString("beer_style"));
        beer.setProfile(rs.getString("flavor_profile"));
        beer.setImageURL(rs.getString("image_url"));
        beer.setReviews(jdbcReviewDao.getBeerReviews(beer.getId()));
        beer.setAverageRating();

        return beer;
    }
}
