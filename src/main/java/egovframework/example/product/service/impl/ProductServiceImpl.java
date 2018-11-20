package egovframework.example.product.service.impl;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.example.product.service.ProductService;
import egovframework.example.product.service.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Resource(name = "productMapper")
	private ProductMapper productMapper;

	@Override
	public int insertProduct(ProductVO param) throws Exception {
		return (int)productMapper.insertProduct(param);
	}

	@Override
	public ArrayList<ProductVO> getProductList(ProductVO param) throws Exception {
		return productMapper.getProductList(param);
	}

	@Override
	public ProductVO readProduct(int no) throws Exception {
		return productMapper.readProduct(no);
	}
}
