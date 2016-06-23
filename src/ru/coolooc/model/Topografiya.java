package ru.coolooc.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the topografiya database table.
 * 
 */
@Entity
@NamedQuery(name="Topografiya.findAll", query="SELECT t FROM Topografiya t")
public class Topografiya implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name="nomer_dela")
	private int nomerDela;

	@Column(name="nomer_etaj")
	private int nomerEtaj;

	@Column(name="nomer_fond")
	private int nomerFond;

	@Column(name="nomer_hranilishe")
	private int nomerHranilishe;

	@Column(name="nomer_opis")
	private int nomerOpis;

	@Column(name="nomer_polka")
	private int nomerPolka;

	@Column(name="nomer_stellaj")
	private int nomerStellaj;
	
	@Column(name="zagolovok_dela")
	private String zagolovokDela;
	
	@Column(name="nazvanie_fonda")
	private String nazvanieFonda;

	public Topografiya() {
	}
	
	public String getZagolovokDela() {
		return this.zagolovokDela;
	}

	public void setZagolovokDela(String zagolovokDela) {
		this.zagolovokDela = zagolovokDela;
	}
	
	public String getNazvanieFonda() {
		return this.nazvanieFonda;
	}

	public void setNazvanieFonda(String nazvanieFonda) {
		this.nazvanieFonda = nazvanieFonda;
	}
	
	public int getNomerDela() {
		return this.nomerDela;
	}

	public void setNomerDela(int nomerDela) {
		this.nomerDela = nomerDela;		
	}

	public int getNomerEtaj() {
		return this.nomerEtaj;
	}

	public void setNomerEtaj(int nomerEtaj) {
		this.nomerEtaj = nomerEtaj;
	}

	public int getNomerFond() {
		return this.nomerFond;
	}

	public void setNomerFond(int nomerFond) {
		this.nomerFond = nomerFond;
	}

	public int getNomerHranilishe() {
		return this.nomerHranilishe;
	}

	public void setNomerHranilishe(int nomerHranilishe) {
		this.nomerHranilishe = nomerHranilishe;
	}

	public int getNomerOpis() {
		return this.nomerOpis;
	}

	public void setNomerOpis(int nomerOpis) {
		this.nomerOpis = nomerOpis;
	}

	public int getNomerPolka() {
		return this.nomerPolka;
	}

	public void setNomerPolka(int nomerPolka) {
		this.nomerPolka = nomerPolka;
	}

	public int getNomerStellaj() {
		return this.nomerStellaj;
	}

	public void setNomerStellaj(int nomerStellaj) {
		this.nomerStellaj = nomerStellaj;
	}

}