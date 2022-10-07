package kr.ac.kopo.ctc.kopo23.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.ctc.kopo23.domain.BoardItem;

public class BoardItemDaoImpl implements BoardItemDao {

	@Override
	public BoardItem create(BoardItem boardItem) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "";
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root", "koposw23");
			Statement stmt = conn.createStatement();
			sql = "insert into bulletin values(" + boardItem.getId() + ",'" + boardItem.getTitle() + "');";
			stmt.execute(sql);
			sql = "select * from bulletin where id = " + boardItem.getId() + ";";
			ResultSet rset = stmt.executeQuery(sql);
			while (rset.next()) {
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
			}
			rset.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {

		}
		return boardItem;
	}

	@Override
	public BoardItem selectOne(int id) {
		BoardItem boardItem = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root",
					"koposw23");
			Statement stmt = conn.createStatement();
			String sql = "";
			sql = "select * from bulletin where id = " + id + ";";
			ResultSet rset = stmt.executeQuery(sql); // 쿼리문을 실행하고 반환한 값을 저장.
			while (rset.next()) {
				boardItem = new BoardItem();
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
			}
		} catch (Exception e) {

		}
		return boardItem;
	}

	@Override
	public List<BoardItem> selectAll(int page, int countPerPage) {
		String sql = "";
		List<BoardItem> boardItems = new ArrayList<BoardItem>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root",
					"koposw23");
			Statement stmt = conn.createStatement();
			sql = "select * from bulletin order by rootid desc , recount asc limit  " + (page - 1) * countPerPage + "," + countPerPage + ";";
			ResultSet rset = stmt.executeQuery(sql); // 쿼리문을 실행하고 반환한 값을 저장.

			while (rset.next()) {
				BoardItem boardItem = new BoardItem();
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
				boardItem.setCreated(rset.getDate(3));
				boardItem.setView(rset.getInt(6));
				boardItems.add(boardItem);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return boardItems;
	}

	@Override
	public BoardItem update(BoardItem boardItem) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "";
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root",
					"koposw23");
			Statement stmt = conn.createStatement();

			sql = "update bulletin set title ='" + boardItem.getTitle() + "' where id = " + boardItem.getId() + ";";
			stmt.execute(sql);
			sql = "select * from test where id = " + boardItem.getId() + ";";
			ResultSet rset = stmt.executeQuery(sql); // 쿼리문을 실행하고 반환한 값을 저장.
			while (rset.next()) {
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return boardItem;
	}

	@Override
	public BoardItem delete(int id) {
		BoardItem boardItem = new BoardItem();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "";
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root","koposw23");
			Statement stmt = conn.createStatement();
			sql = "delete from test where id = " + id + ";";
			stmt.execute(sql);
			sql = "select * from test where id = " + id + ";";
			ResultSet rset = stmt.executeQuery(sql); // 쿼리문을 실행하고 반환한 값을 저장.
			while (rset.next()) {
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return boardItem;
	}

	@Override
	public int count() {
		int count=0;
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "";
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root","koposw23");
			Statement stmt = conn.createStatement();
			sql = "select count(*) from bulletin";
			stmt.execute(sql);
			ResultSet rset = stmt.executeQuery(sql); // 쿼리문을 실행하고 반환한 값을 저장.
			while (rset.next()) {
				count=rset.getInt(1);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return count;
	}

	@Override
	public void deleteAll() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String sql = "";
			Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23", "root", "koposw23");
			Statement stmt = conn.createStatement();
			sql = "truncate table test;";
			stmt.execute(sql);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}