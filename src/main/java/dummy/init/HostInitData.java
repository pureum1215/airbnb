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
		
		lists.add(new HostVO("host001", "user001", "안녕하세요. 친절한 호스트입니다."));
		lists.add(new HostVO("host002", "user005", "감성적인 공간을 제공합니다."));
		lists.add(new HostVO("host003", "user007", "청결을 최우선으로 생각합니다."));
		lists.add(new HostVO("host004", "user010", "위치가 좋은 숙소를 운영합니다."));
		
		for(HostVO li : lists) {
			if(dummyDAO.initHost(li))
				System.out.println("host등록 실패~ Num: "+li.getHostId());
			else {
				System.out.println("host등록 성공~ Num: "+li.getHostId());
			}	
		}
		
	}

	
}
