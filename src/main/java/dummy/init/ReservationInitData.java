package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.ReservationVO;

public class ReservationInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		   System.out.println("📅 Reservation Init");

	        List<ReservationVO> lists = new ArrayList<>();
	        lists.add(new ReservationVO("res001", "prop056", "user068", "2024-07-04", "2024-07-06"));
	        lists.add(new ReservationVO("res002", "prop043", "user092", "2024-06-12", "2024-06-17"));
	        lists.add(new ReservationVO("res003", "prop002", "user085", "2024-12-27", "2024-12-28"));
	        lists.add(new ReservationVO("res004", "prop008", "user029", "2024-11-20", "2024-11-26"));
	        lists.add(new ReservationVO("res005", "prop004", "user090", "2024-07-19", "2024-07-24"));
	        lists.add(new ReservationVO("res006", "prop001", "user060", "2024-11-10", "2024-11-11"));
	        lists.add(new ReservationVO("res007", "prop064", "user063", "2024-11-19", "2024-11-22"));
	        lists.add(new ReservationVO("res008", "prop031", "user093", "2024-10-24", "2024-10-26"));
	        lists.add(new ReservationVO("res009", "prop016", "user005", "2024-06-01", "2024-06-08"));
	        lists.add(new ReservationVO("res010", "prop015", "user089", "2024-10-18", "2024-10-23"));
	        lists.add(new ReservationVO("res011", "prop056", "user023", "2024-12-28", "2025-01-02"));
	        lists.add(new ReservationVO("res012", "prop048", "user019", "2024-07-06", "2024-07-07"));
	        lists.add(new ReservationVO("res013", "prop016", "user095", "2024-08-17", "2024-08-19"));
	        lists.add(new ReservationVO("res014", "prop047", "user033", "2024-12-04", "2024-12-08"));
	        lists.add(new ReservationVO("res015", "prop030", "user037", "2024-08-29", "2024-09-05"));
	        lists.add(new ReservationVO("res016", "prop001", "user032", "2024-11-15", "2024-11-17"));
	        lists.add(new ReservationVO("res017", "prop004", "user012", "2024-12-30", "2025-01-03"));
	        lists.add(new ReservationVO("res018", "prop061", "user035", "2024-11-07", "2024-11-09"));
	        lists.add(new ReservationVO("res019", "prop028", "user041", "2024-08-08", "2024-08-14"));
	        lists.add(new ReservationVO("res020", "prop038", "user061", "2024-12-18", "2024-12-19"));
	        lists.add(new ReservationVO("res021", "prop022", "user081", "2024-09-25", "2024-10-01"));
	        lists.add(new ReservationVO("res022", "prop027", "user029", "2024-06-20", "2024-06-25"));
	        lists.add(new ReservationVO("res023", "prop044", "user100", "2024-11-03", "2024-11-10"));
	        lists.add(new ReservationVO("res024", "prop075", "user044", "2024-10-10", "2024-10-15"));
	        lists.add(new ReservationVO("res025", "prop017", "user094", "2024-10-02", "2024-10-05"));
	        lists.add(new ReservationVO("res026", "prop048", "user017", "2024-09-01", "2024-09-04"));
	        lists.add(new ReservationVO("res027", "prop030", "user001", "2024-08-11", "2024-08-12"));
	        lists.add(new ReservationVO("res028", "prop029", "user098", "2024-08-19", "2024-08-22"));
	        lists.add(new ReservationVO("res029", "prop068", "user077", "2024-07-12", "2024-07-17"));
	        lists.add(new ReservationVO("res030", "prop004", "user070", "2024-12-09", "2024-12-13"));
	        lists.add(new ReservationVO("res031", "prop001", "user045", "2024-06-26", "2024-07-01"));
	        lists.add(new ReservationVO("res032", "prop011", "user002", "2024-12-01", "2024-12-04"));
	        lists.add(new ReservationVO("res033", "prop036", "user057", "2024-10-31", "2024-11-07"));
	        lists.add(new ReservationVO("res034", "prop040", "user064", "2024-12-16", "2024-12-23"));
	        lists.add(new ReservationVO("res035", "prop040", "user075", "2024-10-08", "2024-10-15"));
	        lists.add(new ReservationVO("res036", "prop002", "user030", "2024-08-20", "2024-08-23"));
	        lists.add(new ReservationVO("res037", "prop026", "user034", "2024-08-13", "2024-08-17"));
	        lists.add(new ReservationVO("res038", "prop052", "user097", "2024-11-11", "2024-11-17"));
	        lists.add(new ReservationVO("res039", "prop014", "user049", "2024-08-09", "2024-08-10"));
	        lists.add(new ReservationVO("res040", "prop055", "user097", "2024-06-12", "2024-06-19"));
	        lists.add(new ReservationVO("res041", "prop013", "user034", "2024-09-21", "2024-09-26"));
	        lists.add(new ReservationVO("res042", "prop011", "user092", "2024-08-17", "2024-08-19"));
	        lists.add(new ReservationVO("res043", "prop025", "user037", "2024-10-08", "2024-10-15"));
	        lists.add(new ReservationVO("res044", "prop024", "user072", "2024-11-02", "2024-11-09"));
	        lists.add(new ReservationVO("res045", "prop022", "user028", "2024-06-04", "2024-06-08"));
	        lists.add(new ReservationVO("res046", "prop030", "user031", "2024-06-06", "2024-06-08"));
	        lists.add(new ReservationVO("res047", "prop043", "user096", "2024-06-17", "2024-06-22"));
	        lists.add(new ReservationVO("res048", "prop035", "user049", "2024-11-18", "2024-11-20"));
	        lists.add(new ReservationVO("res049", "prop062", "user007", "2024-10-06", "2024-10-12"));
	        lists.add(new ReservationVO("res050", "prop006", "user099", "2024-08-31", "2024-09-05"));
	        lists.add(new ReservationVO("res051", "prop038", "user099", "2024-12-29", "2024-12-31"));
	        lists.add(new ReservationVO("res052", "prop006", "user098", "2024-06-27", "2024-07-04"));
	        lists.add(new ReservationVO("res053", "prop039", "user054", "2024-07-08", "2024-07-10"));
	        lists.add(new ReservationVO("res054", "prop016", "user038", "2024-12-27", "2024-12-29"));
	        lists.add(new ReservationVO("res055", "prop047", "user015", "2024-10-19", "2024-10-20"));
	        lists.add(new ReservationVO("res056", "prop008", "user040", "2024-08-28", "2024-08-30"));
	        lists.add(new ReservationVO("res057", "prop017", "user016", "2024-08-29", "2024-09-01"));
	        lists.add(new ReservationVO("res058", "prop058", "user018", "2024-06-09", "2024-06-15"));
	        lists.add(new ReservationVO("res059", "prop052", "user077", "2024-10-31", "2024-11-05"));
	        lists.add(new ReservationVO("res060", "prop026", "user074", "2024-11-26", "2024-12-03"));

		for (ReservationVO rv : lists) {
			if (dummyDAO.initReservation(rv))
				System.out.println("Reservation 등록 성공~ ID: " + rv.getReservationId());
			else
				System.out.println("Reservation 등록 실패~ ID: " + rv.getReservationId());
		}
	}
}
