package com.res.model;

import com.res.utils.JdbcUtlis;

public class OrderUtils {

    /**
     * 获取即将要生成的订单ID
     * @return
     * @throws Exception
     */
    public Integer getMaxId() throws Exception{
        String sql = "select (nvl(max(ORDERID) , 0) + 1) maxId from foodorder";
        Integer maxId = Integer.parseInt(JdbcUtlis.getDataBySql(sql).get(0).get("MAXID"));
        return maxId;
    }
    
    /**
     * 获取到餐桌ID和订单ID，往数据库中插入。
     * @param deskId
     * @param orderId
     * @throws Exception
     */
    public void saveOrder(String deskId , Integer orderId , String totalMoney) throws Exception{
        String sql = "insert into foodorder values(" + orderId + " , " + deskId + " , sysdate , 0 , " + totalMoney + ")";
        JdbcUtlis.execute(sql);
    }
    
    /**
     * 生成订单详细
     * @param orderId
     * @param foodId
     * @param gCount
     * @throws Exception 
     */
    public void saveOrderDetail(Integer orderId , String foodId , String gCount) throws Exception{
        String sql = "insert into foodorderdetail values((select nvl(max(DETAILID) , 0) from foodorderdetail) + 1 , " + orderId + " , " + foodId + " , " + gCount + ")";
        JdbcUtlis.execute(sql);
    }
}
