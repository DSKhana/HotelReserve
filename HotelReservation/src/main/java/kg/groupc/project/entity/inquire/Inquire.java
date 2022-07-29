package kg.groupc.project.entity.inquire;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicInsert;

import kg.groupc.project.entity.BaseEntity;
import kg.groupc.project.entity.account.Account;
import kg.groupc.project.entity.hotel.Hotel;
import kg.groupc.project.entity.restaurant.Restaurant;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 문의글
@Entity
@Getter
@Setter
@NoArgsConstructor
@DynamicInsert
public class Inquire extends BaseEntity<Long>{
	
	// 작성자(외래키)
	@ManyToOne(optional = false, targetEntity = Account.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "writer")
	private Account writer;
	
	// 호텔 id(외래키) -> 카테고리 호텔 문의 일 경우만 값이 입력됨(nullable)
	@ManyToOne(optional = true, targetEntity = Hotel.class, fetch = FetchType.LAZY)
	@JoinColumn(name = "hotel")
	private Hotel hotel;
	
	// 문의글 제목
	@Column(nullable = false)
	private String title;
	
	// 문의글 내용
	@Column(nullable = false, length = 1000)
	private String description;
	
	// 작성일
	@CreationTimestamp
	@Column(nullable = false)
	private Date day;
	
	// 카테고리
	@Column(nullable = false)
	private String category;
	
	
	@Column(nullable = false, columnDefinition = "number(1) default 1")
	private Long status;
	
	@OneToMany(mappedBy = "inquire", targetEntity = InquireReply.class, fetch = FetchType.LAZY)
	private List<InquireReply> replys;
	
	
	@Builder
	public Inquire(Account writer, String category, Hotel hotel,  String title, String description, Date day, Long status) {
		this.writer = writer;
		this.category = category;
		this.hotel = hotel;
		this.title = title;
		this.description = description;
		this.day = day;
		this.status = status;
	}


	public void patch(Inquire inquire) {
		if (inquire.writer != null) {
			this.writer = inquire.writer;
		}
		if (inquire.category != null) {
			this.category = inquire.category;
		}
		if (inquire.title != null) {
			this.title = inquire.title;
		}
		if (inquire.description != null) {
			this.description = inquire.description;
		}
		if (inquire.day != null) {
			this.day = inquire.day;
		}
		if (inquire.status != null) {
			this.status = inquire.status;
		}
	}
}
