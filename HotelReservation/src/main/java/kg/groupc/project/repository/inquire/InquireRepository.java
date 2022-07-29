package kg.groupc.project.repository.inquire;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import kg.groupc.project.entity.inquire.Inquire;
import kg.groupc.project.repository.BaseRepository;

@Repository
public interface InquireRepository<T, ID extends Serializable> extends BaseRepository<Inquire, Long>{

	//검색(작성자) : 페이징 X
	List<Inquire> findByWriterContaining(String searchKeyword);
	
	//검색(제목) : 페이징 X
	List<Inquire> findByTitleContaining(String searchKeyword);
	
	//검색(작성자) + 페이징 추가
	Page<Inquire> findByWriterContaining(String searchKeyword, Pageable pageable);
	
	//검색(제목) + 페이징 추가
	Page<Inquire> findByTitleContaining(String searchKeyword, Pageable pageable);		
	
	//페이징
	Page<Inquire> findAll(Pageable pageable);
	
	Inquire findBySeq(Long seq);	
}
