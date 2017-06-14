/*
 * Specification.java
 *
 * Created on 21. oktober 2007, 18:07
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.catalog.dao;

import javax.persistence.*;

/**
 * @author JRO
 */
@Entity
@Table(name = "quote")
public class Qoute extends Component {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private Specification specification;

    @ManyToOne
    private User user;

    private double quantity;
    private String transport;
    private double total;
    private double days;
    private double workingDays;
    private double freight;
    private double weight;
    private Double tooling;
    double unitPrice = 0;
    private double version;
    private Boolean createdFromTemplate;

    @Transient
    private boolean freez = false;


    public Qoute() {
    }

    public Long getId() {
        return id;
    }

    public Long getQouteId() {
        return id + 100000;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Specification getSpecification() {
        return specification;
    }

    public void setSpecification(Specification specification) {
        this.specification = specification;
    }

    public double getQuantity() {
        return quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public String getTransport() {
        return transport;
    }

    public void setTransport(String transport) {
        this.transport = transport;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getDays() {
        return days;
    }

    public void setDays(double days) {
        this.days = days;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getFreight() {
        return freight;
    }

    public void setFreight(double freight) {
        this.freight = freight;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Double getTooling() {
        return tooling;
    }

    public void setTooling(Double tooling) {
        this.tooling = tooling;
    }

    public double getWorkingDays() {
        return workingDays;
    }

    public void setWorkingDays(double workingDays) {
        this.workingDays = workingDays;
    }

    public boolean isFreez() {
        return freez;
    }

    public void setFreez(boolean freez) {
        this.freez = freez;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public double getVersion() {
        return version;
    }

    public void setVersion(double version) {
        this.version = version;
    }

    /**
     * @return the createdFromTemplate
     */
    public Boolean getCreatedFromTemplate() {
        return createdFromTemplate;
    }

    /**
     * @param createdFromTemplate the createdFromTemplate to set
     */
    public void setCreatedFromTemplate(Boolean createdFromTemplate) {
        this.createdFromTemplate = createdFromTemplate;
    }
}
