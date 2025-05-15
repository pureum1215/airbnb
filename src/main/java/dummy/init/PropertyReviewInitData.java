package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PropertyReviewVO;

public class PropertyReviewInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("📝 Property Review Init");

        List<PropertyReviewVO> lists = new ArrayList<>();
        lists.add(new PropertyReviewVO("prv001", "user010", "prop034", 5, "가성비 최고!", java.sql.Date.valueOf("2024-02-21")));
        lists.add(new PropertyReviewVO("prv002", "user022", "prop054", 5, "교통이 편리했어요.", java.sql.Date.valueOf("2024-03-09")));
        lists.add(new PropertyReviewVO("prv003", "user061", "prop033", 3, "교통이 편리했어요.", java.sql.Date.valueOf("2024-01-30")));
        lists.add(new PropertyReviewVO("prv004", "user010", "prop019", 4, "다음에도 또 예약할게요.", java.sql.Date.valueOf("2024-03-07")));
        lists.add(new PropertyReviewVO("prv005", "user048", "prop005", 5, "조용해서 쉬기 좋았어요.", java.sql.Date.valueOf("2024-02-15")));
        lists.add(new PropertyReviewVO("prv006", "user092", "prop007", 5, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-04-22")));
        lists.add(new PropertyReviewVO("prv007", "user074", "prop074", 5, "재방문 의사 100%입니다.", java.sql.Date.valueOf("2024-01-22")));
        lists.add(new PropertyReviewVO("prv008", "user030", "prop037", 5, "호스트가 친절했어요.", java.sql.Date.valueOf("2024-02-20")));
        lists.add(new PropertyReviewVO("prv009", "user060", "prop051", 3, "아늑하고 편안했어요.", java.sql.Date.valueOf("2024-02-22")));
        lists.add(new PropertyReviewVO("prv010", "user086", "prop014", 4, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-01-22")));
        lists.add(new PropertyReviewVO("prv011", "user040", "prop074", 5, "교통이 편리했어요.", java.sql.Date.valueOf("2024-03-28")));
        lists.add(new PropertyReviewVO("prv012", "user040", "prop014", 3, "조용해서 쉬기 좋았어요.", java.sql.Date.valueOf("2024-04-01")));
        lists.add(new PropertyReviewVO("prv013", "user066", "prop037", 3, "교통이 편리했어요.", java.sql.Date.valueOf("2024-02-11")));
        lists.add(new PropertyReviewVO("prv014", "user007", "prop045", 4, "아늑하고 편안했어요.", java.sql.Date.valueOf("2024-02-22")));
        lists.add(new PropertyReviewVO("prv015", "user075", "prop072", 3, "위치가 정말 좋아요.", java.sql.Date.valueOf("2024-04-23")));
        lists.add(new PropertyReviewVO("prv016", "user046", "prop055", 5, "재방문 의사 100%입니다.", java.sql.Date.valueOf("2024-02-06")));
        lists.add(new PropertyReviewVO("prv017", "user033", "prop010", 3, "재방문 의사 100%입니다.", java.sql.Date.valueOf("2024-02-25")));
        lists.add(new PropertyReviewVO("prv018", "user063", "prop059", 4, "호스트가 친절했어요.", java.sql.Date.valueOf("2024-04-22")));
        lists.add(new PropertyReviewVO("prv019", "user076", "prop067", 5, "다음에도 또 예약할게요.", java.sql.Date.valueOf("2024-03-20")));
        lists.add(new PropertyReviewVO("prv020", "user067", "prop025", 4, "가성비 최고!", java.sql.Date.valueOf("2024-04-11")));
        lists.add(new PropertyReviewVO("prv021", "user043", "prop053", 3, "깨끗하고 만족스러웠어요!", java.sql.Date.valueOf("2024-01-04")));
        lists.add(new PropertyReviewVO("prv022", "user044", "prop001", 3, "조용해서 쉬기 좋았어요.", java.sql.Date.valueOf("2024-01-13")));
        lists.add(new PropertyReviewVO("prv023", "user002", "prop010", 5, "다음에도 또 예약할게요.", java.sql.Date.valueOf("2024-01-09")));
        lists.add(new PropertyReviewVO("prv024", "user098", "prop067", 3, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-01-31")));
        lists.add(new PropertyReviewVO("prv025", "user042", "prop075", 3, "호스트가 친절했어요.", java.sql.Date.valueOf("2024-03-11")));
        lists.add(new PropertyReviewVO("prv026", "user003", "prop027", 5, "교통이 편리했어요.", java.sql.Date.valueOf("2024-01-15")));
        lists.add(new PropertyReviewVO("prv027", "user006", "prop047", 3, "아늑하고 편안했어요.", java.sql.Date.valueOf("2024-04-04")));
        lists.add(new PropertyReviewVO("prv028", "user045", "prop009", 4, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-02-15")));
        lists.add(new PropertyReviewVO("prv029", "user060", "prop034", 4, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-01-03")));
        lists.add(new PropertyReviewVO("prv030", "user001", "prop026", 4, "깨끗하고 만족스러웠어요!", java.sql.Date.valueOf("2024-02-09")));
        lists.add(new PropertyReviewVO("prv031", "user008", "prop075", 4, "위치가 정말 좋아요.", java.sql.Date.valueOf("2024-02-05")));
        lists.add(new PropertyReviewVO("prv032", "user061", "prop071", 5, "호스트가 친절했어요.", java.sql.Date.valueOf("2024-03-24")));
        lists.add(new PropertyReviewVO("prv033", "user064", "prop018", 4, "재방문 의사 100%입니다.", java.sql.Date.valueOf("2024-03-11")));
        lists.add(new PropertyReviewVO("prv034", "user091", "prop039", 4, "조용해서 쉬기 좋았어요.", java.sql.Date.valueOf("2024-01-28")));
        lists.add(new PropertyReviewVO("prv035", "user061", "prop041", 4, "아늑하고 편안했어요.", java.sql.Date.valueOf("2024-01-11")));
        lists.add(new PropertyReviewVO("prv036", "user087", "prop011", 5, "사진보다 훨씬 좋아요!", java.sql.Date.valueOf("2024-04-27")));
        lists.add(new PropertyReviewVO("prv037", "user001", "prop011", 5, "호스트가 친절했어요.", java.sql.Date.valueOf("2024-02-27")));
        lists.add(new PropertyReviewVO("prv038", "user079", "prop012", 4, "가성비 최고!", java.sql.Date.valueOf("2024-03-26")));
        lists.add(new PropertyReviewVO("prv039", "user029", "prop065", 4, "교통이 편리했어요.", java.sql.Date.valueOf("2024-04-20")));
        lists.add(new PropertyReviewVO("prv040", "user010", "prop015", 4, "조용해서 쉬기 좋았어요.", java.sql.Date.valueOf("2024-02-08")));

		for (PropertyReviewVO pr : lists) {
			if (dummyDAO.initPropertyReview(pr))
				System.out.println("PropertyReview 등록 성공~ ID: " + pr.getPropertyReviewId());
			else
				System.out.println("PropertyReview 등록 실패~ ID: " + pr.getPropertyReviewId());
		}
	}
}
