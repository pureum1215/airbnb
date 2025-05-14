package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


/**
 * Servlet implementation class test
 */
@WebServlet("/property/upload")
@MultipartConfig
public class test extends HttpServlet {
    private static final String SAVE_DIR = "C:/Users/BIT/property_photo"; // 저장 경로

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 업로드 파일 받아오기
        Part filePart = request.getPart("image");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // 실제 저장 경로
        String fullPath = SAVE_DIR + File.separator + fileName;
        filePart.write(fullPath);

        // DB에 넣을 이미지 URL (예: 웹에서 접근하는 URL 기준)
        String imageUrl = "/uploads/" + fileName;

        // 제목 받기
        String title = request.getParameter("title");



        response.sendRedirect("/show_test.jsp");
    }

}
