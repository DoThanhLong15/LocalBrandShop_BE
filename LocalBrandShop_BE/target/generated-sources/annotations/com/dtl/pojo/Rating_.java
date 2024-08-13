package com.dtl.pojo;

import com.dtl.pojo.Product;
import com.dtl.pojo.User;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(Rating.class)
public class Rating_ { 

    public static volatile SingularAttribute<Rating, Date> createdDate;
    public static volatile SingularAttribute<Rating, Product> productId;
    public static volatile SingularAttribute<Rating, BigDecimal> rating;
    public static volatile SingularAttribute<Rating, Integer> id;
    public static volatile SingularAttribute<Rating, Date> updatedDate;
    public static volatile SingularAttribute<Rating, User> userId;
    public static volatile SingularAttribute<Rating, String> content;

}