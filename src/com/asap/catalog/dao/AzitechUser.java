package com.asap.catalog.dao;

import com.asap.security.Role;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/** 
 * Represents a person to whom bugs can be assigned.
 *
 * @author Aleksei Sapunov
 */

/*@Entity
@Table (name = "user")*/
//@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class AzitechUser { 
    
    @Id
    @Column (name = "id")
    @GeneratedValue (strategy = GenerationType.AUTO)
    private Long id;
    
    private String acceptMails;
    
    @Column (/*unique = true,*/ nullable = false, updatable = true)
    private String username;
    
    private String firstName;
    
    private String lastName;
    
    @Column (updatable = true)
    private String email;
    
    @Column (nullable = false, updatable = true)
    private String password;
    
    @Column (nullable = false, updatable = true)
    private Role role = Role.GUEST;
    
    private String phone;
    
    private String mobile;
    
    private String street;
    
    private String street2;
    
    private String postalCode;
    
    private String city;
    
    private String currency;
    
    private Integer approved;
    
    private String country;
    
    private String cvr;
    
    private double discount;

    @Column (updatable = true)
    private String delaynotify;

    @Column (updatable = true)
    private String sentinvoiceto;

    // TODO: If it's needs
    //  private String country;
    
    /** Default constructor. */
    public AzitechUser () {
        this.role = Role.USER;
        approved = 0;
    }
    
    /** Constructs a well formed person. */
    public AzitechUser (String username, String password, String first, String last,
            String email) {
        this.username = username;
        this.password = password;
        this.firstName = first;
        this.lastName = last;
        this.email = email;
        this.role = Role.GUEST;
        this.discount = 0;
        approved = 0;
    }
    
    /** Gets the ID of the person.
     * @return id*/
    public Long getId () {
        return id;
    }
    
    /** Sets the ID of the person. */
    public void setId (Long id) {
        this.id = id;
    }
    
    /** Gets the username of the person. */
    public String getUsername () {
        return username;
    }
    
    /** Sets the username of the user. */
    public void setUsername (String username) {
        this.username = username;
    }
    
    /** Gets the first name of the person. */
    public String getFirstName () {
        return firstName;
    }
    
    /** Sets the first name of the user. */
    public void setFirstName (String firstName) {
        this.firstName = firstName;
    }
    
    /** Gets the last name of the person. */
    public String getLastName () {
        return lastName;
    }
    
    /** Sets the last name of the user. */
    public void setLastName (String lastName) {
        this.lastName = lastName;
    }
    
    /** Gets the person's email address. */
    public String getEmail () {
        return email;
    }
    
    /** Sets the person's email address. */
    public void setEmail (String email) {
        this.email = email;
    }
    
    /** Gets the person's unencrypted password. */
    public String getPassword () {
        return password;
    }
    
    public int getPasswordLength() {
        return password.length();
    }
    
    /** Sets the person's unencrypted password. */
    public void setPassword (String password) {
        this.password = password;
    }
    
    /** Equality is determined to be when the ID numbers match. */
    public boolean equals (Object obj) {
        return (obj instanceof AzitechUser) && this.id.equals(((AzitechUser) obj).id);
    }
    
    public Role getRole () {
        return role;
    }
    
    public void setRole (Role role) {
        this.role = role;
    }
    
    public String toString () {
        return String.valueOf(id);
    }
    
    public String getTitle () {
        return username;
    }
    
    public String getFullname (){
        return firstName + " " + lastName;
    }

    public String getPhone () {
        return phone;
    }

    public void setPhone (String phone) {
        this.phone = phone;
    }

    public String getMobile () {
        return mobile;
    }

    public void setMobile (String mobile) {
        this.mobile = mobile;
    }

    public String getStreet () {
        return street;
    }

    public void setStreet (String street) {
        this.street = street;
    }

    public String getStreet2 () {
        return street2;
    }

    public void setStreet2 (String street2) {
        this.street2 = street2;
    }

    public String getPostalCode () {
        return postalCode;
    }

    public void setPostalCode (String postalCode) {
        this.postalCode = postalCode;
    }

    public String getCity () {
        return city;
    }

    public void setCity (String city) {
        this.city = city;
    }
    
    private String cap;

    public String getCap() {
        return cap;
    }

    public void setCap(String cap) {
        this.cap = cap;
    }
    
    public boolean eq(AzitechUser user){
        return this.id.intValue() != user.id.intValue();
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCvr() {
        return cvr;
    }

    public void setCvr(String cvr) {
        this.cvr = cvr;
    }

    public String getAcceptMails() {
        return acceptMails;
    }

    public void setAcceptMails(String acceptMails) {
        this.acceptMails = acceptMails;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public Integer getApproved() {
        return approved;
    }

    public void setApproved(Integer approved) {
        this.approved = approved;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

     public String getSentinvoiceto()
    {
        return sentinvoiceto;
    }

    public void setSentinvoiceto(String sentinvoiceto)
    {
        this.sentinvoiceto = sentinvoiceto;
    }

    public String getDelaynotify()
    {
        return delaynotify;
    }

    public void setDelaynotify(String delaynotify)
    {
        this.delaynotify = delaynotify;
    }
}