package tn.iit.model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;


@Embeddable
public class PartConvId implements Serializable{
	
	@Column(name = "CONV_ID")
	private int idconv;
	
	@Column(name="PART_ID")
	private int idpart;

	public PartConvId(int idconv, int idpart) {
		this.idconv = idconv;
		this.idpart = idpart;
	}
	public PartConvId(int idconv) {
		this.idconv = idconv;
	}
	public PartConvId() {
	
	}

	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass())
            return false;
 
        PartConvId that = (PartConvId) o;
        return Objects.equals(idconv, that.idconv) &&
               Objects.equals(idpart, that.idpart);
    }
 
    @Override
    public int hashCode() {
        return Objects.hash(idconv, idpart);
    }
	
	
	
}
