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
        lists.add(new UserReviewVO("urv001", "host020", "user002", 3, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-03-31")));
        lists.add(new UserReviewVO("urv002", "host007", "user014", 5, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-03-15")));
        lists.add(new UserReviewVO("urv003", "host033", "user063", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-09")));
        lists.add(new UserReviewVO("urv004", "host002", "user031", 3, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-04-08")));
        lists.add(new UserReviewVO("urv005", "host046", "user048", 3, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-13")));
        lists.add(new UserReviewVO("urv006", "host021", "user088", 4, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-04-07")));
        lists.add(new UserReviewVO("urv007", "host045", "user072", 5, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-03-18")));
        lists.add(new UserReviewVO("urv008", "host027", "user005", 5, "다음에도 환영입니다!", java.sql.Date.valueOf("2024-01-08")));
        lists.add(new UserReviewVO("urv009", "host014", "user053", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-29")));
        lists.add(new UserReviewVO("urv010", "host022", "user046", 3, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-01-03")));
        lists.add(new UserReviewVO("urv011", "host049", "user084", 3, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-05")));
        lists.add(new UserReviewVO("urv012", "host013", "user049", 3, "다음에도 환영입니다!", java.sql.Date.valueOf("2024-01-25")));
        lists.add(new UserReviewVO("urv013", "host028", "user045", 3, "정말 친절하셨어요.", java.sql.Date.valueOf("2024-03-27")));
        lists.add(new UserReviewVO("urv014", "host046", "user011", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-02-24")));
        lists.add(new UserReviewVO("urv015", "host041", "user044", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-09")));
        lists.add(new UserReviewVO("urv016", "host038", "user013", 5, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-02-11")));
        lists.add(new UserReviewVO("urv017", "host020", "user032", 4, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-02-21")));
        lists.add(new UserReviewVO("urv018", "host049", "user078", 4, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-04-14")));
        lists.add(new UserReviewVO("urv019", "host003", "user074", 5, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-02-22")));
        lists.add(new UserReviewVO("urv020", "host002", "user021", 5, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-01")));
        lists.add(new UserReviewVO("urv021", "host035", "user044", 4, "소통이 원활해서 좋았어요.", java.sql.Date.valueOf("2024-01-10")));
        lists.add(new UserReviewVO("urv022", "host019", "user099", 4, "조용하고 편안한 분이셨어요.", java.sql.Date.valueOf("2024-03-13")));
        lists.add(new UserReviewVO("urv023", "host005", "user023", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-03-27")));
        lists.add(new UserReviewVO("urv024", "host001", "user028", 5, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-04-01")));
        lists.add(new UserReviewVO("urv025", "host008", "user004", 4, "정말 매너 좋은 게스트였습니다.", java.sql.Date.valueOf("2024-02-26")));
        lists.add(new UserReviewVO("urv026", "host022", "user039", 3, "깔끔하게 사용해주셨어요.", java.sql.Date.valueOf("2024-01-25")));
        lists.add(new UserReviewVO("urv027", "host008", "user064", 4, "숙소 규칙을 잘 지켜주셨어요.", java.sql.Date.valueOf("2024-03-08")));
        lists.add(new UserReviewVO("urv028", "host046", "user008", 3, "믿고 맡길 수 있는 게스트예요.", java.sql.Date.valueOf("2024-01-13")));
        lists.add(new UserReviewVO("urv029", "host028", "user077", 5, "방을 깨끗하게 정리해주셨어요.", java.sql.Date.valueOf("2024-04-29")));
        lists.add(new UserReviewVO("urv030", "host023", "user034", 3, "조용하고 편안한 분이셨어요.", java.sql.Date.valueOf("2024-03-02")));

		for (UserReviewVO rv : lists) {
			if (dummyDAO.initUserReview(rv))
				System.out.println("UserReview 등록 성공~ ID: " + rv.getUserReviewId());
			else
				System.out.println("UserReview 등록 실패~ ID: " + rv.getUserReviewId());
		}
	}
}
