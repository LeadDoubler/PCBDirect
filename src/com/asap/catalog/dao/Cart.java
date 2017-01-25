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
 *
 * @author JRO
 */
@Entity
@Table(name = "cart")
public class Cart extends Component {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
        
    public Cart(){
    }

    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
}
