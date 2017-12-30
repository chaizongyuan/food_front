package com.res.controller.food;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.res.model.FoodUtils;
import com.res.utils.Pager;

/**
 * 菜品展示Servlet
 * @author Administrator
 *
 */
public class FoodListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FoodListServlet() {
        super();
    }

    FoodUtils fUtils = new FoodUtils();
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("UTF-8");
	    
	    String typeId = request.getParameter("typeId");
	    String foodName = request.getParameter("foodName");
	    String curPage = request.getParameter("curPage");
	    
	    Integer intCurPage = 1;
	    if (curPage != null && !"".equals(curPage)) {
            intCurPage = Integer.parseInt(curPage);
        }
	    
	    try {
           if (foodName != null) {
                Pager pager = fUtils.getPagerByFoodName(foodName, intCurPage);
                request.setAttribute("pager", pager);
                request.setAttribute("fName", foodName);
            } else {
                Pager pager = fUtils.getPager(intCurPage, typeId);
                request.setAttribute("pager", pager);
                
                // JSP翻页按钮中需要用到typeId
                request.setAttribute("typeId", typeId);
            }
            request.getRequestDispatcher("/detail/caidan.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
