package com.asap.catalog.dao;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Gaurav
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "azitechorder_share")
public class AzitechOrder_Share extends Component {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private AzitechOrder order;

    @ManyToOne
    private User user;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date shareDate;

    @Column(length = 1)
    private double accessLevel;

    /*Status=0: Active, Status=1:Inactive*/
    @Column(length = 1)
    private String status;

    @Column(length = 100)
    private String shareComments;

    @Transient
    private double iteration = 0;
    
    public AzitechOrder_Share() {
    }

    public AzitechOrder_Share(User user, double accessLevel, String status, String shareComments, Date shareDate, AzitechOrder order) {
        this.user = user;
        this.accessLevel = accessLevel;
        this.status = status;
        this.shareComments = shareComments;
        this.shareDate = shareDate;
        this.order = order;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public AzitechOrder getOrder() {
        return order;
    }

    public void setOrder(AzitechOrder order) {
        this.order = order;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getShareDate() {
        return shareDate;
    }

    public void setShareDate(Date shareDate) {
        this.shareDate = shareDate;
    }

    public double getAccessLevel() {
        return accessLevel;
    }

    public void setAccessLevel(double accessLevel) {
        this.accessLevel = accessLevel;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getShareComments() {
        return shareComments;
    }

    public void setShareComments(String shareComments) {
        this.shareComments = shareComments;
    }

    public double getIteration() {
        return iteration;
    }

    public void setIteration(double iteration) {
        this.iteration = iteration;
    }

    public void inCreaseIteration() {
        this.iteration++;
    }
}
