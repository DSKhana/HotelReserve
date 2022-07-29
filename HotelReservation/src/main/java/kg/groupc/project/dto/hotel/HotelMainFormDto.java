package kg.groupc.project.dto.hotel;



import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
public class HotelMainFormDto {//

	private long dataCount;
	private long seq;
	private String name;
	private String phone;
	private String address;
	private String description;
	private String img;
	private long status;
	
	private double avg; //평점
	private String scoreString;//평점에 대한 별의 개수를 표현하기 위함
}
