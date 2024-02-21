package com.yfvccm.service.impl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.yfvccm.domain.File;
import com.yfvccm.mapper.FileMapper;
import com.yfvccm.service.FileService;
import entity.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class FileServiceImpl implements FileService {
    @Autowired
    private FileMapper fileMapper;

    /**
     * 根据当前页码和每页需要展示的数据条数，查询最新上架的图书信息
     * @param pageNum 当前页码
     * @param pageSize 每页显示数量
     */
    @Override
    public PageResult selectNewFiles(Integer pageNum, Integer pageSize) {
        // 设置分页查询的参数，开始分页
        PageHelper.startPage(pageNum, pageSize);
        Page<File> page=fileMapper.selectNewFiles();
        return new PageResult(page.getTotal(),page.getResult());
    }

    @Override
    public PageResult findByDepartment(Integer pageNum, Integer pageSize,String  department) {
        // 设置分页查询的参数，开始分页
        PageHelper.startPage(pageNum, pageSize);
        Page<File> page=fileMapper.findByDepartment(department);
        return new PageResult(page.getTotal(),page.getResult());
    }

    /**
     * 根据id查询文件信息
     * @param id 文件id
     */
    public File findById(String id) {
        return fileMapper.findById(id);
    }

    public void deleteById(String id) {
         fileMapper.deleteById(id);
    }

    public void insertFile(File file){
        fileMapper.insertFile(file);
    }

    @Override
    public PageResult searchFiles(int pageNum, int pageSize, String queryStr0,String queryStr1,String queryStr2,String queryStr3) {
        // 设置分页查询的参数，开始分页
        PageHelper.startPage(pageNum, pageSize);
        Page<File> page=fileMapper.searchFiles(pageNum, pageSize, queryStr0,queryStr1,queryStr2,queryStr3);
        return new PageResult(page.getTotal(),page.getResult());
    }

    public PageResult findDeiltDepartment(int pageNum, int pageSize, String department){
        PageHelper.startPage(pageNum, pageSize);
        Page<File> page=fileMapper.findDeiltDepartment( pageNum, pageSize, department);
        return new PageResult(page.getTotal(),page.getResult());
    }
}
