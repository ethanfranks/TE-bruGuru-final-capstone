package com.techelevator.dao;

import com.techelevator.model.BreweryDTO;
import com.techelevator.model.Location;
import com.techelevator.model.Beer;
import com.techelevator.model.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcBreweryDao implements BreweryDao{

    private JdbcTemplate jdbcTemplate;
    private JdbcReviewDao jdbcReviewDao;

    @Autowired
    BreweryDao breweryDao;

    public JdbcBreweryDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
        this.jdbcReviewDao = new JdbcReviewDao(jdbcTemplate);
    }

    @Override
    public List<Brewery> getAllBreweries() {
        List<Brewery> breweries = new ArrayList<>();
        String sql="SELECT * FROM breweries";

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);

        while(rs.next()){

            Brewery brewery = createBreweryFromRow(rs);
            breweries.add(brewery);
        }

        return breweries;
    }

    @Override
    public Brewery getBreweryByID(long id) {
        Brewery brewery = new Brewery();
        String sql="SELECT * FROM breweries WHERE brewery_id= ?";

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);

        if(rs.next()) {
            brewery = createBreweryFromRow(rs);
        }
        return brewery;
    }

    @Override
    public int getBreweryIdByUserName(String name) {
        int breweryId = -1;
        String sql="SELECT b.brewery_id FROM breweries b JOIN users on b.user_id = users.user_id WHERE username = ?;";

        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, name);

        if(rs.next()) {
            breweryId = rs.getInt("brewery_id");
        }

        return breweryId;
    }


    @Override
    public boolean createBrewery(long user_id, String name) {
        String sql = "INSERT INTO breweries (user_id, brewery_name) VALUES (?, ?);";

        return jdbcTemplate.update(sql, user_id, name) == 1;
    }

    @Override
    public Brewery updateBreweryDetails(BreweryDTO updatedBrewery) {
        long breweryId = updatedBrewery.getId();
    if(updatedBrewery.getName()!= null){
        updatedBreweryName(breweryId,updatedBrewery.getName());
    }
        if(updatedBrewery.getEmail()!= null){
            updatedBreweryEmail(breweryId,updatedBrewery.getEmail());
        }
        if(updatedBrewery.getPhoneNumber()!= null){
            updatedBreweryPhone(breweryId,updatedBrewery.getPhoneNumber());
        }
        if(updatedBrewery.getFbLink()!= null){
            updatedBreweryFB(breweryId,updatedBrewery.getFbLink());
        }
        if(updatedBrewery.getIgLink()!= null){
            updatedBreweryIG(breweryId,updatedBrewery.getIgLink());
        }
        if(updatedBrewery.getAboutUs()!= null){
            updatedBreweryAboutUs(breweryId,updatedBrewery.getAboutUs());
        }
        if(updatedBrewery.getImageURL()!= null){
            updatedBreweryImage(breweryId,updatedBrewery.getImageURL());
        }
        if(updatedBrewery.getAddress()!= null){
            updatedBreweryAddress(breweryId,updatedBrewery.getAddress());
        }
        if(updatedBrewery.getGooglePlaceId()!= null){
            updatedBreweryGooglePlaceId(breweryId,updatedBrewery.getGooglePlaceId());
        }
        if(updatedBrewery.getGpsLocation()!= null) {
            updatedBreweryGoogleLongitude(breweryId, updatedBrewery);
            updatedBreweryGoogleLatitude(breweryId, updatedBrewery);
        }
        updatedBreweryHasFood(breweryId,updatedBrewery.isFood());

        return getBreweryByID(updatedBrewery.getId());
    }

    private void updatedBreweryHasFood(long breweryId, boolean food) {
        String sql = "Update breweries Set food_available = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, food, breweryId);

    }

    private void updatedBreweryGooglePlaceId(long breweryId, String googlePlaceId) {
        String sql = "Update breweries Set googlePlaceId = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, googlePlaceId, breweryId);

    }
    private void updatedBreweryGoogleLongitude(long breweryId, BreweryDTO breweryDTO) {
        Location location =breweryDTO.getGpsLocation();
        String sql = "Update breweries Set gps_lng = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, location.getLng(), breweryId);

    }

    private void updatedBreweryGoogleLatitude(long breweryId,  BreweryDTO breweryDTO) {
        Location location =breweryDTO.getGpsLocation();
        String sql = "Update breweries Set gps_lat = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, location.getLat(), breweryId);

    }
    private void updatedBreweryAddress(long breweryId, String address) {
        String sql = "Update breweries Set street_address = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, address, breweryId);

    }

    private void updatedBreweryImage(long breweryId, String imageURL) {
        String sql = "Update breweries Set img_url = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, imageURL, breweryId);

    }

    private void updatedBreweryAboutUs(long breweryId, String aboutUs) {
        String sql = "Update breweries Set about_us = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, aboutUs, breweryId);

    }

    private void updatedBreweryIG(long breweryId, String igLink) {
        String sql = "Update breweries Set ig_link = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, igLink, breweryId);
        
    }

    private void updatedBreweryFB(long breweryId, String fbLink) {
        String sql = "Update breweries Set fb_link = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, fbLink, breweryId);
        
    }

    private void updatedBreweryPhone(long breweryId, String phoneNumber) {
        String sql = "Update breweries Set phone = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, phoneNumber, breweryId);


    }

    private void updatedBreweryEmail(long breweryId, String email) {
        String sql = "Update breweries Set email = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, email, breweryId);

    }

    private void updatedBreweryName(long breweryId, String name) {
        String sql = "Update breweries Set brewery_name = ? Where brewery_id = ? ;";
        jdbcTemplate.update(sql, name, breweryId);
    }


    public Brewery createBreweryFromRow(SqlRowSet rs) {
        Brewery brewery = new Brewery();

        brewery.setId(rs.getLong("user_id"));
        brewery.setBrewery_id(rs.getLong("brewery_id"));
        brewery.setName(rs.getString("brewery_name"));
        brewery.setEmail(rs.getString("email"));
        brewery.setPhoneNumber(rs.getString("phone"));
        brewery.setIgLink(rs.getString("ig_link"));
        brewery.setFbLink(rs.getString("fb_link"));
        brewery.setAboutUs(rs.getString("about_us"));
        brewery.setAddress(rs.getString("street_address"));
        brewery.setImageURL(rs.getString("img_url"));
        brewery.setGpsLocation(createLocation(rs));
        brewery.setGooglePlaceId(rs.getString("googlePlaceId"));
        brewery.setFood(rs.getBoolean("food_available"));
        brewery.setOfferings(getBeerByBrewery(brewery.getId()));
        brewery.setReviews(jdbcReviewDao.getBreweryReviews(brewery.getId()));

        return brewery;
    }

    public Location createLocation(SqlRowSet rs){
        Location location = new Location();
        location.setLat(rs.getDouble("gps_lat"));
        location.setLng(rs.getDouble("gps_lng"));
        return location;
    }

    private List<Beer> getBeerByBrewery(long id) {
        List<Beer> offeringList = new ArrayList<>();

        String sql = "SELECT * FROM beers WHERE brewery_id = ?";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql, id);

        while (rs.next()){
            Beer beer = createBeerFromRow(rs);
            offeringList.add(beer);
        }

        return offeringList;
    }

    private Beer createBeerFromRow(SqlRowSet rs) {
        Beer beer = new Beer();
        beer.setId(rs.getLong("beer_id"));
        beer.setName(rs.getString("beer_name"));
        beer.setDescription(rs.getString("beer_description"));
        beer.setAbv(rs.getDouble("beer_abv"));
        beer.setImageURL(rs.getString("image_url"));
        beer.setStyle(rs.getString("beer_style"));
        beer.setProfile(rs.getString("flavor_profile"));
        beer.setReviews(jdbcReviewDao.getBeerReviews(beer.getId()));

        return beer;
    }


}
