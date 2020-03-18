package tn.iit.model;


import java.time.LocalDate;
import java.util.Date;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import javax.persistence.Table;

@Entity
@Table(name = "Convention")
public class Convention {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idConv")
	private int idConv;

	@Column(name = "typeConv")
	private String typeConv;

	@Column(name = "dateEditionConv")
	private LocalDate dateEditionConv;

	@Column(name = "dateSigConv")
	private LocalDate dateSigConv;

	@Column(name = "objetConv")
	private String objetConv;

	@Column(name = "dateVigueurConv")
	private LocalDate dateVigueurConv;

	@Column(name = "dateExpConv")
	private LocalDate dateExpConv;
	
	@Column(name = "participant1")
	private String participant1;
	
	@Column(name = "participant2")
	private String participant2;
	
	@Column(name = "participant3")
	private String participant3;
	
	@Column(name = "participant4")
	private String participant4;
	
	public Convention(String typeConv, LocalDate dateEditionConv, LocalDate dateSigConv, String objetConv,
			LocalDate dateVigueurConv, LocalDate dateExpConv, String participant1, String participant2, String participant3,
			String participant4) {
		
		this.typeConv = typeConv;
		this.dateEditionConv = dateEditionConv;
		this.dateSigConv = dateSigConv;
		this.objetConv = objetConv;
		this.dateVigueurConv = dateVigueurConv;
		this.dateExpConv = dateExpConv;
		this.participant1 = participant1;
		this.participant2 = participant2;
		this.participant3 = participant3;
		this.participant4 = participant4;
	}
	public Convention(int idConv, String typeConv, LocalDate dateEditionConv, LocalDate dateSigConv, String objetConv,
			LocalDate dateVigueurConv, LocalDate dateExpConv, String participant1, String participant2, String participant3,
			String participant4) {
		this.idConv=idConv;
		this.typeConv = typeConv;
		this.dateEditionConv = dateEditionConv;
		this.dateSigConv = dateSigConv;
		this.objetConv = objetConv;
		this.dateVigueurConv = dateVigueurConv;
		this.dateExpConv = dateExpConv;
		this.participant1 = participant1;
		this.participant2 = participant2;
		this.participant3 = participant3;
		this.participant4 = participant4;
	}
	public Convention() {
		
	}
	public int getIdConv() {
		return idConv;
	}
	public void setIdConv(int idConv) {
		this.idConv = idConv;
	}
	public String getTypeConv() {
		return typeConv;
	}
	public void setTypeConv(String typeConv) {
		this.typeConv = typeConv;
	}
	public LocalDate getDateEditionConv() {
		return dateEditionConv;
	}
	public void setDateEditionConv(LocalDate dateEditionConv) {
		this.dateEditionConv = dateEditionConv;
	}
	public LocalDate getSateSigConv() {
		return dateSigConv;
	}
	public void setSateSigConv(LocalDate sateSigConv) {
		dateSigConv = sateSigConv;
	}
	public String getObjetConv() {
		return objetConv;
	}
	public void setObjetConv(String objetConv) {
		this.objetConv = objetConv;
	}
	public LocalDate getDateVigueurConv() {
		return dateVigueurConv;
	}
	public void setDateVigueurConv(LocalDate dateVigueurConv) {
		this.dateVigueurConv = dateVigueurConv;
	}
	public LocalDate getDateExpConv() {
		return dateExpConv;
	}
	public void setDateExpConv(LocalDate dateExpConv) {
		this.dateExpConv = dateExpConv;
	}
	public String getParticipant1() {
		return participant1;
	}
	public void setParticipant1(String participant1) {
		this.participant1 = participant1;
	}
	public String getParticipant2() {
		return participant2;
	}
	public void setParticipant2(String participant2) {
		this.participant2 = participant2;
	}
		public String getParticipant3() {
		return participant3;
	}
	public void setParticipant3(String participant3) {
		this.participant3 = participant3;
	}
	public String getParticipant4() {
		return participant4;
	}
	public void setParticipant4(String participant4) {
		this.participant4 = participant4;
	}
	
	@Override
	public String toString() {
		return "Convention [idConv=" + idConv + ", typeConv=" + typeConv + ", dateEditionConv=" + dateEditionConv
				+ ", dateSigConv=" + dateSigConv + ", objetConv=" + objetConv + ", dateVigueurConv=" + dateVigueurConv
				+ ", dateExpConv=" + dateExpConv + ", participant1=" + participant1 + ", participant2=" + participant2
				+ ", participant3=" + participant3 + ", participant4=" + participant4 + "]";
	}


}
