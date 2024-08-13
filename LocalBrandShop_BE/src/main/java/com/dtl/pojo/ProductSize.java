/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.pojo;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author LONG
 */
@Entity
@Table(name = "product_size")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductSize.findAll", query = "SELECT p FROM ProductSize p"),
    @NamedQuery(name = "ProductSize.findById", query = "SELECT p FROM ProductSize p WHERE p.id = :id"),
    @NamedQuery(name = "ProductSize.findBySize", query = "SELECT p FROM ProductSize p WHERE p.size = :size")})
public class ProductSize implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "size")
    private String size;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productSizeId")
    private Collection<OrderDetail> orderDetailCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productSizeId")
    private Collection<Cart> cartCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "sizeId")
    private Collection<ProductQuantity> productQuantityCollection;

    public ProductSize() {
    }

    public ProductSize(Integer id) {
        this.id = id;
    }

    public ProductSize(Integer id, String size) {
        this.id = id;
        this.size = size;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    @XmlTransient
    public Collection<OrderDetail> getOrderDetailCollection() {
        return orderDetailCollection;
    }

    public void setOrderDetailCollection(Collection<OrderDetail> orderDetailCollection) {
        this.orderDetailCollection = orderDetailCollection;
    }

    @XmlTransient
    public Collection<Cart> getCartCollection() {
        return cartCollection;
    }

    public void setCartCollection(Collection<Cart> cartCollection) {
        this.cartCollection = cartCollection;
    }

    @XmlTransient
    public Collection<ProductQuantity> getProductQuantityCollection() {
        return productQuantityCollection;
    }

    public void setProductQuantityCollection(Collection<ProductQuantity> productQuantityCollection) {
        this.productQuantityCollection = productQuantityCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProductSize)) {
            return false;
        }
        ProductSize other = (ProductSize) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dtl.pojo.ProductSize[ id=" + id + " ]";
    }
    
}
