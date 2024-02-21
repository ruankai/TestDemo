package com.yfvccm.service;
import com.yfvccm.domain.File;
import entity.PageResult;

/**
 * 图书接口
 */
public interface FileService {
    //查询最新上架的文件
    PageResult selectNewFiles(Integer pageNum, Integer pageSize);
    PageResult findByDepartment(Integer pageNum, Integer pageSize,String  department);
    //根据id查询文件信息
    File findById(String id);
    void deleteById(String id);
    void insertFile(File file);

    PageResult searchFiles(int pageNum, int pageSize, String queryStr0,String queryStr1,String queryStr2,String queryStr3);
    PageResult findDeiltDepartment(int pageNum, int pageSize, String department);



}
