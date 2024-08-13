package com.dtl.pojo;

import com.dtl.pojo.Cart;
import com.dtl.pojo.OrderDetail;
import com.dtl.pojo.ProductQuantity;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(ProductSize.class)
public class ProductSize_ { 

    public static volatile CollectionAttribute<ProductSize, Cart> cartCollection;
    public static volatile SingularAttribute<ProductSize, String> size;
    public static volatile CollectionAttribute<ProductSize, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<ProductSize, Integer> id;
    public static volatile CollectionAttribute<ProductSize, ProductQuantity> productQuantityCollection;

}