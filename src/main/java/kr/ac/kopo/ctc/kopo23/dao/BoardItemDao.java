package kr.ac.kopo.ctc.kopo23.dao;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo23.domain.BoardItem;

public interface BoardItemDao {
	BoardItem create(BoardItem boardItem);
	BoardItem selectOne(int id);
	List<BoardItem> selectAll(int page,int countPerPage);
	BoardItem update(BoardItem boardItem);
	BoardItem delete(int id);
	int count();
	void deleteAll();
}
