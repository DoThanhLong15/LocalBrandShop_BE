/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dtl.service;

import com.dtl.pojo.Rating;
import java.util.List;
import java.util.Map;

/**
 *
 * @author LONG
 */
public interface RatingService {

    List<Rating> getRatingList(Map<String, String> params, Integer page, Integer pageSize);

    Rating getRatingById(Integer ratingId);

    void saveRating(Rating rating);

    void deleteRating(Rating rating);

    void deleteRating(Integer ratingId);

    long countRatings(Map<String, String> params);
}
