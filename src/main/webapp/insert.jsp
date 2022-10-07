<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*,javax.sql.*,java.io.*,java.net.*,org. w3c.dom.*,javax.xml.parsers.DocumentBuilder,javax.xml.parsers.DocumentBuilderFactory,javax.xml.parsers.ParserConfigurationException" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script language="javascript">
        function inputCheck(){
            var myform = document.add;
            var titleCheck = document.getElementById('title').value;
            var conCheck= document.getElementById('con').value;

            if( (titleCheck.indexOf('/')== -1) && (conCheck.indexOf('/')== -1) && (titleCheck.indexOf('>')== -1) && (conCheck.indexOf('>')== -1)  &&
                (titleCheck.indexOf('<')== -1) && (conCheck.indexOf('<')== -1)  && (titleCheck.length !=0) && (conCheck.length !=0)){
                
                myform.action = "insertDB.jsp";
                myform.submit();
            } else if ( !((titleCheck.indexOf('/')== -1) && (conCheck.indexOf('/')== -1) && (titleCheck.indexOf('>')== -1) && (conCheck.indexOf('>')== -1)  &&
                (titleCheck.indexOf('<')== -1) && (conCheck.indexOf('<')== -1))) {
                alert("입력값이 잘못되었습니다 ( < , > , / 사용이 제한되어있습니다!)");
            } else if ((titleCheck.length ==0) || (conCheck.length ==0)) {
                alert("입력값은 공백 일 수 없습니다");
            }
        }
    </script>
    <link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <%
    Class.forName("com.mysql.jdbc.Driver"); //드라이버
    Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
    Statement stmt = conn.createStatement(); //스테이트먼트
    
    ResultSet rset = stmt.executeQuery("select max(id) from bulletin;");
    int newId = 0;
    while(rset.next()){
    	newId=rset.getInt(1)+1;
    }
    
	
    Date now=new Date(); 
    SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
    %>
    <jsp:include page="menu.jsp"></jsp:include>
    <form method="post" name="add"><!--폼 하나 생성-->  
    <table class="table table-bordered">
        <thead>
          <tr>
            <th colspan="4">새 글 입력</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <th scope="row" width="100px">번호</th>
            <td colspan=3><input type="hidden" value=<%=newId %> readonly id="num" name="num">자동부여</td>
          </tr>
          <tr>
            <th scope="row">제목</th>
            <td colspan=3><textarea name="title" id="title" style="width: 100%; height:30px" maxlength="60"></textarea></td>
          </tr>
          <tr>
            <th scope="row">작성일</th>
            <td colspan=3><input type="text" value="<%=format.format(now) %>" id="date" readonly></td>
          </tr>
          <tr>
            <th scope="row">원글 번호</th>
            <td colspan=3><input type="hidden" value=<%=newId %> id="rootid" name="rootid" readonly>자동부여</td>
          </tr>
          <tr>
            <th scope="row">댓글 수준</th>
            <td><input type="number" value="0" name="rLevel" id="rLevel" readonly></td>
            <th>댓글 내 순서</th>
            <td width=500px><input type="hidden" value="<%=newId+".0" %>" name="rCount" id="rCount" readonly>자동부여</td>
          </tr>
          <tr>
            <th scope="row" colspan="4">내용</th>
          </tr>
          <tr>
            <td colspan="4" height="600px"><textarea name="con" id="con" style="width: 100%; height: 100%" ></textarea></td>
          </tr>
        </tbody>
      </table>
      </form>
      <table>
        <tr>
            <td width="1790px"></td>
            <td><input type="button" value="취소" onClick="location.href='allview.jsp?page=1'" style="margin-right: 20px;"></td>
            <td><input type="button" value="쓰기" onclick="inputCheck()" style="margin-right: 10px;"></td>
        </tr>
    </table>
    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>