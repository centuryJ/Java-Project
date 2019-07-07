package com.oracle.entity;
public class Users {
    private Integer id;
    private String username;
    private String password;
    private String realname;
    public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public Users() {
        super();
    }
    public Users(Integer id,String username,String password) {
        super();
        this.id = id;
        this.username = username;
        this.password = password;
    }
    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return this.username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
