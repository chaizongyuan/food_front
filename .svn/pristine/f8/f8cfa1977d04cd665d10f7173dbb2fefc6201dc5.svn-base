package com.res.model;

import java.util.List;
import java.util.Map;

import com.res.utils.JdbcUtlis;

public class FoodTypeUtils {

    /**
     * 获取总行数
     * 
     * @throws Exception
     * @throws NumberFormatException
     */
    public Integer getTotalCount() throws NumberFormatException, Exception {
        String sql = "select count(rowid) c from foodtype";
        return Integer.valueOf(JdbcUtlis.getDataBySql(sql).get(0).get("C"));
    }

    /**
     * 根据菜系ID获取菜系名
     * @param typeID
     * @return
     * @throws Exception
     */
    public static String getTypeNameById(String typeID) throws Exception {
        String sql = "select TYPENAME from foodtype where TYPEID = " + typeID;
        List<Map<String, String>> list = JdbcUtlis.getDataBySql(sql);
        return list.get(0).get("TYPENAME");
    }

    /**
     * 获取所有菜系名以及ID
     * 
     * @return
     * @throws Exception
     */
    public List<Map<String, String>> getAllType() throws Exception {
        String sql = "select TYPENAME , TYPEID from foodtype";
        List<Map<String, String>> list = JdbcUtlis.getDataBySql(sql);
        return list;
    }
}
