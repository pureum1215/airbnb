package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PaymentVO;

public class PaymentInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("💳 Payment Init");

        List<PaymentVO> lists = new ArrayList<>();
        lists.add(new PaymentVO("pay001", "res001", 70000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay002", "res002", 70000, "간편결제", "대기"));
        lists.add(new PaymentVO("pay003", "res003", 70000, "카드", "취소"));
        lists.add(new PaymentVO("pay004", "res004", 120000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay005", "res005", 120000, "간편결제", "대기"));
        lists.add(new PaymentVO("pay006", "res006", 120000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay007", "res007", 150000, "현금", "대기"));
        lists.add(new PaymentVO("pay008", "res008", 120000, "카드", "대기"));
        lists.add(new PaymentVO("pay009", "res009", 120000, "카드", "대기"));
        lists.add(new PaymentVO("pay010", "res010", 70000, "현금", "취소"));
        lists.add(new PaymentVO("pay011", "res011", 70000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay012", "res012", 70000, "현금", "완료"));
        lists.add(new PaymentVO("pay013", "res013", 70000, "카드", "대기"));
        lists.add(new PaymentVO("pay014", "res014", 70000, "카드", "완료"));
        lists.add(new PaymentVO("pay015", "res015", 70000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay016", "res016", 150000, "카드", "대기"));
        lists.add(new PaymentVO("pay017", "res017", 150000, "카드", "대기"));
        lists.add(new PaymentVO("pay018", "res018", 90000, "현금", "취소"));
        lists.add(new PaymentVO("pay019", "res019", 120000, "현금", "완료"));
        lists.add(new PaymentVO("pay020", "res020", 150000, "카드", "취소"));
        lists.add(new PaymentVO("pay021", "res021", 120000, "현금", "대기"));
        lists.add(new PaymentVO("pay022", "res022", 150000, "현금", "대기"));
        lists.add(new PaymentVO("pay023", "res023", 70000, "카드", "완료"));
        lists.add(new PaymentVO("pay024", "res024", 150000, "카드", "취소"));
        lists.add(new PaymentVO("pay025", "res025", 150000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay026", "res026", 90000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay027", "res027", 70000, "현금", "완료"));
        lists.add(new PaymentVO("pay028", "res028", 70000, "현금", "취소"));
        lists.add(new PaymentVO("pay029", "res029", 120000, "현금", "대기"));
        lists.add(new PaymentVO("pay030", "res030", 150000, "현금", "완료"));
        lists.add(new PaymentVO("pay031", "res031", 90000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay032", "res032", 70000, "카드", "완료"));
        lists.add(new PaymentVO("pay033", "res033", 70000, "카드", "취소"));
        lists.add(new PaymentVO("pay034", "res034", 90000, "카드", "대기"));
        lists.add(new PaymentVO("pay035", "res035", 70000, "현금", "대기"));
        lists.add(new PaymentVO("pay036", "res036", 70000, "카드", "완료"));
        lists.add(new PaymentVO("pay037", "res037", 70000, "현금", "대기"));
        lists.add(new PaymentVO("pay038", "res038", 70000, "간편결제", "대기"));
        lists.add(new PaymentVO("pay039", "res039", 120000, "카드", "대기"));
        lists.add(new PaymentVO("pay040", "res040", 90000, "현금", "대기"));
        lists.add(new PaymentVO("pay041", "res041", 150000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay042", "res042", 90000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay043", "res043", 120000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay044", "res044", 90000, "카드", "완료"));
        lists.add(new PaymentVO("pay045", "res045", 150000, "카드", "대기"));
        lists.add(new PaymentVO("pay046", "res046", 150000, "카드", "완료"));
        lists.add(new PaymentVO("pay047", "res047", 90000, "현금", "취소"));
        lists.add(new PaymentVO("pay048", "res048", 120000, "간편결제", "대기"));
        lists.add(new PaymentVO("pay049", "res049", 120000, "현금", "완료"));
        lists.add(new PaymentVO("pay050", "res050", 120000, "현금", "취소"));
        lists.add(new PaymentVO("pay051", "res051", 120000, "카드", "완료"));
        lists.add(new PaymentVO("pay052", "res052", 120000, "현금", "완료"));
        lists.add(new PaymentVO("pay053", "res053", 70000, "현금", "완료"));
        lists.add(new PaymentVO("pay054", "res054", 90000, "간편결제", "취소"));
        lists.add(new PaymentVO("pay055", "res055", 120000, "간편결제", "완료"));
        lists.add(new PaymentVO("pay056", "res056", 70000, "카드", "대기"));
        lists.add(new PaymentVO("pay057", "res057", 70000, "현금", "취소"));
        lists.add(new PaymentVO("pay058", "res058", 120000, "간편결제", "대기"));
        lists.add(new PaymentVO("pay059", "res059", 90000, "현금", "대기"));
        lists.add(new PaymentVO("pay060", "res060", 70000, "간편결제", "완료"));

		for (PaymentVO p : lists) {
			if (dummyDAO.initPayment(p))
				System.out.println("Payment 등록 성공~ ID: " + p.getPaymentId());
			else
				System.out.println("Payment 등록 실패~ ID: " + p.getPaymentId());
		}
	}
}
