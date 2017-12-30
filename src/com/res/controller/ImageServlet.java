package com.res.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private static final String ABS_PATH = "E:/myImage/";
	
    public ImageServlet() {
        super();
    }

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String imageName = request.getParameter("imgName");
	    File f = new File(ABS_PATH + imageName);
	    BufferedImage bi = ImageIO.read(f);
	    ImageIO.write(bi, "png", response.getOutputStream());
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
