package ru.coolooc.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the testusers database table.
 * 
 */
@Entity
@Table(name="testusers")
@NamedQueries({
	@NamedQuery(name="TestUser.findAll", query="SELECT t FROM TestUser t"),
	@NamedQuery(name="TestUser.findByName",query="SELECT t FROM TestUser t WHERE t.login = :login")
}) 
public class TestUser implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String login;

	private String password;

	public TestUser() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}