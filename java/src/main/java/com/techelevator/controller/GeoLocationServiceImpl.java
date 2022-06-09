package com.techelevator.controller;

import com.google.maps.GeoApiContext;
import com.google.maps.GeocodingApi;
import com.google.maps.PlacesApi;
import com.google.maps.errors.ApiException;
import com.google.maps.model.GeocodingResult;
import com.google.maps.model.PlacesSearchResponse;
import com.techelevator.model.BreweryDTO;
import com.techelevator.model.Location;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class GeoLocationServiceImpl {

    private GeoApiContext geoApiContext; //1

    @Autowired
    public GeoLocationServiceImpl(@Value("${gmaps.api.key}") String apiKey) {
        geoApiContext = new GeoApiContext.Builder().apiKey(apiKey)
                .maxRetries(2)
                .connectTimeout(10L, TimeUnit.SECONDS)
                .build();
    }


    public BreweryDTO computeGeoLocation(BreweryDTO geoLocation) { //2
        final PlacesSearchResponse placesSearchResponse;
        try {
            placesSearchResponse = PlacesApi.textSearchQuery(geoApiContext,
                    geoLocation.getAddress()).await();
//            log.info("Processing address line using PlacesApi.textSearchQuery {}", geoLocation.getAddress());
            if (placesSearchResponse != null && placesSearchResponse.results.length > 0) {
//                log.info("Obtained following predictions using PlacesApi.textSearchQuery {}",
//                        Arrays.toString(placesSearchResponse.results));
                final GeocodingResult[] geocodingResults = GeocodingApi.newRequest(geoApiContext)
                        .place(placesSearchResponse.results[0].placeId)
                        .await();
//                log.info("Processing address line using GeocodingApi.newRequest {}", geoLocation.getAddress());
                if (geocodingResults != null && geocodingResults.length > 0) {
//                    log.info("Obtained following geocoding results using GeocodingApi.newRequest {}",
//                            Arrays.toString(geocodingResults));
                    geoLocation.setGooglePlaceId(geocodingResults[0].placeId);
                    final double latitude = geocodingResults[0].geometry.location.lat;
                    final double longitude = geocodingResults[0].geometry.location.lng;
                   geoLocation.setGpsLocation(new Location(latitude, longitude));
//                    log.info("Computed following coordinates using GeocodingApi.newRequest {}", geoLocation);
                    return geoLocation;
                } else {
//                    log.warn("No coordinates found using GeocodingApi.newRequest {}", geoLocation.getAddress());
                }
            } else {
//                log.warn("No coordinates found using PlacesApi.textSearchQuery {}", geoLocation.getAddress());
            }
        } catch (ApiException | InterruptedException | IOException e) {
//            log.error("Encountered error [{}] using GoogleMapsApi for address {} : {}", e.getMessage(), geoLocation.getAddress(), e);
        }

        return null;
    }
}

