/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.asap.catalog.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Jonas
 */
@Entity
public class ProductTemplate extends Component {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String title;
    private Double price;
    private Double totalPrintSize;

    @Type(type = "text")
    private String description;
    @ManyToOne
    private Specification specification;
    private Boolean published;
    
    private String transport;
    private Double productionDays;

    @Lob
    @Column(name = "theFile", length = 5097152)
    private byte[] theFile;

    private String fileContent;

    /**
     * @return the id
     */
    public Long getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the price
     */
    public Double getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(Double price) {
        this.price = price;
    }

    /**
     * @return the totalPrintSize
     */
    public Double getTotalPrintSize() {
        return totalPrintSize;
    }

    /**
     * @param totalPrintSize the totalPrintSize to set
     */
    public void setTotalPrintSize(Double totalPrintSize) {
        this.totalPrintSize = totalPrintSize;
    }

    /**
     * @return the specification
     */
    public Specification getSpecification() {
        return specification;
    }

    /**
     * @param specification the specification to set
     */
    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    /**
     * @return the published
     */
    public Boolean getPublished() {
        return published;
    }

    /**
     * @param published the published to set
     */
    public void setPublished(Boolean published) {
        this.published = published;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the theFile
     */
    public byte[] getTheFile() {
        return theFile;
    }

    /**
     * @param theFile the theFile to set
     */
    public void setTheFile(byte[] theFile) {
        this.theFile = theFile;
    }

    /**
     * @return the fileContent
     */
    public String getFileContent() {
        return fileContent;
    }

    /**
     * @param fileContent the fileContent to set
     */
    public void setFileContent(String fileContent) {
        this.fileContent = fileContent;
    }

    /**
     * @return the transport
     */
    public String getTransport() {
        return transport;
    }

    /**
     * @param transport the transport to set
     */
    public void setTransport(String transport) {
        this.transport = transport;
    }

    /**
     * @return the productionDays
     */
    public Double getProductionDays() {
        return productionDays;
    }

    /**
     * @param productionDays the productionDays to set
     */
    public void setProductionDays(Double productionDays) {
        this.productionDays = productionDays;
    }
}
