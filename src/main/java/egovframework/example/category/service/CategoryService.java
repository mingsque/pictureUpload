package egovframework.example.category.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;


public interface CategoryService {

	ArrayList<CategoryVO> getCategoryList(CategoryVO param) throws Exception;

	int insertCategory(CategoryVO param) throws Exception;

	void deleteCategory(int no) throws Exception;

	int updateCategory(CategoryVO param) throws Exception;

	int insertSmallCategory(CategoryVO param) throws Exception;

	int updateSmallCategory(CategoryVO param) throws Exception;

	ArrayList<CategoryVO> getSmallCategoryList(CategoryVO param) throws Exception;

	void deleteSmallCategory(int no) throws Exception;

	ArrayList<CategoryVO> getCategoryListUsr(CategoryVO param) throws Exception;

	ArrayList<CategoryVO> getSmallCategoryListUsr(CategoryVO param) throws Exception;



}
