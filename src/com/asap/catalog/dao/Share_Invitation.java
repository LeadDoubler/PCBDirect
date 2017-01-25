package com.asap.catalog.dao;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: Gaurav
 * Date: 1 Aug, 2010
 * Time: 3:59:18 PM
 * To change this template use File | Settings | File Templates.
 */
@Entity
@Table(name = "share_invitation")
public class Share_Invitation extends Component {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(length = 1)
    private String type; //type=0:Quote, type=1:Order

    private Long invitationCode;

    private Long docId;

    private double accessLevel;

    @ManyToOne
    private User userFrom;

    private String invEmail;

    @Temporal(value = TemporalType.TIMESTAMP)
    private Date invDate;

    @Column(length = 1)
    private String isActive; //isActive=Y or N

    @Column(length = 100)
    private String invComments;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getInvitationCode() {
        return invitationCode;
    }

    public void setInvitationCode(Long invitationCode) {
        this.invitationCode = invitationCode;
    }

    public Long getDocId() {
        return docId;
    }

    public void setDocId(Long docId) {
        this.docId = docId;
    }

    public User getUserFrom() {
        return userFrom;
    }

    public void setUserFrom(User userFrom) {
        this.userFrom = userFrom;
    }

    public String getInvEmail() {
        return invEmail;
    }

    public void setInvEmail(String invEmail) {
        this.invEmail = invEmail;
    }

    public Date getInvDate() {
        return invDate;
    }

    public void setInvDate(Date invDate) {
        this.invDate = invDate;
    }

    public String getActive() {
        return isActive;
    }

    public void setActive(String active) {
        isActive = active;
    }

    public double getAccessLevel() {
        return accessLevel;
    }

    public void setAccessLevel(double accessLevel) {
        this.accessLevel = accessLevel;
    }

    public String getInvComments() {
        return invComments;
    }

    public void setInvComments(String invComments) {
        this.invComments = invComments;
    }
}
