package dummy.init;

import java.util.ArrayList;
import java.util.List;

import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.HostVO;

/***
 * 유저 데이터 가공
 * 작성자: 명희승
 */
public class HostInitData implements DummyAction{

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("😼😼😼😼😼😼😼😼hostInitDB😼😼😼😼😼😼😼");
		List<HostVO> lists = new ArrayList();
		
        String[] bios = {
                "친절함을 최우선으로 생각합니다.",
                "감성적인 숙소를 운영하고 있어요.",
                "청결에 자신 있는 숙소입니다!",
                "편안한 휴식을 제공하겠습니다.",
                "도심 속 아늑한 공간이에요.",
                "바다 근처 감성 숙소입니다.",
                "산책하기 좋은 동네에 위치해요.",
                "조용하고 힐링되는 공간입니다.",
                "반려동물과 함께할 수 있어요.",
                "합리적인 가격과 최고의 위치!",
                "아름다운 정원이 있는 숙소입니다.",
                "야경이 멋진 숙소를 원하시나요?",
                "아이들과 함께하기 좋은 공간입니다.",
                "소중한 추억을 만들 수 있어요.",
                "모던하고 세련된 인테리어!",
                "매일 정성스럽게 청소합니다.",
                "지하철과 가까운 위치!",
                "편리한 셀프 체크인이 가능해요.",
                "호스트가 직접 꾸민 숙소예요.",
                "여행의 피로를 풀 수 있는 숙소입니다."
            };

            for (int i = 1; i <= 50; i++) {
                String hostId = String.format("host%03d", i);
                String userId = String.format("user%03d", i); // user001 ~ user050
                String bio = bios[i % bios.length]; // 다양한 문구 순환
                lists.add(new HostVO(hostId, userId, bio));
            }
		
		for(HostVO li : lists) {
			if(dummyDAO.initHost(li))
				System.out.println("host등록 실패~ Num: "+li.getHostId());
			else {
				System.out.println("host등록 성공~ Num: "+li.getHostId());
			}	
		}
		
	}

	
}
