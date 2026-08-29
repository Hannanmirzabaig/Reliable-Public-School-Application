package com.reliable.school.model;

public class Notice {

    private int id;
    private String title;
    private String description;
    private String noticeDate;

    public Notice() {
    }

    public Notice(int id, String title, String description, String noticeDate) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.noticeDate = noticeDate;
    }

    public Notice(String title, String description, String noticeDate) {
        this.title = title;
        this.description = description;
        this.noticeDate = noticeDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNoticeDate() {
        return noticeDate;
    }

    public void setNoticeDate(String noticeDate) {
        this.noticeDate = noticeDate;
    }
}