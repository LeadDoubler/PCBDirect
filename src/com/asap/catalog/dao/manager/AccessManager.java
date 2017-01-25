package com.asap.catalog.dao.manager;

import com.asap.catalog.dao.Specification_Share;
import com.asap.catalog.dao.Specification;
import com.asap.catalog.dao.User;

/**
 * Created by IntelliJ IDEA.
 * User: Gaurav
 * Date: 1 Aug, 2010
 * Time: 12:19:56 AM
 * To change this template use File | Settings | File Templates.
 */
public class AccessManager {
    private Specification_Share share;
    private Specification spec;
    private User user;

    public Specification_Share getShare() {
        return share;
    }

    public void setShare(Specification_Share share) {
        this.share = share;
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
}
