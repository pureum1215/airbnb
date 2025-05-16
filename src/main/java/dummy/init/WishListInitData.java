package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.WishListVO;

public class WishListInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("🌟 Wish List Init");

        List<WishListVO> lists = new ArrayList<>();
        lists.add(new WishListVO("user061", "prop008"));
        lists.add(new WishListVO("user069", "prop011"));
        lists.add(new WishListVO("user007", "prop044"));
        lists.add(new WishListVO("user029", "prop035"));
        lists.add(new WishListVO("user054", "prop064"));
        lists.add(new WishListVO("user081", "prop047"));
        lists.add(new WishListVO("user013", "prop003"));
        lists.add(new WishListVO("user035", "prop037"));
        lists.add(new WishListVO("user018", "prop040"));
        lists.add(new WishListVO("user068", "prop074"));
        lists.add(new WishListVO("user016", "prop002"));
        lists.add(new WishListVO("user002", "prop001"));
        lists.add(new WishListVO("user049", "prop034"));
        lists.add(new WishListVO("user048", "prop008"));
        lists.add(new WishListVO("user002", "prop057"));
        lists.add(new WishListVO("user013", "prop004"));
        lists.add(new WishListVO("user060", "prop067"));
        lists.add(new WishListVO("user027", "prop063"));
        lists.add(new WishListVO("user003", "prop074"));
        lists.add(new WishListVO("user001", "prop013"));
        lists.add(new WishListVO("user030", "prop072"));
        lists.add(new WishListVO("user021", "prop007"));
        lists.add(new WishListVO("user099", "prop036"));
        lists.add(new WishListVO("user098", "prop004"));
        lists.add(new WishListVO("user031", "prop038"));
        lists.add(new WishListVO("user087", "prop034"));
        lists.add(new WishListVO("user005", "prop060"));
        lists.add(new WishListVO("user021", "prop011"));
        lists.add(new WishListVO("user048", "prop015"));
        lists.add(new WishListVO("user034", "prop062"));
        lists.add(new WishListVO("user006", "prop005"));
        lists.add(new WishListVO("user043", "prop071"));
        lists.add(new WishListVO("user058", "prop063"));
        lists.add(new WishListVO("user039", "prop007"));
        lists.add(new WishListVO("user065", "prop059"));
        lists.add(new WishListVO("user062", "prop061"));
        lists.add(new WishListVO("user049", "prop069"));
        lists.add(new WishListVO("user059", "prop016"));
        lists.add(new WishListVO("user049", "prop053"));
        lists.add(new WishListVO("user055", "prop073"));
        lists.add(new WishListVO("user075", "prop007"));
        lists.add(new WishListVO("user081", "prop008"));
        lists.add(new WishListVO("user028", "prop070"));
        lists.add(new WishListVO("user029", "prop055"));
        lists.add(new WishListVO("user061", "prop019"));
        lists.add(new WishListVO("user084", "prop027"));
        lists.add(new WishListVO("user083", "prop052"));
        lists.add(new WishListVO("user024", "prop047"));
        lists.add(new WishListVO("user097", "prop019"));
        lists.add(new WishListVO("user064", "prop057"));
        lists.add(new WishListVO("user091", "prop048"));
        lists.add(new WishListVO("user010", "prop007"));
        lists.add(new WishListVO("user082", "prop071"));
        lists.add(new WishListVO("user057", "prop067"));
        lists.add(new WishListVO("user081", "prop046"));
        lists.add(new WishListVO("user037", "prop023"));
        lists.add(new WishListVO("user047", "prop067"));
        lists.add(new WishListVO("user052", "prop058"));
        lists.add(new WishListVO("user043", "prop013"));
        lists.add(new WishListVO("user038", "prop030"));
        lists.add(new WishListVO("user033", "prop060"));
        lists.add(new WishListVO("user080", "prop074"));
        lists.add(new WishListVO("user028", "prop029"));
        lists.add(new WishListVO("user003", "prop015"));
        lists.add(new WishListVO("user067", "prop062"));
        lists.add(new WishListVO("user097", "prop051"));
        lists.add(new WishListVO("user097", "prop058"));
        lists.add(new WishListVO("user011", "prop009"));
        lists.add(new WishListVO("user057", "prop059"));
        lists.add(new WishListVO("user051", "prop059"));
        lists.add(new WishListVO("user045", "prop042"));
        lists.add(new WishListVO("user066", "prop005"));
        lists.add(new WishListVO("user048", "prop010"));
        lists.add(new WishListVO("user035", "prop066"));
        lists.add(new WishListVO("user095", "prop018"));
        lists.add(new WishListVO("user082", "prop018"));
        lists.add(new WishListVO("user073", "prop025"));
        lists.add(new WishListVO("user048", "prop053"));
        lists.add(new WishListVO("user021", "prop060"));
        lists.add(new WishListVO("user061", "prop030"));


		for (WishListVO wl : lists) {
			if (dummyDAO.initWishList(wl))
				System.out.println("WishList 등록 성공~ User: " + wl.getUserId() + ", Property: " + wl.getPropertyId());
			else
				System.out.println("WishList 등록 실패~ User: " + wl.getUserId() + ", Property: " + wl.getPropertyId());
		}
	}
}
