package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.ReservationVO;

public class ReservationInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= reservation init db =============================");
		List<ReservationVO> lists = new ArrayList<>();

		lists.add(new ReservationVO("resv001", "prop001", "user002", "2025-06-01", "2025-06-03"));
		lists.add(new ReservationVO("resv002", "prop001", "user003", "2025-06-10", "2025-06-12"));
		lists.add(new ReservationVO("resv003", "prop002", "user006", "2025-06-05", "2025-06-06"));
		lists.add(new ReservationVO("resv004", "prop003", "user008", "2025-06-15", "2025-06-18"));
		lists.add(new ReservationVO("resv005", "prop003", "user005", "2025-07-01", "2025-07-03"));

		for (ReservationVO rv : lists) {
			if (dummyDAO.initReservation(rv))
				System.out.println("Reservation 등록 성공~ ID: " + rv.getReservationId());
			else
				System.out.println("Reservation 등록 실패~ ID: " + rv.getReservationId());
		}
	}
}
