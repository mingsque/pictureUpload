package egovframework.example.product.service;

import java.util.ArrayList;

public interface ProductService {

	int insertProduct(ProductVO param) throws Exception;

	ArrayList<ProductVO> getProductList(ProductVO param) throws Exception;

	ProductVO readProduct(int no) throws Exception;

}
