package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the specijalizacija database table.
 * 
 */
@Entity
@NamedQuery(name="Specijalizacija.findAll", query="SELECT s FROM Specijalizacija s")
public class Specijalizacija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idSpecijalizacija;

	private String naziv;

	//bi-directional many-to-one association to Doktor
	@OneToMany(mappedBy="specijalizacija")
	private List<Doktor> doktors;

	public Specijalizacija() {
	}

	public int getIdSpecijalizacija() {
		return this.idSpecijalizacija;
	}

	public void setIdSpecijalizacija(int idSpecijalizacija) {
		this.idSpecijalizacija = idSpecijalizacija;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Doktor> getDoktors() {
		return this.doktors;
	}

	public void setDoktors(List<Doktor> doktors) {
		this.doktors = doktors;
	}

	public Doktor addDoktor(Doktor doktor) {
		getDoktors().add(doktor);
		doktor.setSpecijalizacija(this);

		return doktor;
	}

	public Doktor removeDoktor(Doktor doktor) {
		getDoktors().remove(doktor);
		doktor.setSpecijalizacija(null);

		return doktor;
	}

}