package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pacijentdijagnoza database table.
 * 
 */
@Entity
@NamedQuery(name="Pacijentdijagnoza.findAll", query="SELECT p FROM Pacijentdijagnoza p")
public class Pacijentdijagnoza implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idPacijentdijagnoza;

	//bi-directional many-to-one association to Dijagnoza
	@ManyToOne
	@JoinColumn(name="idDijagnoza")
	private Dijagnoza dijagnoza;

	//bi-directional many-to-one association to Pacijent
	@ManyToOne
	@JoinColumn(name="idPacijent")
	private Pacijent pacijent;

	public Pacijentdijagnoza() {
	}

	public int getIdPacijentdijagnoza() {
		return this.idPacijentdijagnoza;
	}

	public void setIdPacijentdijagnoza(int idPacijentdijagnoza) {
		this.idPacijentdijagnoza = idPacijentdijagnoza;
	}

	public Dijagnoza getDijagnoza() {
		return this.dijagnoza;
	}

	public void setDijagnoza(Dijagnoza dijagnoza) {
		this.dijagnoza = dijagnoza;
	}

	public Pacijent getPacijent() {
		return this.pacijent;
	}

	public void setPacijent(Pacijent pacijent) {
		this.pacijent = pacijent;
	}

}