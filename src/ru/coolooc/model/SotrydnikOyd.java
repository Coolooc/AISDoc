package ru.coolooc.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sotrydnik_oyd database table.
 * 
 */
@Entity
@Table(name="sotrydnik_oyd")
@NamedQuery(name="SotrydnikOyd.findAll", query="SELECT s FROM SotrydnikOyd s")
public class SotrydnikOyd implements Serializable {
	private static final long serialVersionUID = 1L;

	private String doljnost;

	private String familiya;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_sotrydnik_oyd")
	private int idSotrydnikOyd;

	private String imya;

	private String login;

	private String otchestvo;

	private String password;

	public SotrydnikOyd() {
	}

	public String getDoljnost() {
		return this.doljnost;
	}

	public void setDoljnost(String doljnost) {
		this.doljnost = doljnost;
	}

	public String getFamiliya() {
		return this.familiya;
	}

	public void setFamiliya(String familiya) {
		this.familiya = familiya;
	}

	public int getIdSotrydnikOyd() {
		return this.idSotrydnikOyd;
	}

	public void setIdSotrydnikOyd(int idSotrydnikOyd) {
		this.idSotrydnikOyd = idSotrydnikOyd;
	}

	public String getImya() {
		return this.imya;
	}

	public void setImya(String imya) {
		this.imya = imya;
	}

	public String getLogin() {
		return this.login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getOtchestvo() {
		return this.otchestvo;
	}

	public void setOtchestvo(String otchestvo) {
		this.otchestvo = otchestvo;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}