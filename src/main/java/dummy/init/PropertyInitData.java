package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PropertyVO;

public class PropertyInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= property init db =============================");
		List<PropertyVO> lists = new ArrayList<>();

		lists.add(new PropertyVO("prop001", "host001", "loc044", 3, "대구 럭셔리 아파트", "자연과 어우러진 숙소예요.", 150000, 1, 1, 1, "예약 가능", "prop001.jpg", "N"));
        lists.add(new PropertyVO("prop002", "host002", "loc009", 3, "부산 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 90000, 2, 3, 1, "예약 가능", "prop002.jpg", "N"));
        lists.add(new PropertyVO("prop003", "host003", "loc033", 1, "서울 조용한 시골집", "멋진 전망을 자랑합니다.", 120000, 4, 2, 1, "예약 가능", "prop003.jpg", "N"));
        lists.add(new PropertyVO("prop004", "host004", "loc068", 3, "부산 힐링 하우스", "깔끔하고 편안한 공간입니다.", 120000, 4, 1, 2, "예약 가능", "prop004.jpg", "N"));
        lists.add(new PropertyVO("prop005", "host005", "loc062", 1, "광주 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 90000, 3, 2, 1, "예약 가능", "prop005.jpg", "N"));
        lists.add(new PropertyVO("prop006", "host006", "loc054", 1, "제주 감성 독채", "멋진 전망을 자랑합니다.", 120000, 2, 3, 2, "예약 가능", "prop006.jpg", "N"));
        lists.add(new PropertyVO("prop007", "host007", "loc053", 1, "서울 조용한 시골집", "가족과 함께하기 좋아요.", 70000, 1, 1, 2, "예약 가능", "prop007.jpg", "N"));
        lists.add(new PropertyVO("prop008", "host008", "loc049", 2, "광주 오션뷰 펜션", "가족과 함께하기 좋아요.", 90000, 3, 2, 2, "예약 가능", "prop008.jpg", "N"));
        lists.add(new PropertyVO("prop009", "host009", "loc002", 1, "대구 조용한 시골집", "깔끔하고 편안한 공간입니다.", 120000, 3, 2, 2, "예약 가능", "prop009.jpg", "N"));
        lists.add(new PropertyVO("prop010", "host010", "loc038", 1, "부산 럭셔리 아파트", "멋진 전망을 자랑합니다.", 120000, 3, 2, 2, "예약 가능", "prop010.jpg", "N"));
        lists.add(new PropertyVO("prop011", "host011", "loc035", 2, "제주 감성 독채", "가족과 함께하기 좋아요.", 70000, 3, 2, 2, "예약 가능", "prop011.jpg", "N"));
        lists.add(new PropertyVO("prop012", "host012", "loc012", 2, "제주 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 70000, 1, 2, 1, "예약 가능", "prop012.jpg", "N"));
        lists.add(new PropertyVO("prop013", "host013", "loc064", 3, "제주 감성 독채", "깔끔하고 편안한 공간입니다.", 120000, 3, 3, 1, "예약 가능", "prop013.jpg", "N"));
        lists.add(new PropertyVO("prop014", "host014", "loc049", 1, "대구 감성 독채", "깔끔하고 편안한 공간입니다.", 70000, 3, 2, 1, "예약 가능", "prop014.jpg", "N"));
        lists.add(new PropertyVO("prop015", "host015", "loc004", 2, "부산 감성 독채", "자연과 어우러진 숙소예요.", 90000, 3, 2, 1, "예약 가능", "prop015.jpg", "N"));
        lists.add(new PropertyVO("prop016", "host016", "loc054", 1, "부산 럭셔리 아파트", "깔끔하고 편안한 공간입니다.", 70000, 2, 2, 2, "예약 가능", "prop016.jpg", "N"));
        lists.add(new PropertyVO("prop017", "host017", "loc066", 2, "제주 감성 독채", "멋진 전망을 자랑합니다.", 70000, 1, 1, 1, "예약 가능", "prop017.jpg", "N"));
        lists.add(new PropertyVO("prop018", "host018", "loc051", 3, "광주 럭셔리 아파트", "멋진 전망을 자랑합니다.", 150000, 2, 1, 2, "예약 가능", "prop018.jpg", "N"));
        lists.add(new PropertyVO("prop019", "host019", "loc064", 2, "서울 조용한 시골집", "도심 속 휴식처입니다.", 120000, 1, 1, 2, "예약 가능", "prop019.jpg", "N"));
        lists.add(new PropertyVO("prop020", "host020", "loc062", 2, "서울 럭셔리 아파트", "멋진 전망을 자랑합니다.", 90000, 3, 1, 1, "예약 가능", "prop020.jpg", "N"));
        lists.add(new PropertyVO("prop021", "host021", "loc025", 3, "부산 오션뷰 펜션", "가족과 함께하기 좋아요.", 120000, 3, 2, 2, "예약 가능", "prop021.jpg", "N"));
        lists.add(new PropertyVO("prop022", "host022", "loc043", 1, "광주 힐링 하우스", "멋진 전망을 자랑합니다.", 120000, 3, 2, 1, "예약 가능", "prop022.jpg", "N"));
        lists.add(new PropertyVO("prop023", "host023", "loc067", 2, "부산 감성 독채", "도심 속 휴식처입니다.", 90000, 4, 2, 1, "예약 가능", "prop023.jpg", "N"));
        lists.add(new PropertyVO("prop024", "host024", "loc071", 2, "서울 오션뷰 펜션", "멋진 전망을 자랑합니다.", 90000, 3, 3, 1, "예약 가능", "prop024.jpg", "N"));
        lists.add(new PropertyVO("prop025", "host025", "loc005", 2, "대구 감성 독채", "멋진 전망을 자랑합니다.", 90000, 3, 1, 1, "예약 가능", "prop025.jpg", "N"));
        lists.add(new PropertyVO("prop026", "host026", "loc027", 1, "제주 럭셔리 아파트", "자연과 어우러진 숙소예요.", 90000, 4, 2, 1, "예약 가능", "prop026.jpg", "N"));
        lists.add(new PropertyVO("prop027", "host027", "loc019", 2, "제주 오션뷰 펜션", "도심 속 휴식처입니다.", 150000, 1, 2, 2, "예약 가능", "prop027.jpg", "N"));
        lists.add(new PropertyVO("prop028", "host028", "loc075", 2, "서울 감성 독채", "깔끔하고 편안한 공간입니다.", 70000, 4, 3, 2, "예약 가능", "prop028.jpg", "N"));
        lists.add(new PropertyVO("prop029", "host029", "loc029", 2, "부산 감성 독채", "깔끔하고 편안한 공간입니다.", 150000, 3, 2, 2, "예약 가능", "prop029.jpg", "N"));
        lists.add(new PropertyVO("prop030", "host030", "loc043", 1, "서울 오션뷰 펜션", "자연과 어우러진 숙소예요.", 120000, 1, 1, 1, "예약 가능", "prop030.jpg", "N"));
        lists.add(new PropertyVO("prop031", "host031", "loc056", 3, "서울 오션뷰 펜션", "가족과 함께하기 좋아요.", 120000, 2, 3, 1, "예약 가능", "prop031.jpg", "N"));
        lists.add(new PropertyVO("prop032", "host031", "loc017", 3, "광주 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 70000, 3, 2, 2, "예약 가능", "prop032.jpg", "N"));
        lists.add(new PropertyVO("prop033", "host032", "loc024", 2, "부산 감성 독채", "도심 속 휴식처입니다.", 150000, 3, 1, 1, "예약 가능", "prop033.jpg", "N"));
        lists.add(new PropertyVO("prop034", "host032", "loc005", 1, "부산 럭셔리 아파트", "깔끔하고 편안한 공간입니다.", 90000, 4, 1, 1, "예약 가능", "prop034.jpg", "N"));
        lists.add(new PropertyVO("prop035", "host033", "loc025", 3, "대구 럭셔리 아파트", "자연과 어우러진 숙소예요.", 90000, 2, 2, 2, "예약 가능", "prop035.jpg", "N"));
        lists.add(new PropertyVO("prop036", "host033", "loc035", 2, "서울 감성 독채", "자연과 어우러진 숙소예요.", 90000, 2, 1, 1, "예약 가능", "prop036.jpg", "N"));
        lists.add(new PropertyVO("prop037", "host034", "loc019", 1, "부산 럭셔리 아파트", "깔끔하고 편안한 공간입니다.", 70000, 3, 1, 2, "예약 가능", "prop037.jpg", "N"));
        lists.add(new PropertyVO("prop038", "host034", "loc055", 2, "대구 감성 독채", "도심 속 휴식처입니다.", 150000, 1, 1, 1, "예약 가능", "prop038.jpg", "N"));
        lists.add(new PropertyVO("prop039", "host035", "loc048", 1, "대구 조용한 시골집", "멋진 전망을 자랑합니다.", 90000, 4, 3, 2, "예약 가능", "prop039.jpg", "N"));
        lists.add(new PropertyVO("prop040", "host035", "loc058", 2, "광주 조용한 시골집", "깔끔하고 편안한 공간입니다.", 70000, 3, 2, 1, "예약 가능", "prop040.jpg", "N"));
        lists.add(new PropertyVO("prop041", "host036", "loc015", 3, "서울 감성 독채", "깔끔하고 편안한 공간입니다.", 150000, 4, 1, 2, "예약 가능", "prop041.jpg", "N"));
        lists.add(new PropertyVO("prop042", "host036", "loc062", 3, "제주 감성 독채", "멋진 전망을 자랑합니다.", 70000, 1, 2, 2, "예약 가능", "prop042.jpg", "N"));
        lists.add(new PropertyVO("prop043", "host037", "loc050", 1, "광주 감성 독채", "자연과 어우러진 숙소예요.", 120000, 3, 3, 1, "예약 가능", "prop043.jpg", "N"));
        lists.add(new PropertyVO("prop044", "host037", "loc063", 1, "제주 럭셔리 아파트", "가족과 함께하기 좋아요.", 70000, 3, 3, 2, "예약 가능", "prop044.jpg", "N"));
        lists.add(new PropertyVO("prop045", "host038", "loc006", 3, "광주 럭셔리 아파트", "깔끔하고 편안한 공간입니다.", 70000, 2, 1, 2, "예약 가능", "prop045.jpg", "N"));
        lists.add(new PropertyVO("prop046", "host038", "loc021", 3, "광주 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 150000, 4, 3, 2, "예약 가능", "prop046.jpg", "N"));
        lists.add(new PropertyVO("prop047", "host039", "loc022", 1, "대구 럭셔리 아파트", "가족과 함께하기 좋아요.", 90000, 4, 1, 1, "예약 가능", "prop047.jpg", "N"));
        lists.add(new PropertyVO("prop048", "host039", "loc027", 3, "광주 조용한 시골집", "자연과 어우러진 숙소예요.", 90000, 2, 3, 1, "예약 가능", "prop048.jpg", "N"));
        lists.add(new PropertyVO("prop049", "host040", "loc002", 2, "제주 감성 독채", "멋진 전망을 자랑합니다.", 90000, 2, 3, 2, "예약 가능", "prop049.jpg", "N"));
        lists.add(new PropertyVO("prop050", "host040", "loc056", 2, "제주 조용한 시골집", "멋진 전망을 자랑합니다.", 90000, 4, 1, 1, "예약 가능", "prop050.jpg", "N"));
        lists.add(new PropertyVO("prop051", "host041", "loc004", 1, "부산 오션뷰 펜션", "자연과 어우러진 숙소예요.", 90000, 1, 3, 2, "예약 가능", "prop051.jpg", "N"));
        lists.add(new PropertyVO("prop052", "host041", "loc065", 2, "광주 힐링 하우스", "깔끔하고 편안한 공간입니다.", 70000, 1, 3, 1, "예약 가능", "prop052.jpg", "N"));
        lists.add(new PropertyVO("prop053", "host042", "loc047", 2, "광주 오션뷰 펜션", "자연과 어우러진 숙소예요.", 70000, 1, 1, 2, "예약 가능", "prop053.jpg", "N"));
        lists.add(new PropertyVO("prop054", "host042", "loc031", 2, "광주 오션뷰 펜션", "깔끔하고 편안한 공간입니다.", 120000, 1, 3, 1, "예약 가능", "prop054.jpg", "N"));
        lists.add(new PropertyVO("prop055", "host043", "loc054", 2, "광주 오션뷰 펜션", "가족과 함께하기 좋아요.", 70000, 1, 1, 2, "예약 가능", "prop055.jpg", "N"));
        lists.add(new PropertyVO("prop056", "host043", "loc024", 2, "부산 힐링 하우스", "멋진 전망을 자랑합니다.", 120000, 2, 3, 2, "예약 가능", "prop056.jpg", "N"));
        lists.add(new PropertyVO("prop057", "host044", "loc044", 2, "부산 감성 독채", "깔끔하고 편안한 공간입니다.", 90000, 2, 1, 1, "예약 가능", "prop057.jpg", "N"));
        lists.add(new PropertyVO("prop058", "host044", "loc009", 2, "서울 힐링 하우스", "도심 속 휴식처입니다.", 120000, 4, 1, 1, "예약 가능", "prop058.jpg", "N"));
        lists.add(new PropertyVO("prop059", "host045", "loc027", 1, "제주 럭셔리 아파트", "멋진 전망을 자랑합니다.", 90000, 3, 3, 2, "예약 가능", "prop059.jpg", "N"));
        lists.add(new PropertyVO("prop060", "host045", "loc012", 1, "부산 힐링 하우스", "자연과 어우러진 숙소예요.", 90000, 3, 3, 2, "예약 가능", "prop060.jpg", "N"));
        lists.add(new PropertyVO("prop061", "host046", "loc040", 2, "서울 감성 독채", "도심 속 휴식처입니다.", 150000, 2, 2, 2, "예약 가능", "prop061.jpg", "N"));
        lists.add(new PropertyVO("prop062", "host046", "loc047", 2, "제주 럭셔리 아파트", "자연과 어우러진 숙소예요.", 150000, 3, 3, 2, "예약 가능", "prop062.jpg", "N"));
        lists.add(new PropertyVO("prop063", "host046", "loc024", 2, "제주 조용한 시골집", "도심 속 휴식처입니다.", 150000, 3, 2, 1, "예약 가능", "prop063.jpg", "N"));
        lists.add(new PropertyVO("prop064", "host047", "loc070", 3, "광주 조용한 시골집", "자연과 어우러진 숙소예요.", 70000, 2, 2, 2, "예약 가능", "prop064.jpg", "N"));
        lists.add(new PropertyVO("prop065", "host047", "loc075", 1, "광주 감성 독채", "멋진 전망을 자랑합니다.", 70000, 4, 2, 1, "예약 가능", "prop065.jpg", "N"));
        lists.add(new PropertyVO("prop066", "host047", "loc022", 3, "광주 조용한 시골집", "멋진 전망을 자랑합니다.", 70000, 2, 3, 2, "예약 가능", "prop066.jpg", "N"));
        lists.add(new PropertyVO("prop067", "host048", "loc019", 3, "광주 조용한 시골집", "도심 속 휴식처입니다.", 120000, 4, 3, 1, "예약 가능", "prop067.jpg", "N"));
        lists.add(new PropertyVO("prop068", "host048", "loc015", 2, "광주 감성 독채", "멋진 전망을 자랑합니다.", 90000, 4, 3, 2, "예약 가능", "prop068.jpg", "N"));
        lists.add(new PropertyVO("prop069", "host048", "loc050", 2, "제주 조용한 시골집", "멋진 전망을 자랑합니다.", 120000, 1, 1, 2, "예약 가능", "prop069.jpg", "N"));
        lists.add(new PropertyVO("prop070", "host049", "loc057", 2, "제주 럭셔리 아파트", "깔끔하고 편안한 공간입니다.", 70000, 2, 3, 1, "예약 가능", "prop070.jpg", "N"));
        lists.add(new PropertyVO("prop071", "host049", "loc006", 1, "부산 감성 독채", "멋진 전망을 자랑합니다.", 120000, 3, 2, 1, "예약 가능", "prop071.jpg", "N"));
        lists.add(new PropertyVO("prop072", "host049", "loc051", 3, "제주 럭셔리 아파트", "가족과 함께하기 좋아요.", 120000, 1, 3, 2, "예약 가능", "prop072.jpg", "N"));
        lists.add(new PropertyVO("prop073", "host050", "loc049", 1, "부산 조용한 시골집", "가족과 함께하기 좋아요.", 120000, 3, 2, 2, "예약 가능", "prop073.jpg", "N"));
        lists.add(new PropertyVO("prop074", "host050", "loc004", 1, "부산 럭셔리 아파트", "가족과 함께하기 좋아요.", 150000, 2, 1, 2, "예약 가능", "prop074.jpg", "N"));
        lists.add(new PropertyVO("prop075", "host050", "loc045", 3, "제주 힐링 하우스", "깔끔하고 편안한 공간입니다.", 150000, 1, 1, 1, "예약 가능", "prop075.jpg", "N"));

		for(PropertyVO p : lists) {
			if(dummyDAO.initProperty(p))
				System.out.println("property 등록 실패~ Num: " + p.getPropertyId());
			else
				System.out.println("property 등록 성공~ Num: " + p.getPropertyId());
		}
	}
}
