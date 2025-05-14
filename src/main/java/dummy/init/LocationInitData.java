package dummy.init;

import java.util.ArrayList;
import java.util.List;

import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.LocationVO;

public class LocationInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("😼😼😼😼😼😼😼😼locationInitDB😼😼😼😼😼😼😼");
		List<LocationVO> lists = new ArrayList();
		
		lists.add(new LocationVO("loc001", "Seoul", "South Korea", "Asia", "서울특별시 중구 세종대로 110", 126.9779692, 37.566535));
		lists.add(new LocationVO("loc002", "Tokyo", "Japan", "Asia", "東京都千代田区千代田1-1", 139.6917064, 35.689487));
		lists.add(new LocationVO("loc003", "Paris", "France", "Europe", "Place de la Concorde, 75008 Paris", 2.3522219, 48.856614));
		lists.add(new LocationVO("loc004", "New York", "USA", "North America", "350 5th Ave, New York, NY 10118", -73.985656, 40.748817));
		lists.add(new LocationVO("loc005", "Sydney", "Australia", "Oceania", "Bennelong Point, Sydney NSW 2000", 151.2152967, -33.8567844));
		lists.add(new LocationVO("loc006", "Cairo", "Egypt", "Africa", "Tahrir Square, Cairo", 31.2357116, 30.0444196));
		lists.add(new LocationVO("loc007", "Rio de Janeiro", "Brazil", "South America", "Praia de Copacabana, Rio de Janeiro", -43.180278, -22.971111));
		lists.add(new LocationVO("loc008", "London", "United Kingdom", "Europe", "Westminster, London SW1A 0AA", -0.1277583, 51.5073509));
		lists.add(new LocationVO("loc009", "Bangkok", "Thailand", "Asia", "Grand Palace, Bangkok", 100.4913, 13.7500));
		lists.add(new LocationVO("loc010", "Toronto", "Canada", "North America", "CN Tower, Toronto, ON M5V 3L9", -79.3871, 43.6426));
	
		for(LocationVO li : lists) {
			if(dummyDAO.initLocation(li)) {
				System.out.println("실패하였습니다.");
			}else {
				System.out.println("성공하였습니다.");
			}
		}
	
	}
	
}
