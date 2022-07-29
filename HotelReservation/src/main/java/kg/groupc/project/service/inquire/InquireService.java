package kg.groupc.project.service.inquire;

import java.io.Serializable;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.querydsl.jpa.impl.JPAQueryFactory;

import kg.groupc.project.dto.inquire.InquireWriteForm;
import kg.groupc.project.entity.inquire.Inquire;
import kg.groupc.project.repository.inquire.InquireRepository;
import kg.groupc.project.service.BaseService;
import lombok.AllArgsConstructor;

@AllArgsConstructor
@Service
public class InquireService<T, ID extends Serializable> extends BaseService<Inquire, Long> {


	@Autowired
	private InquireRepository<Inquire, Long> inquireRepository;
	
//	public InquireService(InquireRepository<Inquire, Long> inquireRepository) {
//		super(inquireRepository);
//		this.inquireRepository = inquireRepository;
//	}
	
//	EntityManagerFactory emf = Persistence.createEntityManagerFactory("kg.groupc.project");
//	JPAQueryFactory jpaQF = new JPAQueryFactory(em);
	
//	public List<Hotel> getHotelList(Hotel hotel, Booking booking, Account account){
//		JPAQuery<Inquire> query = select();
//		query.from(QHotel.hotel, QBooking.booking, QAccount.account);
//		query.where(account.getSeq().equals(booking.getReserver()));
//		query.groupBy(hotel.getName());
//		query.fetch();
//		
//		return null;
//	}
		
	
	
	// 문의 전체 리스트
	@Transactional(readOnly = true)
	public Page<Inquire> findAll(Pageable pageable){
		return inquireRepository.findAll(pageable);
	}
	// 검색(작성자)
	@Transactional(readOnly = true)
	public Page<Inquire> search1(String searchKeyword, Pageable pageable) {
		return inquireRepository.findByWriterContaining(searchKeyword, pageable);
	}
	// 검색(제목)
	@Transactional(readOnly = true)
	public Page<Inquire> search2(String searchKeyword, Pageable pageable) {
		return inquireRepository.findByTitleContaining(searchKeyword, pageable);
	}
	// 문의 상세보기
	@Transactional(readOnly = true)
	public Inquire readInquire(Long seq) {
		return inquireRepository.findById(seq).orElse(null);
	}

	// 문의 작성
	@Transactional
	public Long saveInquire(InquireWriteForm idto) {
		return inquireRepository.save(idto.toEntity()).getSeq();	
	}

	// 문의 삭제
	@Transactional
	public Inquire delete(Long seq) {
		Inquire inquire = inquireRepository.findById(seq).orElse(null);
		if(inquire == null) {
			return null;
		}
		inquireRepository.delete(inquire);
		return inquire;
	}

	
	// 문의 수정
	@Transactional
	public Inquire edit(Long seq, InquireWriteForm idto) {
		Inquire inquire = idto.toEntity();
		Inquire target = inquireRepository.findById(seq).orElse(null);
		if(target == null) {
			return null;
		}
		target.patch(inquire);
		return inquireRepository.save(target);
	}
}

	

