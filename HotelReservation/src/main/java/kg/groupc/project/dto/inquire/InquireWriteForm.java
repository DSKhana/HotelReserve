package kg.groupc.project.dto.inquire;

import java.sql.Date;

import javax.validation.constraints.NotBlank;

import org.modelmapper.ModelMapper;

import kg.groupc.project.entity.account.Account;
import kg.groupc.project.entity.hotel.Hotel;
import kg.groupc.project.entity.inquire.Inquire;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class InquireWriteForm {
	@NotBlank(message = "카테고리를 선택해주세요.")
	private String category; // 카테고리
	private Hotel hotel; // 호텔코드
	@NotBlank(message = "제목을 입력해주세요.")
	private String title; // 제목
	private Account writer; // 작성자
	@NotBlank(message = "내용을 입력해주세요.")
	private String description; // 내용
	private Date day; // 등록일
	private Long status; // 처리상태
	
	private static ModelMapper modelMapper = new ModelMapper();
	
	public static Inquire of (Inquire inquire) {
		return modelMapper.map(inquire, Inquire.class);
	}
	
	public Inquire toEntity() {
		Inquire inquire = Inquire.builder()
				.category(category)
				.title(title)
				.description(description)
				.day(day)
				.writer(getWriter()) //외래키
				.status(1L)
				.build();
		return inquire;
	}
	
	@Builder
	public InquireWriteForm(Long seq, String category, Hotel hotel, String title, String description, Account writer, Date day, Long status) {
		this.category = category;
		this.hotel = hotel;
		this.title = title;
		this.description = description;
		this.writer = writer;
		this.day = day;
		this.status = status;
	}
}
