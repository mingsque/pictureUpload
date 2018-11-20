package egovframework.example.product.service.impl;

import java.util.ArrayList;

import egovframework.example.product.service.ProductVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("productMapper")
public interface ProductMapper {

	int insertProduct(ProductVO param) throws Exception;

	ArrayList<ProductVO> getProductList(ProductVO param) throws Exception;

	ProductVO readProduct(int no) throws Exception;

}
