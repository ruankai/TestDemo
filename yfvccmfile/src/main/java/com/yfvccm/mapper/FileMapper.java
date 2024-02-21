package com.yfvccm.mapper;
import com.github.pagehelper.Page;
import com.yfvccm.domain.File;
import org.apache.ibatis.annotations.*;
/**
 * 图书接口
 */
public interface FileMapper {


    @Select("SELECT * FROM FILE ORDER BY uploadtime DESC")
    Page<File> selectNewFiles();

    @Select("SELECT * FROM file where fileid=#{id1}")
//根据id查询图书信息
    File findById(String id1);

    @Select("SELECT * FROM file where author=#{department}  order by uploadtime desc")
    //根据部门查询最新的5个文件
    Page<File>  findByDepartment(String department);

    @Select("SELECT * FROM file where author=#{arg2}  order by uploadtime desc")
    Page<File> findDeiltDepartment(int pageNum, int pageSize, String department);


    @Delete("delete  FROM file where fileid=#{id}")
    void deleteById(String id);

//    @Insert("insert into file(fileid,filename)values (#{fileid},#{filename}")
    void insertFile(File file);

     @Select({"<script>"  +
            "SELECT * FROM file " +
            "where filename like CONCAT('%',#{arg2},'%')" +
            "<if test=\"#{arg3}!= null\"> AND  filename  like  CONCAT('%',#{arg3},'%')</if>" +
            "<if test=\"#{arg4}!= null\"> AND  filename  like  CONCAT('%',#{arg4},'%')</if>" +
            "<if test=\"#{arg5}!= null\"> AND  filename  like  CONCAT('%',#{arg5},'%')</if>" +
             " ORDER BY uploadtime desc"+
            "</script>"})
    Page<File> searchFiles(int pageNum, int pageSize, String queryStr0,String queryStr1,String queryStr2,String queryStr3);

}
