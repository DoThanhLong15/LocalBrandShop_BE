/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.components;

import java.time.Duration;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import org.springframework.stereotype.Component;

/**
 *
 * @author LONG
 */
@Component
public class TimeCheckUtil {

    public static boolean isWithinLast24Hours(Date createdDate) {
        LocalDateTime now = LocalDateTime.now();

        LocalDateTime createdDateTime = Instant.ofEpochMilli(createdDate.getTime())
                .atZone(ZoneId.systemDefault())
                .toLocalDateTime();

        Duration duration = Duration.between(createdDateTime, now);
        return duration.toHours() <= 24;
    }
}
