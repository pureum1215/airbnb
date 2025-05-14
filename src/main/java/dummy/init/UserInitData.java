package dummy.init;

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

//		UserVO user1 = new UserVO("아 ", "슈퍼맨", "super@super.com", "1234", "010-1231-9581", "1950-02-12");

		int cnt = dummyDAO.initUserIdxCount();
		System.out.println("cnt: "+cnt);
		
	}

	
}
