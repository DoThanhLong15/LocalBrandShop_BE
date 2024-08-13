package com.dtl.pojo;

import com.dtl.pojo.OrderDetail;
import com.dtl.pojo.SaleOrderStatus;
import com.dtl.pojo.User;
import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.CollectionAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.7.9.v20210604-rNA", date="2024-08-13T15:40:58")
@StaticMetamodel(SaleOrder.class)
public class SaleOrder_ { 

    public static volatile SingularAttribute<SaleOrder, String> address;
    public static volatile SingularAttribute<SaleOrder, Date> createdDate;
    public static volatile SingularAttribute<SaleOrder, SaleOrderStatus> orderStatusId;
    public static volatile CollectionAttribute<SaleOrder, OrderDetail> orderDetailCollection;
    public static volatile SingularAttribute<SaleOrder, Integer> id;
    public static volatile SingularAttribute<SaleOrder, Date> updatedDate;
    public static volatile SingularAttribute<SaleOrder, User> userId;

}