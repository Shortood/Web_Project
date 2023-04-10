<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예제문제 게시판 글작성</title>
<link rel="stylesheet" type="text/css" href="css/question_board_insert_style.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

</head>
<body>
<%@include file="navbar.jsp" %>
<%
	int id=0;
	int ref;
	String title,writer,writer_id,content,image,time;
	int heart,reply;
	String sql=null;
    Connection conn =null;
    Statement stmt = null;
    ResultSet rs=null;
    if(request.getParameter("id")!=null)
    	id=Integer.parseInt(request.getParameter("id"));
    int id2=id+10;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        String jdbcurl = "jdbc:mysql://localhost:3306/cse_community?serverTimezone=UTC";
        conn = DriverManager.getConnection(jdbcurl,"root","qwerQWER123$");
        stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
        sql="select * from question where id=ref order by id desc limit "+id+", "+id2;
        rs = stmt.executeQuery(sql);
     }catch(Exception e){
        out.print("DB 연동 오류입니다.:" + e.getMessage());
    }
    sql="select * from question where id="+request.getParameter("id");
    rs = stmt.executeQuery(sql);
    %>
    <div class="body-box">
        <div class="content">
            <div id="body-left" class="design">
            <%
            while(rs.next()){
            %>
                <form id="form1" action="question_board_modify_db.jsp" method="POST" enctype="multipart/form-data">
                    <div id="title" class="title-design">
                        <h1><input type="text" placeholder="제목을 입력해주세요" name="title" id="title-input" size="40" value="<%=rs.getString("title")%>" required></h1>
                    </div>
                    <div id="main" class="clearfix">
                        <textarea name="content" id="content-input" rows="18" cols="62" placeholder="글을 입력해주세요" class="design" required><%=rs.getString("content") %></textarea> 
                    </div>
                    <div class="line"></div>
                    <div class="upload">
                        <input class="file-name" value="파일 선택" disabled="disabled" >

                        <label for="file_btn">업로드</label>
                        <input type="file" id="file_btn" name="file" class="file-hidden">
                    </div>
                    <div id="move-button" class="clearfix">
                        <div class=""><input type="submit" class="btn-q" value="확인"></div>
                    </div>
                    	<input type="hidden" name="id" value="<%=rs.getInt("id")%>">
                    
                </form>
            <%} %>
            </div>
            <%
            sql="select * from question where id=ref order by ref desc ";
            rs = stmt.executeQuery(sql);
            %>
            <div id="body-right" class="design">
                <div id="sidebar-title" class="title-design">
                    <h2>오늘의 문제</h2><!--2개 정도만 보여주면 될듯...?-->
                </div>
                <div class="list clearfix">
                <%
                while(rs.next() && rs.getRow()<=4)
                {
                	id=Integer.parseInt(rs.getString("id"));
                	ref=Integer.parseInt(rs.getString("ref"));
                	title=rs.getString("title");
                	writer=rs.getString("writer");
                	writer_id=rs.getString("writer_id");
                	content=rs.getString("content");
                	time=rs.getString("time");
                	heart=rs.getInt("heart");
                	reply=rs.getInt("reply");
                	image=rs.getString("image");
             %>
                    <div id="post-left" class="design" onclick="linked('question_board_post.jsp?id=<%=id%>')">
                        <div id="inner" class="design clearfix">
                            <div id="inner-title" class="noline-design"><%=title %></div>
                            <div id="inner-pic" class="noline-design"><img style="width:100%" src="question/<%=image %>" onerror="this.style.display='none'"></div>
                            <div id="inner-text" class="noline-design"><%=content %></div>
                        </div>
                        <div id="inner-info" class="clearfix">
                            <div class="info-design-left noline-design"><%= writer %></div>
                            <div class="info-design-right noline-design" style="color:rgb(204,102,51);">🗨 <%= reply %></div>
                            <div class="info-design-right noline-design">👍 <%= heart %></div>
                        </div>
                    </div>
                    <%} %>
                    
                </div>
            </div>
        </div>
    </div>
</body>
<%@include file="footer.jsp" %>
<script>
    $(document).ready(function(){
  var fileTarget = $('.upload .file-hidden');

    fileTarget.on('change', function(){
        if(window.FileReader){
            var filename = $(this)[0].files[0].name;
        } else {
            var filename = $(this).val().split('/').pop().split('\\').pop();
        }

        $(this).siblings('.file-name').val(filename);
    });
}); 
    
</script>
<script>
    function linked(link){
		location.href=link;
	}
</script>
</html>