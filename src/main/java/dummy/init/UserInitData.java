package dummy.init;

import java.util.*;

import dummy.Action;
import dummy.DummyDAO;
import dummy.vo.UserVO;

/***
 * 유저 데이터 가공
 * 작성자: 명희승
 */
public class UserInitData implements Action{

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= user init db =============================");
		List<UserVO> lists = new ArrayList();


		lists.add(new UserVO("user001", "슈퍼맨", "super@super.com", "1234", "010-1231-9581", "1950-02-12"));
		lists.add(new UserVO("user002", "배트맨", "batman@dc.com", "abcd", "010-2231-9582", "1972-06-15"));
		lists.add(new UserVO("user003", "아이언맨", "iron@marvel.com", "ironman", "010-3231-9583", "1970-05-29"));
		lists.add(new UserVO("user004", "원더우먼", "wonder@dc.com", "wonder1", "010-4231-9584", "1984-03-08"));
		lists.add(new UserVO("user005", "캡틴아메리카", "cap@marvel.com", "shield", "010-5231-9585", "1918-07-04"));
		lists.add(new UserVO("user006", "헐크", "hulk@marvel.com", "smash", "010-6231-9586", "1969-12-18"));
		lists.add(new UserVO("user007", "토르", "thor@asgard.com", "mjolnir", "010-7231-9587", "965-01-01"));
		lists.add(new UserVO("user008", "블랙위도우", "natasha@shield.com", "spy007", "010-8231-9588", "1984-11-22"));
		lists.add(new UserVO("user009", "스파이더맨", "spidey@marvel.com", "peter123", "010-9231-9589", "2001-08-10"));
		lists.add(new UserVO("user010", "앤트맨", "antman@marvel.com", "quantum", "010-1331-9590", "1980-01-19"));

		
		for(UserVO li : lists) {
			if(dummyDAO.initUser(li))
				System.out.println("user등록 실패~ Num: "+li.getUserId());
			else {
				System.out.println("user등록 성공~ Num: "+li.getUserId());
			}
			
		}


	}

	
}
