package dummy.init;

import java.util.ArrayList;
import java.util.List;

import dummy.DummyAction;
import dummy.DummyDAO;
import dummy.vo.AmenitiesVO;

public class AmenitiesInitData implements DummyAction {

	@Override
	public void execute(DummyDAO dummyDAO) {
		System.out.println("============================= Amenities init db =============================");
		
		List<AmenitiesVO> amenities = new ArrayList<>();
		amenities.add(new AmenitiesVO(1, "Wi-Fi"));
		amenities.add(new AmenitiesVO(2, "Air Conditioning"));
		amenities.add(new AmenitiesVO(3, "Heating"));
		amenities.add(new AmenitiesVO(4, "Kitchen"));
		amenities.add(new AmenitiesVO(5, "Washer"));
		amenities.add(new AmenitiesVO(6, "Dryer"));
		amenities.add(new AmenitiesVO(7, "Free Parking"));
		amenities.add(new AmenitiesVO(8, "Pool"));
		amenities.add(new AmenitiesVO(9, "Gym"));
		amenities.add(new AmenitiesVO(10, "Pet Friendly"));

		
		
	}

}
