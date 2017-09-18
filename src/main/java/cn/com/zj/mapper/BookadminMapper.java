package cn.com.zj.mapper;

import java.util.List;


import cn.com.zj.pojo.Bookadmin;

public interface BookadminMapper {
    int insert(Bookadmin record);

    int insertSelective(Bookadmin record);
    
    Bookadmin AdminLoginSelect(Bookadmin aBookadmin);
    
    List<Bookadmin> selectAllAdmin();
}