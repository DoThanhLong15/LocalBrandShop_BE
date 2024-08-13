package com.dtl.pojo;

import com.dtl.pojo.Product;
import com.dtl.pojo.ProductSize;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(ProductQuantity.class)
public class ProductQuantity_ { 

    public static volatile SingularAttribute<ProductQuantity, ProductSize> sizeId;
    public static volatile SingularAttribute<ProductQuantity, Integer> quantity;
    public static volatile SingularAttribute<ProductQuantity, Date> createdDate;
    public static volatile SingularAttribute<ProductQuantity, Product> productId;
    public static volatile SingularAttribute<ProductQuantity, Integer> id;
    public static volatile SingularAttribute<ProductQuantity, Date> updatedDate;

}