package com.reliable.school.service;

import java.util.Properties;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class EmailService {

    /*
     * SMTP configuration
     *
     * IMPORTANT:
     * Email and password environment variables se liye jayenge.
     */

    private static final String SMTP_HOST = "smtp.gmail.com";
    private static final String SMTP_PORT = "587";

    private static final String SMTP_USERNAME =
            System.getenv("MAIL_USERNAME");

    private static final String SMTP_PASSWORD =
            System.getenv("MAIL_PASSWORD");


    // =========================
    // SEND PASSWORD RESET EMAIL
    // =========================

    public static boolean sendPasswordResetEmail(
            String recipientEmail,
            String resetLink) {

        try {

            // TEMPORARY DEBUG CHECK
            System.out.println("MAIL_USERNAME = " + SMTP_USERNAME);
            System.out.println("MAIL_PASSWORD exists = "
                    + (SMTP_PASSWORD != null));
            System.out.println("MAIL_PASSWORD length = "
                    + (SMTP_PASSWORD == null
                    ? 0
                    : SMTP_PASSWORD.length()));


            if (SMTP_USERNAME == null || SMTP_PASSWORD == null) {

                System.out.println(
                    "MAIL_USERNAME or MAIL_PASSWORD environment variable is missing."
                );

                return false;
            }


            // =========================
            // SMTP PROPERTIES
            // =========================

            Properties props = new Properties();

            props.put(
                "mail.smtp.host",
                SMTP_HOST
            );

            props.put(
                "mail.smtp.port",
                SMTP_PORT
            );

            props.put(
                "mail.smtp.auth",
                "true"
            );

            props.put(
                "mail.smtp.starttls.enable",
                "true"
            );


            // =========================
            // CREATE MAIL SESSION
            // =========================

            Session session = Session.getInstance(
                props,
                new Authenticator() {

                    @Override
                    protected PasswordAuthentication
                    getPasswordAuthentication() {

                        return new PasswordAuthentication(
                            SMTP_USERNAME,
                            SMTP_PASSWORD
                        );
                    }
                }
            );


            // =========================
            // CREATE EMAIL
            // =========================

            Message message = new MimeMessage(session);

            message.setFrom(
                new InternetAddress(
                    SMTP_USERNAME,
                    "Reliable Public School"
                )
            );

            message.setRecipients(
                Message.RecipientType.TO,
                InternetAddress.parse(recipientEmail)
            );

            message.setSubject(
                "Password Reset - Reliable Public School"
            );


            String emailBody =
                    "Hello,\n\n"
                    + "We received a request to reset your admin password.\n\n"
                    + "Click the link below to create a new password:\n\n"
                    + resetLink
                    + "\n\n"
                    + "This password reset link is valid for 15 minutes "
                    + "and can be used only once.\n\n"
                    + "If you did not request a password reset, "
                    + "you can safely ignore this email.\n\n"
                    + "Regards,\n"
                    + "Reliable Public School";


            message.setText(emailBody);


            // =========================
            // SEND EMAIL
            // =========================

            Transport.send(message);

            System.out.println(
                "Password reset email sent to: "
                + recipientEmail
            );

            return true;

        } catch (Exception e) {

            e.printStackTrace();

            return false;
        }
    }
}