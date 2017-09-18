package cn.com.zj.mapper;

import cn.com.zj.pojo.Bookclass;

public interface BookclassMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Bookclass record);

    int insertSelective(Bookclass record);

    Bookclass selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Bookclass record);

    int updateByPrimaryKey(Bookclass record);
}