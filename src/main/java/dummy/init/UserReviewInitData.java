package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.UserReviewVO;

public class UserReviewInitData implements DummyAction {

	//숙소 (호스트) 가 유저에게 하는 리뷰
	
	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= user_review init db =============================");
		List<UserReviewVO> lists = new ArrayList<>();

		lists.add(new UserReviewVO("review001", "user001", "host001", 5, "정말 친절하고 깨끗했어요!"));
		lists.add(new UserReviewVO("review002", "user002", "host001", 4, "만족스러운 숙박이었습니다."));
		lists.add(new UserReviewVO("review003", "user003", "host002", 3, "보통이었어요."));
		lists.add(new UserReviewVO("review004", "user004", "host002", 2, "불편한 점이 많았어요."));
		lists.add(new UserReviewVO("review005", "user005", "host003", 5, "완벽한 호스트!"));

		for (UserReviewVO rv : lists) {
			if (dummyDAO.initUserReview(rv))
				System.out.println("UserReview 등록 성공~ ID: " + rv.getUserReviewId());
			else
				System.out.println("UserReview 등록 실패~ ID: " + rv.getUserReviewId());
		}
	}
}
