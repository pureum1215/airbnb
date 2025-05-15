package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PropertyReviewVO;

public class PropertyReviewInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= property_review init db =============================");
		List<PropertyReviewVO> lists = new ArrayList<>();

		lists.add(new PropertyReviewVO("pr001", "user002", "prop001", 5, "최고의 숙소였습니다!"));
		lists.add(new PropertyReviewVO("pr002", "user003", "prop001", 4, "좋았어요, 다시 이용하고 싶어요."));
		lists.add(new PropertyReviewVO("pr003", "user006", "prop002", 3, "평범했어요."));
		lists.add(new PropertyReviewVO("pr004", "user008", "prop002", 2, "기대보다는 별로였습니다."));
		lists.add(new PropertyReviewVO("pr005", "user005", "prop003", 5, "정말 완벽한 숙박 경험이었어요."));

		for (PropertyReviewVO pr : lists) {
			if (dummyDAO.initPropertyReview(pr))
				System.out.println("PropertyReview 등록 성공~ ID: " + pr.getPropertyReviewId());
			else
				System.out.println("PropertyReview 등록 실패~ ID: " + pr.getPropertyReviewId());
		}
	}
}
