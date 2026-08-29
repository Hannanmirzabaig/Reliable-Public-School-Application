//package com.reliable.school.util;
//
//import java.util.Properties;
//
//import jakarta.mail.Authenticator;
//import jakarta.mail.Message;
//import jakarta.mail.PasswordAuthentication;
//import jakarta.mail.Session;
//import jakarta.mail.Transport;
//import jakarta.mail.internet.InternetAddress;
//import jakarta.mail.internet.MimeMessage;
//
//public class MailUtil {
//
//    public static boolean sendEmail(
//            String to,
//            String subject,
//            String body) {
//
//        String username = System.getenv("MAIL_USERNAME");
//        String password = System.getenv("MAIL_PASSWORD");
//
//        if (username == null || password == null) {
//            System.out.println("Mail environment variables are missing.");
//            return false;
//        }
//
//        Properties props = new Properties();
//
//        props.put("mail.smtp.host", "smtp.gmail.com");
//        props.put("mail.smtp.port", "587");
//        props.put("mail.smtp.auth", "true");
//        props.put("mail.smtp.starttls.enable", "true");
//
//        Session session = Session.getInstance(
//                props,
//                new Authenticator() {
//
//                    @Override
//                    protected PasswordAuthentication getPasswordAuthentication() {
//                        return new PasswordAuthentication(
//                                username,
//                                password
//                        );
//                    }
//                }
//        );
//
//        try {
//            Message message = new MimeMessage(session);
//
//            message.setFrom(new InternetAddress(username));
//
//            message.setRecipients(
//                    Message.RecipientType.TO,
//                    InternetAddress.parse(to)
//            );
//
//            message.setSubject(subject);
//            message.setText(body);
//
//            Transport.send(message);
//
//            System.out.println("Email sent successfully to: " + to);
//
//            return true;
//
//        } catch (Exception e) {
//
//            e.printStackTrace();
//
//            return false;
//        }
//    }
//}