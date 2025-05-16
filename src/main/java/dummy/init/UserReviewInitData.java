package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.UserReviewVO;

public class UserReviewInitData implements DummyAction {

	//숙소 (호스트) 가 유저에게 하는 리뷰
	
	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("📝 User Review Init");

		List<UserReviewVO> lists = new ArrayList<>();
		lists.add(new UserReviewVO("urv001", "host043", "user068", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-30")));
		lists.add(new UserReviewVO("urv002", "host037", "user092", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-05")));
		lists.add(new UserReviewVO("urv003", "host002", "user085", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-21")));
		lists.add(new UserReviewVO("urv004", "host008", "user029", 3, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-07")));
		lists.add(new UserReviewVO("urv005", "host004", "user090", 5, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-03-20")));
		lists.add(new UserReviewVO("urv006", "host001", "user060", 5, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-27")));
		lists.add(new UserReviewVO("urv007", "host047", "user063", 5, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-04-26")));
		lists.add(new UserReviewVO("urv008", "host031", "user093", 5, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-07")));
		lists.add(new UserReviewVO("urv009", "host016", "user005", 3, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-01")));
		lists.add(new UserReviewVO("urv010", "host015", "user089", 5, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-04")));
		lists.add(new UserReviewVO("urv011", "host043", "user023", 3, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-15")));
		lists.add(new UserReviewVO("urv012", "host039", "user019", 4, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-04-24")));
		lists.add(new UserReviewVO("urv013", "host016", "user095", 5, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-17")));
		lists.add(new UserReviewVO("urv014", "host039", "user033", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-16")));
		lists.add(new UserReviewVO("urv015", "host030", "user037", 5, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-03-01")));
		lists.add(new UserReviewVO("urv016", "host001", "user032", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-02")));
		lists.add(new UserReviewVO("urv017", "host004", "user012", 5, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-03-20")));
		lists.add(new UserReviewVO("urv018", "host046", "user035", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-12")));
		lists.add(new UserReviewVO("urv019", "host028", "user041", 3, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-04-21")));
		lists.add(new UserReviewVO("urv020", "host034", "user061", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-03-04")));
		lists.add(new UserReviewVO("urv021", "host022", "user081", 4, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-26")));
		lists.add(new UserReviewVO("urv022", "host027", "user029", 3, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-03-14")));
		lists.add(new UserReviewVO("urv023", "host037", "user100", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-19")));
		lists.add(new UserReviewVO("urv024", "host050", "user044", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-04-24")));
		lists.add(new UserReviewVO("urv025", "host017", "user094", 4, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-04-24")));
		lists.add(new UserReviewVO("urv026", "host039", "user017", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-20")));
		lists.add(new UserReviewVO("urv027", "host030", "user001", 5, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-03-29")));
		lists.add(new UserReviewVO("urv028", "host029", "user098", 4, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-03-09")));
		lists.add(new UserReviewVO("urv029", "host048", "user077", 4, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-03-14")));
		lists.add(new UserReviewVO("urv030", "host004", "user070", 5, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-04-13")));
		
		
		for (UserReviewVO rv : lists) {
			if (dummyDAO.initUserReview(rv))
				System.out.println("UserReview 등록 성공~ ID: " + rv.getUserReviewId());
			else
				System.out.println("UserReview 등록 실패~ ID: " + rv.getUserReviewId());
		}
	}
}
