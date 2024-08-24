/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.pojo;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UpdateTimestamp;

/**
 *
 * @author LONG
 */
@Entity
@Table(name = "product_quantity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProductQuantity.findAll", query = "SELECT p FROM ProductQuantity p"),
    @NamedQuery(name = "ProductQuantity.findById", query = "SELECT p FROM ProductQuantity p WHERE p.id = :id"),
    @NamedQuery(name = "ProductQuantity.findByQuantity", query = "SELECT p FROM ProductQuantity p WHERE p.quantity = :quantity"),
    @NamedQuery(name = "ProductQuantity.findByCreatedDate", query = "SELECT p FROM ProductQuantity p WHERE p.createdDate = :createdDate"),
    @NamedQuery(name = "ProductQuantity.findByUpdatedDate", query = "SELECT p FROM ProductQuantity p WHERE p.updatedDate = :updatedDate")})
@DynamicInsert
@DynamicUpdate
public class ProductQuantity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Column(name = "quantity")
    private int quantity;
    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @UpdateTimestamp
    @Column(name = "updated_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private Product productId;
    @JoinColumn(name = "size_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private ProductSize sizeId;

    public ProductQuantity() {
    }

    public ProductQuantity(Integer id) {
        this.id = id;
    }

    public ProductQuantity(Integer id, int quantity) {
        this.id = id;
        this.quantity = quantity;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Date getUpdatedDate() {
        return updatedDate;
    }

    public void setUpdatedDate(Date updatedDate) {
        this.updatedDate = updatedDate;
    }

    public Product getProductId() {
        return productId;
    }

    public void setProductId(Product productId) {
        this.productId = productId;
    }

    public ProductSize getSizeId() {
        return sizeId;
    }

    public void setSizeId(ProductSize sizeId) {
        this.sizeId = sizeId;
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
        if (!(object instanceof ProductQuantity)) {
            return false;
        }
        ProductQuantity other = (ProductQuantity) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dtl.pojo.ProductQuantity[ id=" + id + " ]";
    }
    
}
