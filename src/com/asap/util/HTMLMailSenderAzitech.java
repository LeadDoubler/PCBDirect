/*
 * HTMLMailUtil.java
 *
 * Created on 19 Blob 2007 �., 17:04
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.asap.util;

import au.id.jericho.lib.html.HTMLElementName;
import au.id.jericho.lib.html.OutputDocument;
import au.id.jericho.lib.html.Source;
import au.id.jericho.lib.html.StartTag;
import com.asap.configuration.Configuration;
import freemarker.template.Template;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.URLDataSource;
import javax.mail.*;
import javax.mail.internet.*;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.net.URL;
import java.util.*;

/**
 * 
 * @author asapunov
 */
public class HTMLMailSenderAzitech {
	private Template template;

	private Map dataModel;

	private String subject;

	private InternetAddress fromAddress;

	private InternetAddress toAddress;

	private String messageText;

	private String headerFile = "header.ftl";

	private String footerFile = "footer.ftl";

	public HTMLMailSenderAzitech() {
		super();
	}

	public void setTemplate(Template template) {
		this.template = template;
	}

	public void setDataModel(Map dataModel) {
		this.dataModel = dataModel;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setFromAddress(InternetAddress fromAddress) {
		this.fromAddress = fromAddress;
	}

	public void setToAddress(InternetAddress toAddress) {
		this.toAddress = toAddress;
	}

	public void setFromAddress(String fromAddress) throws AddressException {
		this.fromAddress = new InternetAddress(fromAddress);
	}

	public void setToAddress(String toAddress) throws AddressException {
		this.toAddress = new InternetAddress(toAddress);
	}

	public void setMessageText(String messageText) {
		this.messageText = messageText;
	}

    public void sendMail()
    {
        try
        {
            Properties props = System.getProperties();
            props.setProperty("mail.transport.protocol", "smtp");

            props.put("mail.smtp.host", "mail.authsmtp.com");                //massmail2.scannet.dk
            props.put("mail.smtp.auth","true");

            String lsUserName = Configuration.getInstance().getProps().getProperty("muser");
            String lsPwd = Configuration.getInstance().getProps().getProperty("mpwd");
            String lsMailSMTPlocalhost = Configuration.getInstance().getProps().getProperty("msmtplhost");
            if (lsUserName != null || lsUserName.length() > 0) props.put("mail.smtp.username", lsUserName);
            if (lsPwd != null || lsPwd.length() > 0) props.put("mail.smtp.password", lsPwd);
            if (lsMailSMTPlocalhost != null || lsMailSMTPlocalhost.length() > 0) props.put("mail.smtp.localhost", lsMailSMTPlocalhost);

            String smtp = Configuration.getInstance().getProps().getProperty("smtp");
            if (smtp == null || smtp.length() == 0)
            {
                smtp = "localhost";
            }
            props.put("mail.smtp.host", smtp);
            String port = Configuration.getInstance().getProps().getProperty("port");
            if (port != null || port.length() > 0) props.put("mail.smtp.port", port);
            System.out.println("MailString:"+ smtp + " - " + lsUserName + " - " + lsPwd + " - " + port + " - " + lsMailSMTPlocalhost);
            Session mailSession = Session.getDefaultInstance(props, null);

            //Session mailSession = prepareSMTPSession();
            mailSession.setDebug(true);

            MimeMessage message = new MimeMessage(mailSession);
            message.setSubject(subject);
            message.setFrom(getFromAddress());
            message.addRecipient(Message.RecipientType.TO, toAddress);
            message.setSentDate(new Date());
            createMessage(message, mailSession.getTransport());
        }
        catch (NoSuchProviderException ex)
        {
            ex.printStackTrace();
        }
        catch (IOException ex)
        {
            ex.printStackTrace();
        }
        catch (MessagingException ex)
        {
            ex.printStackTrace();
        }
        catch (Exception ex)
        {
            ex.printStackTrace();
        }
    }

	private Session prepareSMTPSession() throws Exception {
		//try {
                Properties props = System.getProperties();
		props.put("mail.smtp.host", "localhost");
		Session session = Session.getDefaultInstance(props, null);
                return session;
                /*
			Properties props = new Properties();
			props.setProperty("mail.transport.protocol", "smtp");
                        String smtp = Configuration.getInstance().getProps().getProperty("smtp");
                        if (smtp == null || smtp.length()==0){
                            smtp = "localhost";
                        }
			props.setProperty("mail.smtp.host", smtp);
                        System.out.println("smtp server = "+smtp);
			//props.put("mail.smtp.localhost", InetAddress.getLocalHost().getHostName());

			return Session.getDefaultInstance(props, null);
                 **/
		/*} catch (UnknownHostException e) {
			// TODO: Override Exception
                 * 
                 * 
                 * 
			throw new Exception("Exception occured");
		}*/
	}

	private void createMessage(Message message, Transport transport)
			throws MessagingException, IOException, Exception {
		if (template != null) {
                    System.out.println("Sending mail using template");
			dataModel.put("headerFile", headerFile);
			dataModel.put("footerFile", footerFile);
			// resolve result of Template
			Writer writer = new StringWriter();
			String val = template.getOutputEncoding();
			template.setEncoding("Cp1252");
			template.setOutputEncoding("Cp1252");
//            template.setTimeZone(TimeZone.getTimeZone("Europe/Copenhagen"));
			template.process(dataModel, writer);
			messageText = replaceDanishLetters(writer.toString());
		}
                System.out.println("Sending mail using HTML");
		sendHTMLMessage(transport, message);
	}

	public static String replaceDanishLetters(String html) {
		html = html.replaceAll("�", "&aring;");
		html = html.replaceAll("�", "&Aring;");
		html = html.replaceAll("�", "&oslash;");
		html = html.replaceAll("�", "&Oslash;");
		html = html.replaceAll("�", "&aelig;");
		html = html.replaceAll("�", "&AElig;");
		return html;
	}

	private void sendHTMLMessage(final Transport transport,
			final Message message) throws Exception, MessagingException {
		MimeMultipart multipart = resolveImages(messageText);
		message.setContent(multipart);
//		transport.connect();
		transport.connect("mail.authsmtp.com","ac45632","kbww5hhtz");
		transport.sendMessage(message, message
				.getRecipients(Message.RecipientType.TO));
		transport.close();
	}

	private MimeMultipart resolveImages(String result)
			throws MessagingException, Exception {
		MimeMultipart multipart = new MimeMultipart("related");
		Map<String, String> map = process(result, multipart);
		for (String name : map.keySet()) {
			String value = map.get(name);
			MimeBodyPart messageBodyPartWithIMG = new MimeBodyPart();
//			List<String> contentLanguage = new ArrayList<String>();
//			contentLanguage.add("da");
//			messageBodyPartWithIMG
//					.setContentLanguage((String[]) contentLanguage.toArray());
			URL url = new URL(value);
			if (url == null)
				continue;
			DataSource fds = new URLDataSource(url);
			messageBodyPartWithIMG.setDataHandler(new DataHandler(fds));
			messageBodyPartWithIMG.setHeader("Content-ID", "<" + name + ">");
			messageBodyPartWithIMG.setHeader("Content-Language", "da");
			messageBodyPartWithIMG.setHeader("Content-Type",
					"text/html; charset=Cp1252");

			multipart.addBodyPart(messageBodyPartWithIMG);
		}
		return multipart;
	}

	private Map<String, String> process(String string, MimeMultipart multipart)
			throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		int index = 0;
		Source source = new Source(string);
		source.setLogWriter(new OutputStreamWriter(System.out));
		source.fullSequentialParse();
		OutputDocument outputDocument = new OutputDocument(source);
		List startTags = source.findAllStartTags(HTMLElementName.IMG);
		for (Iterator i = startTags.iterator(); i.hasNext();) {
			StartTag imageElement = (StartTag) i.next();
			String src = imageElement.getAttributeValue("src");
			if (src == null)
				continue;
			String pictureName = "image" + index++;
			String htmlText = "<img src=\"cid:" + pictureName + "\">";
			outputDocument.replace(imageElement, htmlText);
			map.put(pictureName, src);
		}
		addhtmlToMail(multipart, outputDocument);
		return map;
	}

	private void addhtmlToMail(MimeMultipart multipart,
			OutputDocument outputDocument) throws IOException,
			MessagingException {
		BodyPart messageBodyPart = new MimeBodyPart();
		Writer writer = new StringWriter();
		outputDocument.writeTo(writer);
		String result = writer.toString();
		messageBodyPart.setContent(result, "text/html");
		messageBodyPart.setHeader("Content-Language", "da");
		messageBodyPart.setHeader("Content-Type", "text/html; charset=Cp1252");
		multipart.addBodyPart(messageBodyPart);
	}

	public void setFooterFile(String footerFile) {
		this.footerFile = footerFile;
	}

	public void setHeaderFile(String headerFile) {
		this.headerFile = headerFile;
	}

    public InternetAddress getFromAddress() {
        return fromAddress;
    }

}
