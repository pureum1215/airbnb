package hostPage.hostPropertyRegister;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import util.ResponseData;

@MultipartConfig
public class HostPropertyRegisterAction {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException, ServletException, IOException {

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HostPropertyRegistDAO registDAO = new HostPropertyRegistDAO();

		/********
		 * request 불러오기
		 ********/

		/*******
		 * 주소값 담기
		 *******/
		String addr_detail = getFormField(request, "address");

		String addr_city = addr_detail.split(" ")[0] + " " + addr_detail.split(" ")[1];
		double addr_lng = Double.parseDouble(request.getParameter("address_lng"));// 경도 예시) 124.123
		double addr_lat = Double.parseDouble(request.getParameter("address_lat"));// 위도 예시) 30.123

		HostPropertyRegisterVO locvo = new HostPropertyRegisterVO();

		/*******
		 * 숙소 정보 담기
		 *******/
		String reservation_default = getFormField(request, "reservation_default");
		String property_name = getFormField(request, "listingTitle");
		String hostId = getFormField(request, "hostId");
		int rooms = Integer.parseInt(request.getParameter("rooms"));
		int bathrooms = Integer.parseInt(request.getParameter("bathrooms"));
		int beds = Integer.parseInt(request.getParameter("beds"));
		String description = getFormField(request, "description");
		int price = Integer.parseInt(request.getParameter("price"));
		int firstamenity = 0;

		String amarray = getFormField(request, "amenitiesArray");

		/**********
		 * 1. 숙소 등록 과정
		 **********/
		int propertyCnt = registDAO.initPropertyIdxCount();
		String cnt = String.format("%03d", propertyCnt);
		HostPropertyRegisterVO propvo = new HostPropertyRegisterVO();
		String propertyIdx = "prop" + cnt;

		/**********
		 * 1-1. 이미지 등록 과정
		 **********/
		String fileName = null;
		fileName = upload(request.getPart("image"), propertyIdx);
		if (fileName == null) {
			System.out.println("not image");
			return new ResponseData(500, "data false");
		}

		propvo.setProperty_id(propertyIdx);
		propvo.setHost_id(hostId);
		propvo.setAmenity_id(firstamenity);
		propvo.setProperty_name(property_name);
		propvo.setProperty_description(description);
		propvo.setPrice_per_night(price);
		propvo.setProperty_room(rooms);
		propvo.setProperty_bed(beds);
		propvo.setProperty_bathroom(bathrooms);
		propvo.setProperty_photo_url(fileName);
		propvo.setProperty_reservation_default(reservation_default);

		if (!registDAO.hostPropertyRegister(propvo)) {
			return new ResponseData(500, "data false");
		}

		System.out.println("insert propertyIDx: " + propertyIdx);

		/**********
		 * 2. 숙소 편의 시설 등록 과정
		 **********/
		String[] amenitiesArray = amarray.split(",");

		for (String li : amenitiesArray) {
			int amenityIdx = registDAO.getAmenityById(li);

			// -1이 표시 될 때, 실패
			if (amenityIdx == -1) {
				System.out.println("amenityIdx 찾을 수 없음 amenityIdx: " + amenityIdx);
				return new ResponseData(500, "data false");
			}

			if (!registDAO.insertPropertyAmenities(amenityIdx, propertyIdx)) {
				System.out.println(
						"PROPERTY_AMENITIES false / amenityIdx: " + amenityIdx + " / propertyIdx: " + propertyIdx);
				return new ResponseData(500, "data false");
			}
			System.out.println(li);
		}

		/**********
		 * 3. 위치 등록
		 **********/
		String locationIdx = "loc" + cnt;
		locvo.setLocation_id(locationIdx);
		locvo.setLocation_city(addr_city);
		locvo.setLocation_detail(addr_detail);
		locvo.setLocation_x(addr_lng);
		locvo.setLocation_y(addr_lat);
		locvo.setLocation_continent("아시아");
		locvo.setLocation_country("한국");
		// dao 등록
		if (!registDAO.locationInsert(locvo)) {
			System.out.println("LOCATION false / locationIdx: " + locationIdx);
			return new ResponseData(500, "data false");
		}

		// 숙소에 location Id 추가하기
		if (!registDAO.registerPropertyAddLocation(locationIdx, propertyIdx)) {
			System.out.println("LOCATION false / locationIdx: " + locationIdx);
			return new ResponseData(500, "data false");
		}

		// result3= registDAO.insertPropertyAmenities(amenityIds);

		ResponseData data = null;

		data = new ResponseData();

		return data;
	}

	// 텍스트 필드 UTF-8로 직접 읽는 함수
	private String getFormField(HttpServletRequest request, String name) throws IOException, ServletException {
		Part part = request.getPart(name);
		if (part == null)
			return null;

		try (BufferedReader reader = new BufferedReader(
				new InputStreamReader(part.getInputStream(), StandardCharsets.UTF_8))) {
			return reader.lines().collect(Collectors.joining());
		}
	}

	private String upload(Part filePart, String propertyIdx) {
		String fileName = "";
		try {

			// 확장자 추출 (선택사항)
			String submittedFileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
			String extension = "";
			int i = submittedFileName.lastIndexOf('.');
			if (i > 0) {
				extension = submittedFileName.substring(i); // ".jpg" 등
			}

			fileName = propertyIdx + extension;
			

			 String SAVE_DIR12 = "C:\\Users\\BIT\\property_photo"; // 저장 경로 윈도우는 여기서 바꾸기.

			//String SAVE_DIR12 ="/Users/jinjaehwan/property_photo";//mac 용 경로
			
			
			// 실제 저장 경로
			// String fullPath = SAVE_DIR12 + File.separator + fileName;

			File uploadDir = new File(SAVE_DIR12);
			if (!uploadDir.exists())
				uploadDir.mkdir();
			File file = new File(uploadDir, fileName);
			try (InputStream input = filePart.getInputStream()) {
				Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return fileName;
	}
}
