package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the lekdijagnoza database table.
 * 
 */
@Entity
@NamedQuery(name="Lekdijagnoza.findAll", query="SELECT l FROM Lekdijagnoza l")
public class Lekdijagnoza implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idLekdijagnoza;

	//bi-directional many-to-one association to Dijagnoza
	@ManyToOne
	@JoinColumn(name="idDijagnoza")
	private Dijagnoza dijagnoza;

	//bi-directional many-to-one association to Lek
	@ManyToOne
	@JoinColumn(name="idLek")
	private Lek lek;

	public Lekdijagnoza() {
	}

	public int getIdLekdijagnoza() {
		return this.idLekdijagnoza;
	}

	public void setIdLekdijagnoza(int idLekdijagnoza) {
		this.idLekdijagnoza = idLekdijagnoza;
	}

	public Dijagnoza getDijagnoza() {
		return this.dijagnoza;
	}

	public void setDijagnoza(Dijagnoza dijagnoza) {
		this.dijagnoza = dijagnoza;
	}

	public Lek getLek() {
		return this.lek;
	}

	public void setLek(Lek lek) {
		this.lek = lek;
	}

}