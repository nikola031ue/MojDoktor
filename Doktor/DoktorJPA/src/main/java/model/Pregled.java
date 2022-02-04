package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the pregled database table.
 * 
 */
@Entity
@NamedQuery(name="Pregled.findAll", query="SELECT p FROM Pregled p")
public class Pregled implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPregled;

	@Temporal(TemporalType.TIMESTAMP)
	private Date datumVreme;

	//bi-directional many-to-one association to Dijagnoza
	@OneToMany(mappedBy="pregled")
	private List<Dijagnoza> dijagnozas;

	//bi-directional many-to-one association to Doktor
	@ManyToOne
	@JoinColumn(name="idDoktor")
	private Doktor doktor;

	//bi-directional many-to-one association to Pacijent
	@ManyToOne
	@JoinColumn(name="idPacijent")
	private Pacijent pacijent;

	public Pregled() {
	}

	public int getIdPregled() {
		return this.idPregled;
	}

	public void setIdPregled(int idPregled) {
		this.idPregled = idPregled;
	}

	public Date getDatumVreme() {
		return this.datumVreme;
	}

	public void setDatumVreme(Date datumVreme) {
		this.datumVreme = datumVreme;
	}

	public List<Dijagnoza> getDijagnozas() {
		return this.dijagnozas;
	}

	public void setDijagnozas(List<Dijagnoza> dijagnozas) {
		this.dijagnozas = dijagnozas;
	}

	public Dijagnoza addDijagnoza(Dijagnoza dijagnoza) {
		getDijagnozas().add(dijagnoza);
		dijagnoza.setPregled(this);

		return dijagnoza;
	}

	public Dijagnoza removeDijagnoza(Dijagnoza dijagnoza) {
		getDijagnozas().remove(dijagnoza);
		dijagnoza.setPregled(null);

		return dijagnoza;
	}

	public Doktor getDoktor() {
		return this.doktor;
	}

	public void setDoktor(Doktor doktor) {
		this.doktor = doktor;
	}

	public Pacijent getPacijent() {
		return this.pacijent;
	}

	public void setPacijent(Pacijent pacijent) {
		this.pacijent = pacijent;
	}

}