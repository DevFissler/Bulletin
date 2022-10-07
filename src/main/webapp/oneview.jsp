<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>게시글 내용</title>
<!-- Latest compiled and minified CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

	<jsp:include page="menu.jsp"></jsp:include>

    <%
    String a = request.getParameter("id");     

    Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
    Statement stmt = conn.createStatement(); //스테이트먼트

    ResultSet rset = stmt.executeQuery("select * from bulletin where id="+a+";");
   

    int regNum=0;
    String name ="";
    String reg_date ="";
    String info ="";
    int vCount=0;
    int rLevel=0;
    int rootId=0;
    String rCount="";
    String rootId2="";
   

    while (rset.next()){
      regNum=rset.getInt(1);
      name=rset.getString(2);
      reg_date=rset.getString(3);
      info=rset.getString(4);
      rootId=rset.getInt(5);
      vCount=rset.getInt(6);
      rLevel=rset.getInt(7);
      rCount=rset.getString(8);
      rootId2=rset.getString(9);
    }
    
    stmt.execute("update bulletin set viewcount ="+(vCount+1)+" where id="+a+";");


    %>
    <div class='container-fluid'>
    <table class="table table-bordered">
        <thead>
          <tr>
            <th colspan="4">글 자세히</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" width="100px">번호</th>
            <td colspan="3"><%=regNum %></td>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td colspan="3"><%=name %></td>
          </tr>
          <tr>
            <th scope="row">작성일</th>
            <td colspan="3"><%=reg_date %></td>
          </tr>
          <tr>
            <th scope="row">조회수</th>
            <td colspan="3"><%=vCount+1 %></td>
          </tr>
          <tr>
            <th scope="row">원글 번호</th>
            <td colspan=3><%=rootId %></td>
          </tr>
          <tr>
            <th scope="row">댓글 수준</th>
            <td colspan=3><%=rLevel %></td>
          </tr>
          <tr>
            <th scope="row" colspan="4">내용</th>
          </tr>
          <tr>
            <td colspan="4" height="600px"><textarea style="width: 100%; height: 100%" readonly ><%=info %></textarea></td>
          </tr>
        </tbody>
      </table>
      </div>
      <table>
        <tr>
            <td width="1790px"></td>
            <td><input type="button" value="목록" onClick="location.href='allview.jsp?page=1'" style="margin-right: 20px;"></td>
            <td><input type="button" value="댓글" onClick="location.href='reply.jsp?id=<%=rCount %>&rLevel=<%=rLevel+1 %>'" style="margin-right: 20px;"></td>
            <td><input type="button" value="수정" onClick="location.href='update.jsp?id=<%=regNum %>'" style="margin-right: 20px;"></td>
        </tr>
    </table>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>