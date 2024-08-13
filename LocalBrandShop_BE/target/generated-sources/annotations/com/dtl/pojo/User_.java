package com.dtl.pojo;

import com.dtl.pojo.Cart;
import com.dtl.pojo.FavouriteProduct;
import com.dtl.pojo.Rating;
import com.dtl.pojo.SaleOrder;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(User.class)
public class User_ { 

    public static volatile SingularAttribute<User, String> lastName;
    public static volatile CollectionAttribute<User, SaleOrder> saleOrderCollection;
    public static volatile SingularAttribute<User, String> address;
    public static volatile SingularAttribute<User, String> role;
    public static volatile SingularAttribute<User, Boolean> active;
    public static volatile SingularAttribute<User, Date> updatedDate;
    public static volatile CollectionAttribute<User, Rating> ratingCollection;
    public static volatile CollectionAttribute<User, FavouriteProduct> favouriteProductCollection;
    public static volatile CollectionAttribute<User, Cart> cartCollection;
    public static volatile SingularAttribute<User, String> firstName;
    public static volatile SingularAttribute<User, String> password;
    public static volatile SingularAttribute<User, Date> createdDate;
    public static volatile SingularAttribute<User, String> phone;
    public static volatile SingularAttribute<User, Integer> id;
    public static volatile SingularAttribute<User, String> email;
    public static volatile SingularAttribute<User, String> username;

}