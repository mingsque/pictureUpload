package egovframework.example.category.service.impl;

import java.util.ArrayList;

import egovframework.example.category.service.CategoryVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("categoryMapper")
public interface CategoryMapper {

	ArrayList<CategoryVO> getCategoryList(CategoryVO param) throws Exception;

	int insertCategory(CategoryVO param) throws Exception;

	void deleteCategory(int no) throws Exception;

	void updateCategory(CategoryVO param) throws Exception;

	int insertSmallCategory(CategoryVO param) throws Exception;

	void updateSmallCategory(CategoryVO param) throws Exception;

	ArrayList<CategoryVO> getSmallCategoryList(CategoryVO param) throws Exception;

	void deleteSmallCategory(int no) throws Exception;

	ArrayList<CategoryVO> getCategoryListUsr(CategoryVO param) throws Exception;

	ArrayList<CategoryVO> getSmallCategoryListUsr(CategoryVO param) throws Exception;
	
}
