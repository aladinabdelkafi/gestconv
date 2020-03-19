package tn.iit.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class Users {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idUser")
	private int idUser;

	@Column(name = "fullName")
	private String fullName;

	@Column(name = "login")
	private String login;

	@Column(name = "email")
	private String email;

	@Column(name = "password")
	private String password;

	public Users(int idUser, String fullName, String login, String email, String password) {
		this.idUser = idUser;
		this.fullName = fullName;
		this.login = login;
		this.email = email;
		this.password = password;
	}

	public Users(String fullName, String login, String email, String password) {
		this.fullName = fullName;
		this.login = login;
		this.email = email;
		this.password = password;
	}

	public Users() {
	}

	public int getIdUser() {
		return idUser;
	}

	public void setIdUser(int idUser) {
		this.idUser = idUser;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	
	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	@Override
	public String toString() {
		return "Users [idUser=" + idUser + ", fullName=" + fullName + ", email=" + email + ", password=" + password
				+ "]";
	}

}
