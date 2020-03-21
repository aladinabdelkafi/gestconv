package tn.iit.model;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "TypeConv")
public class TypeConv {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idType")
	private int idType;
	
	@Column(name = "nameType")
	private String nameType;
	
	@OneToMany(mappedBy="typeConv")
	private Collection<Convention> conventions;

	public TypeConv(int idType, String nameType) {
		this.idType = idType;
		this.nameType = nameType;
	}

	public TypeConv(String nameType) {
		this.nameType = nameType;
	}

	
	public TypeConv() {
	}

	public int getIdType() {
		return idType;
	}

	public void setIdType(int idType) {
		this.idType = idType;
	}

	public String getNameType() {
		return nameType;
	}

	public void setNameType(String nameType) {
		this.nameType = nameType;
	}

	public Collection<Convention> getConventions() {
		return conventions;
	}

	public void setConventions(Collection<Convention> conventions) {
		this.conventions = conventions;
	}

	@Override
	public String toString() {
		return "TypeConv [idType=" + idType + ", nameType=" + nameType + ", conventions=" + conventions + "]";
	}
	
	
	
	
}
