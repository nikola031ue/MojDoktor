package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the lek database table.
 * 
 */
@Entity
@NamedQuery(name="Lek.findAll", query="SELECT l FROM Lek l")
public class Lek implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLek;

	private String naziv;

	//bi-directional many-to-one association to Lekdijagnoza
	@OneToMany(mappedBy="lek")
	private List<Lekdijagnoza> lekdijagnozas;

	public Lek() {
	}

	public int getIdLek() {
		return this.idLek;
	}

	public void setIdLek(int idLek) {
		this.idLek = idLek;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public List<Lekdijagnoza> getLekdijagnozas() {
		return this.lekdijagnozas;
	}

	public void setLekdijagnozas(List<Lekdijagnoza> lekdijagnozas) {
		this.lekdijagnozas = lekdijagnozas;
	}

	public Lekdijagnoza addLekdijagnoza(Lekdijagnoza lekdijagnoza) {
		getLekdijagnozas().add(lekdijagnoza);
		lekdijagnoza.setLek(this);

		return lekdijagnoza;
	}

	public Lekdijagnoza removeLekdijagnoza(Lekdijagnoza lekdijagnoza) {
		getLekdijagnozas().remove(lekdijagnoza);
		lekdijagnoza.setLek(null);

		return lekdijagnoza;
	}

}