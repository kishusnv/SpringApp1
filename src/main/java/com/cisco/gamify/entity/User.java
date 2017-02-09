package com.cisco.gamify.entity;

import java.util.Date;

public class User {

    private Integer empId;

    private String firstName;

    private String lastName;

    private String password;
    
    private String email;
    
	private Date createdOn;

    private Date lastLoginOn;

    public User() {
    }

    public User(Integer  empId, String firstName, String lastName, String password) {
        this.empId = empId;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
    }
    public Integer  getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
    public Integer getUserName() {
        return empId;
    }

    public void setUserName(Integer empId) {
        this.empId = empId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedOn() {
        return createdOn;
    }

    public void setCreatedOn(Date createdOn) {
        this.createdOn = createdOn;
    }

    public Date getLastLoginOn() {
        return lastLoginOn;
    }

    public void setLastLoginOn(Date lastLoginOn) {
        this.lastLoginOn = lastLoginOn;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        return empId.equals(user.empId);
    }

    @Override
    public int hashCode() {
        return 13 * empId.hashCode();
    }
}
