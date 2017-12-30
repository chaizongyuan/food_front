package com.res.model;

import java.util.List;
import java.util.Map;

import com.res.utils.JdbcUtlis;
import com.res.utils.Pager;

public class FoodUtils {

    /**
     * 获取总行数
     * 
     * @throws Exception
     * @throws NumberFormatException
     */
    public Integer getTotalCount(String typeID) throws NumberFormatException, Exception {
        
        String sqlEnd = " where TYPEID = " + typeID;
        
        if (typeID == null || "".equals(typeID)) {
            sqlEnd = "";
        }
        String sql = "select count(rowid) c from food" + sqlEnd;
        return Integer.valueOf(JdbcUtlis.getDataBySql(sql).get(0).get("C"));
    }
    
    /**
     * 根据菜品名获取总数量
     * @param foodName
     * @return
     * @throws Exception 
     * @throws NumberFormatException 
     */
    public Integer getTotalCountByFoodName(String foodName) throws NumberFormatException, Exception{
        String sql = "select count(rowid) c from food where FOODNAME like '%" + foodName + "%'";
        return Integer.valueOf(JdbcUtlis.getDataBySql(sql).get(0).get("C"));
    }


    /**
     * 获取菜品数据
     * @param curPage
     * @param typeID
     * @return
     * @throws Exception
     */
    public Pager getPager(Integer curPage, String typeID) throws Exception {
        Integer totalCount = getTotalCount(typeID);
        Pager pager = new Pager(curPage, totalCount, null);
        
        String sqlEnd = " and f.TYPEID like '%%'";
        
        if (typeID != null && !"".equals(typeID)) {
            sqlEnd = " and f.TYPEID = " + typeID;
        }
        
        String sql = "select * from (select f.* , ft.TYPENAME , rownum rn from food f inner join foodtype ft on f.TYPEID = ft.TYPEID" + sqlEnd + ") where rn >= "
                + pager.getStartIndex() + " and rn <= " + pager.getEndIndex();

        List<Map<String, String>> datas = JdbcUtlis.getDataBySql(sql);
        pager.setData(datas);
        return pager;
    }
    
    /**
     * 根据菜品名获取pager
     * @param foodName
     * @param curPage
     * @return
     * @throws NumberFormatException
     * @throws Exception
     */
    public Pager getPagerByFoodName(String foodName , Integer curPage) throws NumberFormatException, Exception{
        if (foodName == null) {
            foodName = "";
        }

        Integer totalCount = getTotalCountByFoodName(foodName);
        Pager pager = new Pager(curPage, totalCount, null);
        
        String sql = "select * from (select f.* , rownum rn from food f where f.FOODNAME like '%" + foodName
                + "%') where rn >= " + pager.getStartIndex() + " and rn <= " + pager.getEndIndex()
                + " order by FOODID";

        List<Map<String, String>> datas = JdbcUtlis.getDataBySql(sql);
        pager.setData(datas);
        return pager;
    }

    /**
     * 根据菜品ID获取菜品信息
     * 
     * @param foodID
     * @return
     * @throws Exception
     */
    public Map<String, String> getFoodInfoById(String foodID) throws Exception {
        String sql = "select * from food where FOODID = " + foodID;
        List<Map<String, String>> list = JdbcUtlis.getDataBySql(sql);
        return list.get(0);
    }
}