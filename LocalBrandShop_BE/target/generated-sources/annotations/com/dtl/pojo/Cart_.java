package com.dtl.pojo;

import com.dtl.pojo.Product;
import com.dtl.pojo.ProductSize;
import com.dtl.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(Cart.class)
public class Cart_ { 

    public static volatile SingularAttribute<Cart, Integer> quantity;
    public static volatile SingularAttribute<Cart, Date> createdDate;
    public static volatile SingularAttribute<Cart, ProductSize> productSizeId;
    public static volatile SingularAttribute<Cart, Product> productId;
    public static volatile SingularAttribute<Cart, Integer> price;
    public static volatile SingularAttribute<Cart, Integer> id;
    public static volatile SingularAttribute<Cart, Date> updatedDate;
    public static volatile SingularAttribute<Cart, User> userId;

}