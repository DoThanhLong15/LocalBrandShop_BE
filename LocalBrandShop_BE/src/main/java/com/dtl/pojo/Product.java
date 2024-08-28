/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dtl.pojo;

import com.dtl.dataTranferObj.ProductQuantityForm;
import com.dtl.validations.annotation.ProductImageRequired;
import com.dtl.validations.annotation.ProductQuantityRequired;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author LONG
 */
@Entity
@Table(name = "product")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p"),
    @NamedQuery(name = "Product.findById", query = "SELECT p FROM Product p WHERE p.id = :id"),
    @NamedQuery(name = "Product.findByName", query = "SELECT p FROM Product p WHERE p.name = :name"),
    @NamedQuery(name = "Product.findByCreatedDate", query = "SELECT p FROM Product p WHERE p.createdDate = :createdDate"),
    @NamedQuery(name = "Product.findByUpdatedDate", query = "SELECT p FROM Product p WHERE p.updatedDate = :updatedDate"),
    @NamedQuery(name = "Product.findByPrice", query = "SELECT p FROM Product p WHERE p.price = :price"),
    @NamedQuery(name = "Product.findByRating", query = "SELECT p FROM Product p WHERE p.rating = :rating"),
    @NamedQuery(name = "Product.findByRatingCount", query = "SELECT p FROM Product p WHERE p.ratingCount = :ratingCount")})
@DynamicInsert
@DynamicUpdate
@ProductImageRequired(message = "{product.image.notNull.errMsg}")
@ProductQuantityRequired(message = "{product.quantity.notNull.errMsg}")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "{product.name.notNull.errMsg}")
    @Size(min = 1, max = 50, message = "{product.name.size.errMsg}")
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @Size(min = 1, max = 65535, message = "{product.description.notNull.errMsg}")
    @Column(name = "description")
    private String description;
    @CreationTimestamp
    @Column(name = "created_date", updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @UpdateTimestamp
    @Column(name = "updated_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date updatedDate;
    @Basic(optional = false)
    @NotNull(message = "{product.price.notNull.errMsg}")
    @Column(name = "price")
    @Min(value = 1000, message = "{product.price.min.errMsg}")
    private int price;
    // @Max(value=?)  
    @Column(name = "rating")
    private BigDecimal rating;
    @Column(name = "rating_count")
    private Integer ratingCount;
    @JoinColumn(name = "category_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @NotNull(message = "{product.cateId.notNull.errMsg}")
    private Category categoryId;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId", orphanRemoval = true)
    private List<ProductImage> productImageCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<Rating> ratingCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<FavouriteProduct> favouriteProductCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<OrderDetail> orderDetailCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private Collection<Cart> cartCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId", orphanRemoval = true)
    private List<ProductQuantity> productQuantityCollection;
    
    @Transient
    private List<ProductQuantityForm> productQuantityForms;
    @Transient
    private List<MultipartFile> files;

    public Product() {
    }

    public Product(Integer id) {
        this.id = id;
    }

    public Product(Integer id, String name, String description, int price) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public BigDecimal getRating() {
        return rating;
    }

    public void setRating(BigDecimal rating) {
        this.rating = rating;
    }

    public Integer getRatingCount() {
        return ratingCount;
    }

    public void setRatingCount(Integer ratingCount) {
        this.ratingCount = ratingCount;
    }

    public Category getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Category categoryId) {
        this.categoryId = categoryId;
    }

    @XmlTransient
    public List<ProductImage> getProductImageCollection() {
        return productImageCollection;
    }

    public void setProductImageCollection(List<ProductImage> productImageCollection) {
        this.productImageCollection = productImageCollection;
    }

    @XmlTransient
    public Collection<Rating> getRatingCollection() {
        return ratingCollection;
    }

    public void setRatingCollection(Collection<Rating> ratingCollection) {
        this.ratingCollection = ratingCollection;
    }

    @XmlTransient
    public Collection<FavouriteProduct> getFavouriteProductCollection() {
        return favouriteProductCollection;
    }

    public void setFavouriteProductCollection(Collection<FavouriteProduct> favouriteProductCollection) {
        this.favouriteProductCollection = favouriteProductCollection;
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
    public List<ProductQuantity> getProductQuantityCollection() {
        return productQuantityCollection;
    }

    public void setProductQuantityCollection(List<ProductQuantity> productQuantityCollection) {
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
        if (!(object instanceof Product)) {
            return false;
        }
        Product other = (Product) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.dtl.pojo.Product[ id=" + id + " ]";
    }

    /**
     * @return the files
     */
    public List<MultipartFile> getFiles() {
        return files;
    }

    /**
     * @param files the files to set
     */
    public void setFiles(List<MultipartFile> files) {
        this.files = files;
    }

    /**
     * @return the productQuantityForms
     */
    public List<ProductQuantityForm> getProductQuantityForms() {
        return productQuantityForms;
    }

    /**
     * @param productQuantityForms the productQuantityForms to set
     */
    public void setProductQuantityForms(List<ProductQuantityForm> productQuantityForms) {
        this.productQuantityForms = productQuantityForms;
    }

}
