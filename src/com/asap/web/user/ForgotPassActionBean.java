package com.asap.web.user;


import com.asap.catalog.dao.User;
import com.asap.configuration.Configuration;
import com.asap.web.CatalogActionBean;
import net.sourceforge.stripes.action.*;
import net.sourceforge.stripes.validation.*;
import org.hibernate.criterion.Restrictions;
import org.mortena.mail.Email;

/**
 * @author Jens Rosenberg
 */
@UrlBinding("/user/passwordReminder.action")
public class ForgotPassActionBean extends CatalogActionBean /** ValidationErrorHandler*/
{
    @Validate(required = true, converter = EmailTypeConverter.class)
    private String email;

    private User user;

    @DontValidate
    public Resolution send() {

        User foundUser = (User) getSession().createCriteria(User.class).add(Restrictions.eq("email", email)).uniqueResult();
        if (foundUser == null) {
            return new StreamingResolution("text/html", "<br/><font class=\"contenterror\" style=\"margin: 5px 5px;\">Email does not exists!</font>");
        } else {
            try {
                user = foundUser;
                System.out.println(" ---------- ForgotPassword mail is about to send..");
                Email email = new Email();
                email.setTemplateName("sendpass");
                email.setProperty("user", user);
                email.setProperty("website", Configuration.getInstance().getProps().getProperty("url"));
                email.setTo(user.getEmail());
                email.setFrom("pcb-direct@azitech.dk");
                email.setSubject("Password for PCB-direct");
                String lsUserName = Configuration.getInstance().getProps().getProperty("muser");
                String lsPwd = Configuration.getInstance().getProps().getProperty("mpwd");
                String smtp = Configuration.getInstance().getProps().getProperty("smtp");
                System.out.println("MailString:" + smtp + " - " + lsUserName + " - " + lsPwd);
                email.send();
                return new StreamingResolution("text/html", "<br/><font class=\"contenterror\" style=\"margin: 5px 5px;\">An email has been sent to: " + user.getEmail() + " with the password.</font>");
            }
            catch (Exception ex) {
                ex.printStackTrace();
                return new StreamingResolution("text/html", "<br/><font class=\"contenterror\" style=\"margin: 5px 5px;\">Internal error!</font>");
            }
        }
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @DefaultHandler
    @DontValidate
    public Resolution forgotEmail() {
        return new ForwardResolution("/user/forgotpass.jsp");
    }

    @ValidationMethod
    public void handleValidationErrors(ValidationErrors errors) throws Exception {
        User foundUser = (User) getSession().createCriteria(User.class).add(Restrictions.eq("email", email)).uniqueResult();
        if (foundUser == null) {
            errors.add("email", new LocalizableError("emailDoesNotExist"));
        } else {
            user = foundUser;
        }
    }
}
