package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PaymentVO;

public class PaymentInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= payment init db =============================");
		List<PaymentVO> lists = new ArrayList<>();

		lists.add(new PaymentVO("pay001", "resv001", 240000, "카드", "완료"));
		lists.add(new PaymentVO("pay002", "resv002", 180000, "무통장입금", "대기"));
		lists.add(new PaymentVO("pay003", "resv003", 90000, "카드", "완료"));
		lists.add(new PaymentVO("pay004", "resv004", 210000, "카카오페이", "완료"));
		lists.add(new PaymentVO("pay005", "resv005", 200000, "카드", "취소"));

		for (PaymentVO p : lists) {
			if (dummyDAO.initPayment(p))
				System.out.println("Payment 등록 성공~ ID: " + p.getPaymentId());
			else
				System.out.println("Payment 등록 실패~ ID: " + p.getPaymentId());
		}
	}
}
