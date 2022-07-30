package kg.groupc.project.entity.inquire;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import kg.groupc.project.entity.BaseEntity;
import kg.groupc.project.entity.account.Account;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
public class InquireReply extends BaseEntity<Long>{
	
	// 문의글 id(외래키)
	@ManyToOne(optional = false, targetEntity = Inquire.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "inquire")
	private Inquire inquire;
	
	// 작성자(관리자, 외래키)
	@ManyToOne(optional = false, targetEntity = Account.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "admin")
	private Account admin;
	
	// 제목
	@Column(nullable = false, length = 50)
	private String title;
	
	// 내용
	@Column(nullable = false, length = 1000)
	private String description;
	
	//답변내용
	@Column(nullable = false, length = 1000)
	private String comment;
	
	// 작성일
	@Column(nullable = false)
	private Date day;
	
	@Builder
	public InquireReply(Inquire inquire, Account admin, String title, String description, Date day) {
		this.inquire = inquire;
		this.admin = admin;
		this.title = title;
		this.description = description;
		this.day = day;		
	}
}