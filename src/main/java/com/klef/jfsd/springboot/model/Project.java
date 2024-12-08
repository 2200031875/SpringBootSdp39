package com.klef.jfsd.springboot.model;


import java.util.Date;
import java.util.List;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="project_table")
public class Project 
{
	@Id
	@Column(name="project_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="project_title",nullable=false,length=50)
	private String title;
	@Column(name="project_description",nullable = false,length = 500)
	private String description;
	/*
	 * @Column(name="project_status",nullable = false) private String status;
	 */
	@Column(name = "start_date", nullable = false)
    private Date startDate;
    @Column(name = "end_date", nullable = false)
    private Date endDate;
	@Column(name="project_link",nullable=true)
	private String link;
	
	
	@ManyToOne
	@JoinColumn(name="student_id",nullable=false)
	private Student student;
	
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
	/*
	 * public String getStatus() { return status; } public void setStatus(String
	 * status) { this.status = status; }
	 */
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}

	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}

	
	@ManyToOne
	@JoinColumn(name = "mentor_id", nullable = false)
	private Mentor mentor;

	
	public Mentor getMentor() {
	    return mentor;
	}

	public void setMentor(Mentor mentor) {
	    this.mentor = mentor;
	}

	 @Column(name="project_completed", nullable=false)
	    private boolean completed;

	public boolean isCompleted() {
		return completed;
	}
	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	

	 

}
