package kr.ac.kopo.ctc.kopo23.service;

import java.sql.SQLException;
import java.util.List;

import kr.ac.kopo.ctc.kopo23.dao.BoardItemDao;
import kr.ac.kopo.ctc.kopo23.dao.BoardItemDaoImpl;
import kr.ac.kopo.ctc.kopo23.domain.BoardItem;
import kr.ac.kopo.ctc.kopo23.service.dto.Pagination;

public class BoardItemServiceImpl implements BoardItemService{
	
	private BoardItemDao boardItemDao = new BoardItemDaoImpl();
	
	@Override
	public Pagination getPagination(int c, int pageSize, int countPerPage, int totalCount) {
		
		
		Pagination pagination = new Pagination();
		
		double dTotal= (double)totalCount;
		int nn = (int)Math.ceil(dTotal/countPerPage);
		
		if(c<1) {
			c=1;
		}
		
		if(c>nn) {
			c=nn;
		}
		
		int start = 0;
		
		if(c%pageSize !=0) {		
			start = c - (c%pageSize)+1;
		} else {
			start = c-pageSize+1;
		}
		
		int end = start+pageSize-1;
		int n = start+pageSize;
		int p = start-pageSize;
		
		if(p<1) {
			p=1;
		}
		
		if(n>nn) {
			n=nn-(nn%pageSize)+1;
		}
		
		if(end>nn) {
			end=nn;
		}
		
		pagination.setC(c);
		pagination.setStart(start);
		pagination.setEnd(end);
		pagination.setPp(1);
		pagination.setNn(nn);
		pagination.setN(n);
		pagination.setP(p);
		
		return pagination;
	}

	@Override
	public void create(BoardItem boardItem){
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardItem selectOne(int id) {
		// TODO Auto-generated method stub
		return boardItemDao.selectOne(id);
	}

	@Override
	public List<BoardItem> selectAll(int page, int countPerPage) {
		// TODO Auto-generated method stub
		return boardItemDao.selectAll(page, countPerPage);
	}

	@Override
	public BoardItem update(BoardItem boardItem) {
		// TODO Auto-generated method stub
		return boardItemDao.update(boardItem);
	}

	@Override
	public BoardItem delete(int id) {
		// TODO Auto-generated method stub
		return boardItemDao.delete(id);
	}
	
	@Override
	public int count() {
		// TODO Auto-generated method stub
		return 0;
	}

}
