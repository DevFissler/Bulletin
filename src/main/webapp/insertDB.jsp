 <!--에러나면 이 페이지 띄워라-->
 <!DOCTYPE html>
 <html lang="en">
 <%@ page contentType="text/html; charset=utf-8" %>
 <%@ page import="java.sql.*, javax.sql.*, java.io.*, java.net.*" %>
 <%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
 <head>
     <meta charset="UTF-8">
     <meta http-equiv="X-UA-Compatible" content="IE=edge">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
 </head>
 <body>
     <% //JSP문 시작
        Date now=new Date(); 
        SimpleDateFormat format=new SimpleDateFormat("yyyyMMdd");
 
        Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.90:33063/koposw23","root","koposw23"); //커넥션
        Statement stmt = conn.createStatement(); //스테이트먼트

        String temp1=request.getParameter("title");
        String sTitle=new String (temp1.getBytes("8859_1"),"utf-8");

        String temp2=request.getParameter("con");
        String sCon=new String (temp2.getBytes("8859_1"),"utf-8");

        String temp3=format.format(now);
        
        String rootId=request.getParameter("rootid");
        int rLevel=Integer.parseInt(request.getParameter("rLevel"));
        String rCount=request.getParameter("rCount")+".0";
        
        String rootId2 = rootId+".0";
        
        /*
        String queryTxt3="";
        queryTxt3="update bulletin set recount = recount + 1 where rootid = "+rootId+" and recount >= "+rCount+";";
        
        stmt.execute(queryTxt3);*/
        
        String title = "";
        
        for (int i=0;i<rLevel;i++){
        	title += "[Re]";
        }
        
        title = title + " " + sTitle;
        
        String QueryTxt2="";
        QueryTxt2=String.format("insert into bulletin (title, reg_date, context,rootid,viewcount,relevel,recount,rootid2) values ('"+title+"','"+temp3+"','"+sCon+"',"+rootId+",0,0,"+rootId2+","+rootId2+");");
        stmt.execute(QueryTxt2); //테이블 생성
 
        stmt.close();
        conn.close();
       %> <!--jsp문 종료-->
       <script>
            alert("게시글 작성이 완료되었습니다");
            window.location="allview.jsp?page=1";
    </script>
 </body>
 </html>