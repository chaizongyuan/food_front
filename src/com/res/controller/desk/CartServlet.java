package com.res.controller.desk;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.res.model.FoodUtils;
import com.res.model.OrderUtils;

/**
 * 餐车Servlet
 * 
 * @author Administrator
 *
 */
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CartServlet() {
        super();
    }

    OrderUtils orderUtils = new OrderUtils();
    FoodUtils foodUtils = new FoodUtils();


    @SuppressWarnings("unchecked")
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        String foodId = request.getParameter("foodId");
        String foodName = request.getParameter("foodName");
        String price = request.getParameter("price");
        String flag = request.getParameter("flag");

        HttpSession session = request.getSession();

        if ("delete".equals(flag)) {

            // 从购物车中移除
            session.removeAttribute("cart_" + foodId);

        } else if ("order".equals(flag)) {
            // 先生成订单，再生成对应的订单详细表。
            try {

                String totalMoney = request.getParameter("totalMoney").split("\\s")[1];
                System.out.println(totalMoney);
                
                // 生成订单ID
                Integer orderId = orderUtils.getMaxId();

                // 餐桌ID
                String deskId = session.getAttribute("deskId").toString();
                
                // 生成订单
                orderUtils.saveOrder(deskId, orderId , totalMoney);
                
                // 遍历session，获取订单详细表需要的数据
                Enumeration<String> enumeration = session.getAttributeNames();
                
                // 将数据保存list，到结账页面做回显
                List<Map<String, String>> list = new ArrayList<>();
                while (enumeration.hasMoreElements()) {
                    // 取出key
                    String key = enumeration.nextElement();
                    if (key.startsWith("cart_")) {      // 购物车
                        
                        Map<String, String> map = (Map<String, String>) session.getAttribute(key);
                        String gCount = map.get("count");
                        
                        String fid = map.get("foodId");
                        orderUtils.saveOrderDetail(orderId, fid, gCount);    // 循环一次就是一条菜品信息，刚好和详情表对应上
                        list.add(map);
                    }
                }
                
                // 下完单之后提示一下用户，然后把session注销即可。
                session.invalidate();
                
                request.setAttribute("list", list);
                request.getRequestDispatcher("/detail/clientOrderList.jsp").forward(request, response);
                return;
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else if ("addToCart".equals(flag)) {
            
            // 添加至餐车

            Map<String, String> tempDetail = (Map<String, String>) session.getAttribute("cart_" + foodId);

            // 根据foodId创建容器
            if (tempDetail == null) {
                try {
                    Map<String, String> foodDetail = new HashMap<>();
                    foodDetail.put("count", "1");
                    foodDetail.put("price", price);
                    foodDetail.put("foodId", foodId);
                    foodDetail.put("foodName", foodName);
                    session.setAttribute("cart_" + foodId, foodDetail);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {

                // 不是第一次使用餐车时就取出对应的菜，数量累加1
                Map<String, String> foodDetail = (Map<String, String>) session.getAttribute("cart_" + foodId);

                String count = foodDetail.get("count");
                count = String.valueOf((Integer.parseInt(count) + 1));
                foodDetail.put("count", count);
                session.setAttribute("cart_" + foodId, foodDetail);
            }
        } 
       request.getRequestDispatcher("/detail/clientCart.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
