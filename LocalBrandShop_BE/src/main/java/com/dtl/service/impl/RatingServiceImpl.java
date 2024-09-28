/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.service.impl;

import com.dtl.pojo.Rating;
import com.dtl.repository.RatingRepository;
import com.dtl.service.RatingService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LONG
 */
@Service
public class RatingServiceImpl implements RatingService {

    @Autowired
    private RatingRepository ratingRepo;

    @Override
    public List<Rating> getRatingList(Map<String, String> params, Integer page, Integer pageSize) {
        return this.ratingRepo.getRatingList(params, page, pageSize);
    }

    @Override
    public Rating getRatingById(Integer ratingId) {
        return this.ratingRepo.getRatingById(ratingId);
    }

    @Override
    public void saveRating(Rating rating) {
        this.ratingRepo.saveRating(rating);
    }

    @Override
    public void deleteRating(Rating rating) {
        this.ratingRepo.deleteRating(rating);
    }

    @Override
    public void deleteRating(Integer ratingId) {
        this.ratingRepo.deleteRating(ratingId);
    }

    @Override
    public long countRatings(Map<String, String> params) {
        return this.ratingRepo.countRatings(params);
    }
}
