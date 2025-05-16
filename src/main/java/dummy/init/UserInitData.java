package dummy.init;

import java.util.*;

import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.UserVO;

/***
 * 유저 데이터 가공
 * 작성자: 명희승
 */
public class UserInitData implements DummyAction{

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= user init db =============================");
		List<UserVO> lists = new ArrayList();

		String[] names = {
			    "임민수", "정지호", "조지민", "박민수", "김지아", "장예준", "윤은우", "최예준", "임시우", "박세은",
			    "김수빈", "조예린", "정지후", "이하은", "장도윤", "강유진", "박지아", "임하람", "정은우", "윤예준",
			    "김시우", "조지호", "박연우", "최태윤", "장세은", "강다온", "이민수", "정지민", "윤서연", "조현우",
			    "박수빈", "김예린", "임지후", "최하은", "정도윤", "이유진", "장지아", "강하람", "윤은우", "조예준",
			    "박시우", "김지호", "임연우", "최태윤", "정세은", "조다온", "이민수", "강지민", "장서연", "김현우",
			    "박수빈", "윤예린", "조지후", "정하은", "이도윤", "임유진", "최지아", "강하람", "정은우", "김예준",
			    "박시우", "윤지호", "조연우", "장태윤", "이세은", "강다온", "김민수", "정지민", "윤서연", "최현우",
			    "박수빈", "임예린", "장지후", "이하은", "조도윤", "강유진", "정지아", "최하람", "김은우", "윤예준",
			    "조시우", "이지호", "장연우", "강태윤", "임세은", "정다온", "박민수", "조지민", "이서연", "최현우",
			    "윤수빈", "강예린", "장지후", "김하은", "정도윤", "박유진", "임지아", "조하람", "이은우", "강예준"
			};

			for (int i = 0; i < 100; i++) {
			    String userId = String.format("user%03d", i + 1);
			    String name = names[i];
			    String email = "user" + (i + 1) + "@example.com";
			    String password = "pass" + (i + 1);
			    String phone = String.format("010-%04d-%04d", (1000 + i), (9000 + i));
			    String birthday = String.format("1990-%02d-%02d", (i % 12) + 1, (i % 28) + 1);

			    lists.add(new UserVO(userId, name, email, password, phone, birthday));
			}

		for(UserVO li : lists) {
			if(dummyDAO.initUser(li))
				System.out.println("user등록 성공~ Num: "+li.getUserId());
			else {
				System.out.println("user등록 실패~ Num: "+li.getUserId());
			}
			
		}


	}

	
}
