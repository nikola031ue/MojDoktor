package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the dijagnoza database table.
 * 
 */
@Entity
@NamedQuery(name="Dijagnoza.findAll", query="SELECT d FROM Dijagnoza d")
public class Dijagnoza implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idDijagnoza;

	private String naziv;

	private String opis;

	//bi-directional many-to-one association to Pregled
	@ManyToOne
	@JoinColumn(name="idPregled")
	private Pregled pregled;

	//bi-directional many-to-one association to Lekdijagnoza
	@OneToMany(mappedBy="dijagnoza")
	private List<Lekdijagnoza> lekdijagnozas;

	//bi-directional many-to-one association to Pacijentdijagnoza
	@OneToMany(mappedBy="dijagnoza")
	private List<Pacijentdijagnoza> pacijentdijagnozas;

	public Dijagnoza() {
	}

	public int getIdDijagnoza() {
		return this.idDijagnoza;
	}

	public void setIdDijagnoza(int idDijagnoza) {
		this.idDijagnoza = idDijagnoza;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public String getOpis() {
		return this.opis;
	}

	public void setOpis(String opis) {
		this.opis = opis;
	}

	public Pregled getPregled() {
		return this.pregled;
	}

	public void setPregled(Pregled pregled) {
		this.pregled = pregled;
	}

	public List<Lekdijagnoza> getLekdijagnozas() {
		return this.lekdijagnozas;
	}

	public void setLekdijagnozas(List<Lekdijagnoza> lekdijagnozas) {
		this.lekdijagnozas = lekdijagnozas;
	}

	public Lekdijagnoza addLekdijagnoza(Lekdijagnoza lekdijagnoza) {
		getLekdijagnozas().add(lekdijagnoza);
		lekdijagnoza.setDijagnoza(this);

		return lekdijagnoza;
	}

	public Lekdijagnoza removeLekdijagnoza(Lekdijagnoza lekdijagnoza) {
		getLekdijagnozas().remove(lekdijagnoza);
		lekdijagnoza.setDijagnoza(null);

		return lekdijagnoza;
	}

	public List<Pacijentdijagnoza> getPacijentdijagnozas() {
		return this.pacijentdijagnozas;
	}

	public void setPacijentdijagnozas(List<Pacijentdijagnoza> pacijentdijagnozas) {
		this.pacijentdijagnozas = pacijentdijagnozas;
	}

	public Pacijentdijagnoza addPacijentdijagnoza(Pacijentdijagnoza pacijentdijagnoza) {
		getPacijentdijagnozas().add(pacijentdijagnoza);
		pacijentdijagnoza.setDijagnoza(this);

		return pacijentdijagnoza;
	}

	public Pacijentdijagnoza removePacijentdijagnoza(Pacijentdijagnoza pacijentdijagnoza) {
		getPacijentdijagnozas().remove(pacijentdijagnoza);
		pacijentdijagnoza.setDijagnoza(null);

		return pacijentdijagnoza;
	}

}