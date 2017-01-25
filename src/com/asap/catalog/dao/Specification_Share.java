package com.asap.catalog.dao;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Gaurav
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "specification_share")
public class Specification_Share extends Component {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne
    private Specification spec;

    @ManyToOne
    private User user;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date shareDate;

    /*Status=0: Edit&Order, Status=1: View&Order, Status=2: ViewOnly*/
    private double accessLevel;

    /*Status=1: Active, Status=0:Inactive*/
    @Column(length = 1)
    private String status;

    @Column(length = 100)
    private String shareComments;

    @Transient
    private double iteration = 0;

    public Specification_Share() {
    }

    public Specification_Share(User user, double accessLevel, String status, String shareComments, Date shareDate, Specification spec) {
        this.user = user;
        this.accessLevel = accessLevel;
        this.status = status;
        this.shareComments = shareComments;
        this.shareDate = shareDate;
        this.spec = spec;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Specification getSpec() {
        return spec;
    }

    public void setSpec(Specification spec) {
        this.spec = spec;
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

    public int getAccessLevelSTR() {
        return Double.valueOf(accessLevel).intValue();
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
