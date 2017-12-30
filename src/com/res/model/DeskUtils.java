package com.res.model;

import java.util.List;
import java.util.Map;

import com.res.utils.JdbcUtlis;
import com.res.utils.Pager;

/**
 * 前台界面的工具类
 * 
 * @author Administrator
 *
 */
public class DeskUtils {

    /**
     * 获取总行数
     * 
     * @param deskName
     * @return
     * @throws NumberFormatException
     * @throws Exception
     */
    public Integer getTotalCount() throws NumberFormatException, Exception {
        String sql = "select count(rowid) c from desk";
        return Integer.valueOf(JdbcUtlis.getDataBySql(sql).get(0).get("C"));
    }

    /**
     * 获取餐桌列表
     * 
     * @param curPage
     * @return
     * @throws Exception
     */
    public Pager getPager(Integer curPage) throws Exception {

        Integer totalCount = getTotalCount();
        Pager pager = new Pager(curPage, totalCount, null);

        List<Map<String, String>> datas = JdbcUtlis
                .getDataBySql("select * from (select d.* , rownum rn from desk d) where rn >= " + pager.getStartIndex()
                        + " and rn <= " + pager.getEndIndex() + " order by DESKID");
        pager.setData(datas);
        return pager;
    }

    /**
     * 订桌 
     * @param deskId
     * @throws Exception
     */
    public void subDesk(String deskId) throws Exception {
        String sql = "update desk set dstate = 1 , dtime = sysdate where deskid = " + deskId;
        JdbcUtlis.execute(sql);
    }
    
    // 重置所有餐桌状态
    public static void main(String[] args) throws Exception {
        String sql = "update desk set dstate = 0 , dtime = ''";
        System.out.println(JdbcUtlis.execute(sql));
    }
}
