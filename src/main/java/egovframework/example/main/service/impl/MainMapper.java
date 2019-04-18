package egovframework.example.main.service.impl;

import java.util.List;

import egovframework.example.main.service.PagingVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Mapper("mainMapper")
public interface MainMapper {

	List<EgovMap> selectPictureList(PagingVO pageParam) throws Exception;

	int selectPictureCount() throws Exception;

	List<EgovMap> selectNoticeList() throws Exception;

}
