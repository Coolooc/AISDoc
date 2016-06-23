package ru.coolooc.model;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the zakaz database table.
 * 
 */
@Entity
@NamedQuery(name="Zakaz.findAll", query="SELECT z FROM Zakaz z")
public class Zakaz implements Serializable {
	private static final long serialVersionUID = 1L;

	private Timestamp date;

	@Column(name="id_sotrydnik_oyd")
	private int idSotrydnikOyd;

	@Column(name="nomer_delo")
	private int nomerDelo;

	@Column(name="nomer_fond")
	private int nomerFond;

	@Column(name="nomer_opis")
	private int nomerOpis;

	private int status;

	private String tema;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="vhodnoi_nomer")
	private int vhodnoiNomer;

	@Column(name="zagolovok_dela")
	private String zagolovokDela;

	public Zakaz() {
	}

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getIdSotrydnikOyd() {
		return this.idSotrydnikOyd;
	}

	public void setIdSotrydnikOyd(int idSotrydnikOyd) {
		this.idSotrydnikOyd = idSotrydnikOyd;
	}

	public int getNomerDelo() {
		return this.nomerDelo;
	}

	public void setNomerDelo(int nomerDelo) {
		this.nomerDelo = nomerDelo;
	}

	public int getNomerFond() {
		return this.nomerFond;
	}

	public void setNomerFond(int nomerFond) {
		this.nomerFond = nomerFond;
	}

	public int getNomerOpis() {
		return this.nomerOpis;
	}

	public void setNomerOpis(int nomerOpis) {
		this.nomerOpis = nomerOpis;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTema() {
		return this.tema;
	}

	public void setTema(String tema) {
		this.tema = tema;
	}

	public int getVhodnoiNomer() {
		return this.vhodnoiNomer;
	}

	public void setVhodnoiNomer(int vhodnoiNomer) {
		this.vhodnoiNomer = vhodnoiNomer;
	}

	public String getZagolovokDela() {
		return this.zagolovokDela;
	}

	public void setZagolovokDela(String zagolovokDela) {
		this.zagolovokDela = zagolovokDela;
	}

}