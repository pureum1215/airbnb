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

		lists.add(new PropertyVO("prop001", "host001", "loc001", 1, "서울 강남 아파트", "럭셔리한 강남 한복판 아파트", 120000, 2, 2, 1, "예약 가능", "http://image.com/1.jpg", "N"));
		lists.add(new PropertyVO("prop002", "host002", "loc002", 2, "부산 해운대 뷰", "바다 보이는 오션뷰", 90000, 1, 1, 1, "예약 가능", "http://image.com/2.jpg", "N"));
		lists.add(new PropertyVO("prop003", "host003", "loc003", 3, "제주 독채 민박", "조용한 시골의 독채", 70000, 3, 2, 2, "예약 가능", "http://image.com/3.jpg", "N"));

		for(PropertyVO p : lists) {
			if(dummyDAO.initProperty(p))
				System.out.println("property 등록 실패~ Num: " + p.getPropertyId());
			else
				System.out.println("property 등록 성공~ Num: " + p.getPropertyId());
		}
	}
}
