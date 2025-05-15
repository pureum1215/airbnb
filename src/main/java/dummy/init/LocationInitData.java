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
		
		lists.add(new LocationVO("loc001", "Seoul", "South Korea", "Asia", "Seoul Street 101, Apt 1", 126.9001, 37.5001));
        lists.add(new LocationVO("loc002", "Barcelona", "Spain", "Europe", "Barcelona Street 102, Apt 2", 126.9002, 37.5002));
        lists.add(new LocationVO("loc003", "Sydney", "Australia", "Oceania", "Sydney Street 103, Apt 3", 126.9003, 37.5003));
        lists.add(new LocationVO("loc004", "Sydney", "Australia", "Oceania", "Sydney Street 104, Apt 4", 126.9004, 37.5004));
        lists.add(new LocationVO("loc005", "Tokyo", "Japan", "Asia", "Tokyo Street 105, Apt 5", 126.9005, 37.5005));
        lists.add(new LocationVO("loc006", "London", "UK", "Europe", "London Street 106, Apt 6", 126.9006, 37.5006));
        lists.add(new LocationVO("loc007", "Bangkok", "Thailand", "Asia", "Bangkok Street 107, Apt 7", 126.9007, 37.5007));
        lists.add(new LocationVO("loc008", "Berlin", "Germany", "Europe", "Berlin Street 108, Apt 8", 126.9008, 37.5008));
        lists.add(new LocationVO("loc009", "Bangkok", "Thailand", "Asia", "Bangkok Street 109, Apt 9", 126.9009, 37.5009));
        lists.add(new LocationVO("loc010", "Bangkok", "Thailand", "Asia", "Bangkok Street 110, Apt 10", 126.901, 37.501));
        lists.add(new LocationVO("loc011", "Sydney", "Australia", "Oceania", "Sydney Street 111, Apt 11", 126.9011, 37.5011));
        lists.add(new LocationVO("loc012", "Tokyo", "Japan", "Asia", "Tokyo Street 112, Apt 12", 126.9012, 37.5012));
        lists.add(new LocationVO("loc013", "Bangkok", "Thailand", "Asia", "Bangkok Street 113, Apt 13", 126.9013, 37.5013));
        lists.add(new LocationVO("loc014", "Bangkok", "Thailand", "Asia", "Bangkok Street 114, Apt 14", 126.9014, 37.5014));
        lists.add(new LocationVO("loc015", "London", "UK", "Europe", "London Street 115, Apt 15", 126.9015, 37.5015));
        lists.add(new LocationVO("loc016", "Berlin", "Germany", "Europe", "Berlin Street 116, Apt 16", 126.9016, 37.5016));
        lists.add(new LocationVO("loc017", "Tokyo", "Japan", "Asia", "Tokyo Street 117, Apt 17", 126.9017, 37.5017));
        lists.add(new LocationVO("loc018", "Bangkok", "Thailand", "Asia", "Bangkok Street 118, Apt 18", 126.9018, 37.5018));
        lists.add(new LocationVO("loc019", "London", "UK", "Europe", "London Street 119, Apt 19", 126.9019, 37.5019));
        lists.add(new LocationVO("loc020", "Paris", "France", "Europe", "Paris Street 120, Apt 20", 126.902, 37.502));
        lists.add(new LocationVO("loc021", "London", "UK", "Europe", "London Street 121, Apt 21", 126.9021, 37.5021));
        lists.add(new LocationVO("loc022", "Barcelona", "Spain", "Europe", "Barcelona Street 122, Apt 22", 126.9022, 37.5022));
        lists.add(new LocationVO("loc023", "Tokyo", "Japan", "Asia", "Tokyo Street 123, Apt 23", 126.9023, 37.5023));
        lists.add(new LocationVO("loc024", "Paris", "France", "Europe", "Paris Street 124, Apt 24", 126.9024, 37.5024));
        lists.add(new LocationVO("loc025", "Toronto", "Canada", "North America", "Toronto Street 125, Apt 25", 126.9025, 37.5025));
        lists.add(new LocationVO("loc026", "Seoul", "South Korea", "Asia", "Seoul Street 126, Apt 26", 126.9026, 37.5026));
        lists.add(new LocationVO("loc027", "Bangkok", "Thailand", "Asia", "Bangkok Street 127, Apt 27", 126.9027, 37.5027));
        lists.add(new LocationVO("loc028", "Toronto", "Canada", "North America", "Toronto Street 128, Apt 28", 126.9028, 37.5028));
        lists.add(new LocationVO("loc029", "Tokyo", "Japan", "Asia", "Tokyo Street 129, Apt 29", 126.9029, 37.5029));
        lists.add(new LocationVO("loc030", "Berlin", "Germany", "Europe", "Berlin Street 130, Apt 30", 126.903, 37.503));
        lists.add(new LocationVO("loc031", "London", "UK", "Europe", "London Street 131, Apt 31", 126.9031, 37.5031));
        lists.add(new LocationVO("loc032", "Toronto", "Canada", "North America", "Toronto Street 132, Apt 32", 126.9032, 37.5032));
        lists.add(new LocationVO("loc033", "New York", "USA", "North America", "New York Street 133, Apt 33", 126.9033, 37.5033));
        lists.add(new LocationVO("loc034", "Berlin", "Germany", "Europe", "Berlin Street 134, Apt 34", 126.9034, 37.5034));
        lists.add(new LocationVO("loc035", "Bangkok", "Thailand", "Asia", "Bangkok Street 135, Apt 35", 126.9035, 37.5035));
        lists.add(new LocationVO("loc036", "Toronto", "Canada", "North America", "Toronto Street 136, Apt 36", 126.9036, 37.5036));
        lists.add(new LocationVO("loc037", "Tokyo", "Japan", "Asia", "Tokyo Street 137, Apt 37", 126.9037, 37.5037));
        lists.add(new LocationVO("loc038", "New York", "USA", "North America", "New York Street 138, Apt 38", 126.9038, 37.5038));
        lists.add(new LocationVO("loc039", "London", "UK", "Europe", "London Street 139, Apt 39", 126.9039, 37.5039));
        lists.add(new LocationVO("loc040", "Tokyo", "Japan", "Asia", "Tokyo Street 140, Apt 40", 126.904, 37.504));
        lists.add(new LocationVO("loc041", "Tokyo", "Japan", "Asia", "Tokyo Street 141, Apt 41", 126.9041, 37.5041));
        lists.add(new LocationVO("loc042", "Barcelona", "Spain", "Europe", "Barcelona Street 142, Apt 42", 126.9042, 37.5042));
        lists.add(new LocationVO("loc043", "Tokyo", "Japan", "Asia", "Tokyo Street 143, Apt 43", 126.9043, 37.5043));
        lists.add(new LocationVO("loc044", "Barcelona", "Spain", "Europe", "Barcelona Street 144, Apt 44", 126.9044, 37.5044));
        lists.add(new LocationVO("loc045", "London", "UK", "Europe", "London Street 145, Apt 45", 126.9045, 37.5045));
        lists.add(new LocationVO("loc046", "Tokyo", "Japan", "Asia", "Tokyo Street 146, Apt 46", 126.9046, 37.5046));
        lists.add(new LocationVO("loc047", "London", "UK", "Europe", "London Street 147, Apt 47", 126.9047, 37.5047));
        lists.add(new LocationVO("loc048", "Berlin", "Germany", "Europe", "Berlin Street 148, Apt 48", 126.9048, 37.5048));
        lists.add(new LocationVO("loc049", "Bangkok", "Thailand", "Asia", "Bangkok Street 149, Apt 49", 126.9049, 37.5049));
        lists.add(new LocationVO("loc050", "Berlin", "Germany", "Europe", "Berlin Street 150, Apt 50", 126.905, 37.505));
        lists.add(new LocationVO("loc051", "Paris", "France", "Europe", "Paris Street 151, Apt 51", 126.9051, 37.5051));
        lists.add(new LocationVO("loc052", "Seoul", "South Korea", "Asia", "Seoul Street 152, Apt 52", 126.9052, 37.5052));
        lists.add(new LocationVO("loc053", "Paris", "France", "Europe", "Paris Street 153, Apt 53", 126.9053, 37.5053));
        lists.add(new LocationVO("loc054", "Barcelona", "Spain", "Europe", "Barcelona Street 154, Apt 54", 126.9054, 37.5054));
        lists.add(new LocationVO("loc055", "Paris", "France", "Europe", "Paris Street 155, Apt 55", 126.9055, 37.5055));
        lists.add(new LocationVO("loc056", "Berlin", "Germany", "Europe", "Berlin Street 156, Apt 56", 126.9056, 37.5056));
        lists.add(new LocationVO("loc057", "Berlin", "Germany", "Europe", "Berlin Street 157, Apt 57", 126.9057, 37.5057));
        lists.add(new LocationVO("loc058", "Berlin", "Germany", "Europe", "Berlin Street 158, Apt 58", 126.9058, 37.5058));
        lists.add(new LocationVO("loc059", "New York", "USA", "North America", "New York Street 159, Apt 59", 126.9059, 37.5059));
        lists.add(new LocationVO("loc060", "Tokyo", "Japan", "Asia", "Tokyo Street 160, Apt 60", 126.906, 37.506));
        lists.add(new LocationVO("loc061", "Toronto", "Canada", "North America", "Toronto Street 161, Apt 61", 126.9061, 37.5061));
        lists.add(new LocationVO("loc062", "Berlin", "Germany", "Europe", "Berlin Street 162, Apt 62", 126.9062, 37.5062));
        lists.add(new LocationVO("loc063", "New York", "USA", "North America", "New York Street 163, Apt 63", 126.9063, 37.5063));
        lists.add(new LocationVO("loc064", "Seoul", "South Korea", "Asia", "Seoul Street 164, Apt 64", 126.9064, 37.5064));
        lists.add(new LocationVO("loc065", "Tokyo", "Japan", "Asia", "Tokyo Street 165, Apt 65", 126.9065, 37.5065));
        lists.add(new LocationVO("loc066", "Bangkok", "Thailand", "Asia", "Bangkok Street 166, Apt 66", 126.9066, 37.5066));
        lists.add(new LocationVO("loc067", "Sydney", "Australia", "Oceania", "Sydney Street 167, Apt 67", 126.9067, 37.5067));
        lists.add(new LocationVO("loc068", "Seoul", "South Korea", "Asia", "Seoul Street 168, Apt 68", 126.9068, 37.5068));
        lists.add(new LocationVO("loc069", "London", "UK", "Europe", "London Street 169, Apt 69", 126.9069, 37.5069));
        lists.add(new LocationVO("loc070", "Barcelona", "Spain", "Europe", "Barcelona Street 170, Apt 70", 126.907, 37.507));
        lists.add(new LocationVO("loc071", "London", "UK", "Europe", "London Street 171, Apt 71", 126.9071, 37.5071));
        lists.add(new LocationVO("loc072", "Tokyo", "Japan", "Asia", "Tokyo Street 172, Apt 72", 126.9072, 37.5072));
        lists.add(new LocationVO("loc073", "Tokyo", "Japan", "Asia", "Tokyo Street 173, Apt 73", 126.9073, 37.5073));
        lists.add(new LocationVO("loc074", "London", "UK", "Europe", "London Street 174, Apt 74", 126.9074, 37.5074));
        lists.add(new LocationVO("loc075", "Paris", "France", "Europe", "Paris Street 175, Apt 75", 126.9075, 37.5075));

		for(LocationVO li : lists) {
			if(dummyDAO.initLocation(li)) {
				System.out.println("실패하였습니다.");
			}else {
				System.out.println("성공하였습니다.");
			}
		}
	
	}
	
}
