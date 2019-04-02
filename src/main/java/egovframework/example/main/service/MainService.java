package egovframework.example.main.service;

import java.util.List;

import egovframework.rte.psl.dataaccess.util.EgovMap;

public interface MainService {


	List<EgovMap> selectPictureList(PagingVO pageParam) throws Exception;

	int selectPictureCount() throws Exception;

}
