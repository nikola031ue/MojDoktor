package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the pacijent database table.
 * 
 */
@Entity
@NamedQuery(name="Pacijent.findAll", query="SELECT p FROM Pacijent p")
public class Pacijent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPacijent;

	@Temporal(TemporalType.DATE)
	private Date datumRodjenja;

	private String ime;

	private String prezime;

	//bi-directional many-to-one association to Korisnik
	@OneToMany(mappedBy="pacijent")
	private List<Korisnik> korisniks;

	//bi-directional many-to-one association to Pacijentdijagnoza
	@OneToMany(mappedBy="pacijent")
	private List<Pacijentdijagnoza> pacijentdijagnozas;

	//bi-directional many-to-one association to Pregled
	@OneToMany(mappedBy="pacijent")
	private List<Pregled> pregleds;

	public Pacijent() {
	}

	public int getIdPacijent() {
		return this.idPacijent;
	}

	public void setIdPacijent(int idPacijent) {
		this.idPacijent = idPacijent;
	}

	public Date getDatumRodjenja() {
		return this.datumRodjenja;
	}

	public void setDatumRodjenja(Date datumRodjenja) {
		this.datumRodjenja = datumRodjenja;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public String getPrezime() {
		return this.prezime;
	}

	public void setPrezime(String prezime) {
		this.prezime = prezime;
	}

	public List<Korisnik> getKorisniks() {
		return this.korisniks;
	}

	public void setKorisniks(List<Korisnik> korisniks) {
		this.korisniks = korisniks;
	}

	public Korisnik addKorisnik(Korisnik korisnik) {
		getKorisniks().add(korisnik);
		korisnik.setPacijent(this);

		return korisnik;
	}

	public Korisnik removeKorisnik(Korisnik korisnik) {
		getKorisniks().remove(korisnik);
		korisnik.setPacijent(null);

		return korisnik;
	}

	public List<Pacijentdijagnoza> getPacijentdijagnozas() {
		return this.pacijentdijagnozas;
	}

	public void setPacijentdijagnozas(List<Pacijentdijagnoza> pacijentdijagnozas) {
		this.pacijentdijagnozas = pacijentdijagnozas;
	}

	public Pacijentdijagnoza addPacijentdijagnoza(Pacijentdijagnoza pacijentdijagnoza) {
		getPacijentdijagnozas().add(pacijentdijagnoza);
		pacijentdijagnoza.setPacijent(this);

		return pacijentdijagnoza;
	}

	public Pacijentdijagnoza removePacijentdijagnoza(Pacijentdijagnoza pacijentdijagnoza) {
		getPacijentdijagnozas().remove(pacijentdijagnoza);
		pacijentdijagnoza.setPacijent(null);

		return pacijentdijagnoza;
	}

	public List<Pregled> getPregleds() {
		return this.pregleds;
	}

	public void setPregleds(List<Pregled> pregleds) {
		this.pregleds = pregleds;
	}

	public Pregled addPregled(Pregled pregled) {
		getPregleds().add(pregled);
		pregled.setPacijent(this);

		return pregled;
	}

	public Pregled removePregled(Pregled pregled) {
		getPregleds().remove(pregled);
		pregled.setPacijent(null);

		return pregled;
	}

}