package kg.groupc.project.service.account;

import java.io.Serializable;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import com.querydsl.jpa.impl.JPAQuery;

import kg.groupc.project.dto.account.BookingDto;
import kg.groupc.project.dto.account.InfoChangeFormDto;
import kg.groupc.project.dto.account.PwdChangeFormDto;
import kg.groupc.project.entity.account.Account;
import kg.groupc.project.entity.account.QAccount;
import kg.groupc.project.entity.hotel.Booking;
import kg.groupc.project.entity.hotel.QBooking;
import kg.groupc.project.entity.hotel.Room;
import kg.groupc.project.repository.account.AccountRepository;
import kg.groupc.project.service.BaseService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService<T, ID extends Serializable> extends BaseService<Account, Long> implements UserDetailsService{
	
	private final AccountRepository<Account, Long> accountRepository;
	private final PasswordEncoder passwordEncoder;
	
	//test method
	public List<Account> getThreeAccounts(){
		Pageable limit = PageRequest.of(0, 3);
		return accountRepository.findAll(limit).getContent();
	}
	
	public Account getAccountById(String userId) {
		return accountRepository.findByUserId(userId);
	}
	
	public List<Account> getAllAccounts(){
		return accountRepository.findAll();
	}
	
	public Account saveAccount(Account account) {
		if(!idDuplicateCheck(account.getUserId())) {
			return accountRepository.save(account);
		}else {
			return null;
		}
	}
	
	public Account changeAccountInfo(InfoChangeFormDto infoChangeFormDto) {
		Account account = (Account) accountRepository.findByUserId(infoChangeFormDto.getUserId());
		account.setName(infoChangeFormDto.getUsername());
		account.setEmail(infoChangeFormDto.getEmail());
		account.setPhone(infoChangeFormDto.getPhone());
		account.setAddress(infoChangeFormDto.getAddress() + " " +infoChangeFormDto.getAddressDetail());
		return accountRepository.save(account);
	}
	
	public Account changeAccountPasswordChange(String userId, PwdChangeFormDto pwdChangeFormDto) {
		Account account = accountRepository.findByUserId(userId);
		account.setPassword(passwordEncoder.encode(pwdChangeFormDto.getPassword()));
		return accountRepository.save(account);
	}
	
	public boolean resignAccount(String userId) {
		Account account = accountRepository.findByUserId(userId);
		account.setStatus(0L);
		accountRepository.save(account);
		if(account.getStatus() == 0L) {
			return true;
		}
		return false;
	}
	@Transactional
	public List<ArrayList<BookingDto>> getBookingList(String userId){
		Date today = Date.valueOf(LocalDate.now());
		List<Booking> bookingList = accountRepository.findByUserId(userId).getBookings();
		List<ArrayList<BookingDto>> bookingDtoList = new ArrayList<ArrayList<BookingDto>>(2);
		// list init
		bookingDtoList.add(new ArrayList<BookingDto>());
		bookingDtoList.add(new ArrayList<BookingDto>());
		for(Booking booking : bookingList) {
			BookingDto bookingDto = new BookingDto();
			Room room = booking.getRoom();
			String roomName = room.getName();
			String hotelName = room.getHotel().getName();
			bookingDto.setSeq(booking.getSeq());
			bookingDto.setHotel(hotelName);
			bookingDto.setRoom(roomName);
			bookingDto.setReserver(booking.getReserver().getUserId());
			bookingDto.setReserveDate(booking.getReserveDate());
			bookingDto.setReserveEndDate(booking.getReserveEndDate());
			bookingDto.setStatus(booking.getStatus());
			bookingDto.setPrice(booking.getPrice());
			bookingDto.setPeople(booking.getPeople());
			// 예약 내역
			if(booking.getReserveDate().after(today)) {
				bookingDtoList.get(0).add(bookingDto);
			}
			// 이용 내역
			else { 
				bookingDtoList.get(1).add(bookingDto);
			}
		}
		return bookingDtoList;
	}

	public boolean idDuplicateCheck(String userId) {
		Account account = accountRepository.findByUserId(userId);
		if(account == null) 
			return false;
		else 
			return true;
	}

	public Map<String, String> validateHandling(Errors errors){
		Map<String, String> validatorResult = new HashMap<>();
		
		for(FieldError error : errors.getFieldErrors()) {
			String validKeyName = String.format("valid_%s", error.getField());
			validatorResult.put(validKeyName, error.getDefaultMessage());
		}
		return validatorResult;
	}
	
	@Override
	public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
		Account account = accountRepository.findByUserId(userId);
		
		if(account == null) {
			throw new UsernameNotFoundException(userId);
		}else if(account.getStatus()==0) {
			// 탈퇴한 계정이라면
			throw new UsernameNotFoundException(userId);
		}
		return User.builder()
				.username(account.getUserId())
				.password(account.getPassword())
				.roles(account.getRole().toString())
				.build();
	}
}
