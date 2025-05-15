package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.WishListVO;

public class WishListInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= wish_list init db =============================");
		List<WishListVO> lists = new ArrayList<>();

		lists.add(new WishListVO("user001", "prop003"));
		lists.add(new WishListVO("user002", "prop002"));
		lists.add(new WishListVO("user003", "prop001"));
		lists.add(new WishListVO("user004", "prop003"));
		lists.add(new WishListVO("user005", "prop002"));

		for (WishListVO wl : lists) {
			if (dummyDAO.initWishList(wl))
				System.out.println("WishList 등록 성공~ User: " + wl.getUserId() + ", Property: " + wl.getPropertyId());
			else
				System.out.println("WishList 등록 실패~ User: " + wl.getUserId() + ", Property: " + wl.getPropertyId());
		}
	}
}
