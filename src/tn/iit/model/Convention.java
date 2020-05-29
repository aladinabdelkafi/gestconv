package tn.iit.model;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Convention")
public class Convention {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "idConv")
	private int idConv;

	@ManyToOne
	@JoinColumn(name = "typeConv")
	private TypeConv typeConv;

	@Column(name = "dateEditionConv")
	private LocalDate dateEditionConv;

	@Column(name = "objetConv")
	private String objetConv;

	@Column(name = "dateVigueurConv")
	private LocalDate dateVigueurConv;

	@Column(name = "dateExpConv")
	private LocalDate dateExpConv;

	@OneToMany(mappedBy = "convention" ,cascade = {CascadeType.REMOVE, CascadeType.PERSIST})
	private List<Part_Conv> Part_Conv = new ArrayList<>();

	public Convention(TypeConv typeConv, LocalDate dateEditionConv, String objetConv, LocalDate dateVigueurConv,
			LocalDate dateExpConv) {

		this.typeConv = typeConv;
		this.dateEditionConv = dateEditionConv;
		this.objetConv = objetConv;
		this.dateVigueurConv = dateVigueurConv;
		this.dateExpConv = dateExpConv;
		
	}

	public Convention(int idConv, TypeConv typeConv, LocalDate dateEditionConv, String objetConv,
			LocalDate dateVigueurConv, LocalDate dateExpConv) {
		this.idConv = idConv;
		this.typeConv = typeConv;
		this.dateEditionConv = dateEditionConv;
		this.objetConv = objetConv;
		this.dateVigueurConv = dateVigueurConv;
		this.dateExpConv = dateExpConv;
	}

	public Convention() {

	}

	public int getIdConv() {
		return idConv;
	}

	public void setIdConv(int idConv) {
		this.idConv = idConv;
	}

	public TypeConv getTypeConv() {
		return typeConv;
	}

	public void setTypeConv(TypeConv typeConv) {
		this.typeConv = typeConv;
	}

	public LocalDate getDateEditionConv() {
		return dateEditionConv;
	}

	public void setDateEditionConv(LocalDate dateEditionConv) {
		this.dateEditionConv = dateEditionConv;
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

	@Override
	public String toString() {
		return "Convention [idConv=" + idConv + ", typeConv=" + typeConv + ", dateEditionConv=" + dateEditionConv
				+ ", objetConv=" + objetConv + ", dateVigueurConv=" + dateVigueurConv + ", dateExpConv=" + dateExpConv
				+ ", Part_Conv=" + Part_Conv + "]";
	}


	

}
