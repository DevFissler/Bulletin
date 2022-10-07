package kr.ac.kopo.ctc.kopo23.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo23.domain.BoardItem;
import kr.ac.kopo.ctc.kopo23.service.dto.Pagination;

public interface BoardItemService {
	Pagination getPagination (int c, int pageSize, int countPerPage, int totalCount);
	void create(BoardItem boardItem);
	BoardItem selectOne(int id);
	List<BoardItem> selectAll(int page,int countPerPage);
	BoardItem update(BoardItem boardItem);
	BoardItem delete(int id);
	
	int count();
}
