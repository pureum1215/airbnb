package dummy.init;

import java.util.*;
import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.PropertyAmenitiesVO;

public class PropertyAmenitiesInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= property_amenities init db =============================");
		List<PropertyAmenitiesVO> lists = new ArrayList<>();

		lists.add(new PropertyAmenitiesVO(1, "prop001"));
		lists.add(new PropertyAmenitiesVO(2, "prop001"));
		lists.add(new PropertyAmenitiesVO(3, "prop002"));
		lists.add(new PropertyAmenitiesVO(1, "prop002"));
		lists.add(new PropertyAmenitiesVO(4, "prop003"));
		lists.add(new PropertyAmenitiesVO(5, "prop003"));

		for(PropertyAmenitiesVO pa : lists) {
			if(dummyDAO.initPropertyAmenities(pa))
				System.out.println("Property_Amenities 등록 성공~ Property: " + pa.getPropertyId() + ", Amenity: " + pa.getAmenityId());
			else
				System.out.println("Property_Amenities 등록 실패~ Property: " + pa.getPropertyId() + ", Amenity: " + pa.getAmenityId());
		}
	}
}
