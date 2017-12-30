package com.res.controller.food;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.res.model.FoodUtils;

public class FoodDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodDetailServlet() {
        super();
    }

    FoodUtils fUtils = new FoodUtils();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    String foodId = request.getParameter("foodId");
	    String deskId = request.getParameter("deskId");
	    
	    try {
            List<Map<String, String>> list = new ArrayList<>();
            list.add(fUtils.getFoodInfoById(foodId));
            request.setAttribute("foodDetail", list);
            request.setAttribute("deskId", deskId);
            request.getRequestDispatcher("/detail/caixiangxi.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
