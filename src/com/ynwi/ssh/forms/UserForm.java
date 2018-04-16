package com.ynwi.ssh.forms;  
  
public class UserForm {  
  
    @Override
	public String toString() {
		return "UserForm [userId=" + userId + ", username=" + username
				+ ", realName=" + realName + ", password=" + password
				+ ", gender=" + gender + ", emailAddress=" + emailAddress
				+ ", address=" + address + ", tel=" + tel + "]";
	}

    private int userId;
	private String username;
	private String realName;
	private String password;
	private int gender;
	private String emailAddress;
	private String address;
	private String tel;  
  
    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getUsername() {  
        return username;  
    }  
  
    public void setUsername(String username) {  
        this.username = username;  
    }  
  
    public String getPassword() {  
        return password;  
    }  
  
    public void setPassword(String password) {  
        this.password = password;  
    }  
  
    public int getGender() {  
        return gender;  
    }  
  
    public void setGender(int gender) {  
        this.gender = gender;  
    }  
  
}  