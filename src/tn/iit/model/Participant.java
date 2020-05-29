package tn.iit.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



@Entity
@Table(name = "Participant")
public class Participant {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idParticipant")
	private int idParticipant;
	
	
	@Column(name = "nameParticipant")
	private String nameParticipant;
	
	@OneToMany(mappedBy = "participant" ,cascade = {CascadeType.REMOVE, CascadeType.PERSIST})
	private List<Part_Conv> Part_Conv = new ArrayList<>();
	public int getIdParticipant() {
		return idParticipant;
	}
	public Participant(String nameParticipant) {
		this.nameParticipant = nameParticipant;
	}

	public Participant(int idParticipant, String nameParticipant) {
		super();
		this.idParticipant = idParticipant;
		this.nameParticipant = nameParticipant;
	}


	public Participant() {
	}
	public void setIdParticipant(int idParticipant) {
		this.idParticipant = idParticipant;
	}


	public String getNameParticipant() {
		return nameParticipant;
	}


	public void setNameParticipant(String nameParticipant) {
		this.nameParticipant = nameParticipant;
	}

}
