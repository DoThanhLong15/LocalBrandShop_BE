package com.dtl.pojo;

import com.dtl.pojo.Cart;
import com.dtl.pojo.Category;
import com.dtl.pojo.FavouriteProduct;
import com.dtl.pojo.OrderDetail;
import com.dtl.pojo.ProductImage;
import com.dtl.pojo.ProductQuantity;
import com.dtl.pojo.Rating;
import java.math.BigDecimal;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(Product.class)
public class Product_ { 

    public static volatile CollectionAttribute<Product, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<Product, BigDecimal> rating;
    public static volatile SingularAttribute<Product, String> description;
    public static volatile SingularAttribute<Product, Date> updatedDate;
    public static volatile SingularAttribute<Product, Integer> ratingCount;
    public static volatile CollectionAttribute<Product, Rating> ratingCollection;
    public static volatile CollectionAttribute<Product, FavouriteProduct> favouriteProductCollection;
    public static volatile CollectionAttribute<Product, ProductQuantity> productQuantityCollection;
    public static volatile CollectionAttribute<Product, Cart> cartCollection;
    public static volatile SingularAttribute<Product, Date> createdDate;
    public static volatile SingularAttribute<Product, Integer> price;
    public static volatile SingularAttribute<Product, String> name;
    public static volatile CollectionAttribute<Product, ProductImage> productImageCollection;
    public static volatile SingularAttribute<Product, Integer> id;
    public static volatile SingularAttribute<Product, Category> categoryId;

}