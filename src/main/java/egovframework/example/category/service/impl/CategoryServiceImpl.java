package egovframework.example.category.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.category.service.CategoryService;
import egovframework.example.category.service.CategoryVO;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Resource(name = "categoryMapper")
	private CategoryMapper categoryMapper;

	@Override
	public ArrayList<CategoryVO> getCategoryList(CategoryVO param) throws Exception {
		return categoryMapper.getCategoryList(param);
	}
	
	@Override
	public ArrayList<CategoryVO> getCategoryListUsr(CategoryVO param) throws Exception {
		return categoryMapper.getCategoryListUsr(param);
	}

	@Override
	public int insertCategory(CategoryVO param) throws Exception {
		return categoryMapper.insertCategory(param);
	}

	@Override
	public void deleteCategory(int no) throws Exception {
		categoryMapper.deleteCategory(no);
	}

	@Override
	public int updateCategory(CategoryVO param) throws Exception {
		try {
			categoryMapper.updateCategory(param);
			return 1;
		} catch(Exception err) {
			return 0;
		}
	}

	@Override
	public int insertSmallCategory(CategoryVO param) throws Exception {
		return categoryMapper.insertSmallCategory(param);
	}

	@Override
	public int updateSmallCategory(CategoryVO param) throws Exception {
		try {
			categoryMapper.updateSmallCategory(param);
			return 1;
		} catch(Exception err) {
			return 0;
		}
		
	}

	@Override
	public ArrayList<CategoryVO> getSmallCategoryList(CategoryVO param) throws Exception {
		return categoryMapper.getSmallCategoryList(param);
	}
	@Override
	public ArrayList<CategoryVO> getSmallCategoryListUsr(CategoryVO param) throws Exception {
		return categoryMapper.getSmallCategoryListUsr(param);
	}

	@Override
	public void deleteSmallCategory(int no) throws Exception {
		categoryMapper.deleteSmallCategory(no);
	}


	
}
