package com.dtl.pojo;

import com.dtl.pojo.SaleOrder;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(SaleOrderStatus.class)
public class SaleOrderStatus_ { 

    public static volatile CollectionAttribute<SaleOrderStatus, SaleOrder> saleOrderCollection;
    public static volatile SingularAttribute<SaleOrderStatus, Integer> id;
    public static volatile SingularAttribute<SaleOrderStatus, String> status;

}