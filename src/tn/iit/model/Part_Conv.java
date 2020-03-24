package tn.iit.model;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;


@Entity
@Table(name = "Part_Conv")
public class Part_Conv {
	@EmbeddedId
	private PartConvId id;

	@ManyToOne
	@MapsId("conv_id")
	@JoinColumn(name="CONV_ID", insertable = false, updatable = false, nullable=false)
	private Convention convention;

	@ManyToOne
	@MapsId("part_id")
	@JoinColumn(name="PART_ID", insertable = false, updatable = false, nullable=false)
	private Participant participant;

	@Column(name = "dateSigConv")
	private LocalDate dateSigConv;

	public Part_Conv(Convention convention, Participant participant, LocalDate dateSigConv) {
		this.convention = convention;
		this.participant = participant;
		this.dateSigConv = dateSigConv;
		this.id = new PartConvId(convention.getIdConv(), participant.getIdParticipant());
	}
	public Part_Conv(Convention convention, Participant participant) {
		this.convention = convention;
		this.participant = participant;
		this.id = new PartConvId(convention.getIdConv(), participant.getIdParticipant());
	}
	public Part_Conv() {
	}

	//@ManyToOne
	//@JoinColumn(name = "idconv")
	public Convention getConvention() {
		return convention;
	}

	public void setConvention(Convention convention) {
		this.convention = convention;
	}

	//@ManyToOne
	//@JoinColumn(name = "idpart")
	public Participant getParticipant() {
		return participant;
	}

	public void setParticipant(Participant participant) {
		this.participant = participant;
	}

	public LocalDate getDateSigConv() {
		return dateSigConv;
	}

	public void setDateSigConv(LocalDate dateSigConv) {
		this.dateSigConv = dateSigConv;
	}

	@Override
	public String toString() {
		return "Part_Conv [convention=" + convention + ", participant=" + participant + ", dateSigConv=" + dateSigConv
				+ "]";
	}

}
