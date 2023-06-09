<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
    <link href="makerecipe.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>;
    <script>
    $(document).ready(function(){
       $('#add_ingredient').click(function(){
          var tbl = $('<tr><td class="type_name"></td>');
          $(tbl).append('<td class="type_context"><input type="text" name="ingredient"></td>');
          $(tbl).append('<td class="type_context"><input type="text" name="amount"></td></tr>');
          $('#ingredient_table').append(tbl);
       });
       
       $('#add_step').click(function(){
          var tbl = $('<tr><td class="type_name"></td>');
          $(tbl).append('<td class="type_context"><textarea name="step_explain"> </textarea></td>');
          $(tbl).append('<td class="type_context"><input type="file" value="사진 추가"><br><br><input type="file" value="동영상 추가"></td></tr>');
          $('#step_table').append(tbl);
       });
    });
    </script>
</head>

<body>
    <div id="wrap">
        <div id="head"><img src="DB에서 새싹 사진 가져와">허브레시피</div>

        <div id="title">레시피 등록</div>

        <div id="main">
            <form action="" method="">
                <table name="first">
                    <tr>
                        <td class="type_name">요리 이름</td>
                        <td class="type_context"><input type="text" name="menu_name"></td>
                    </tr>
                    <tr><td>&nbsp</td></tr>
                    <tr>
                        <td class="type_name">요리 설명</td>
                        <td class="type_context"><textarea name="menu_explain"> </textarea></td>
                    </tr>
                </table>
                <div id="mainPic">
                    <img src="DB에서 레시피 메인사진 가져와"><input type="file" value="사진 추가">
                </div>
                <table id="ingredient_table">
                    <tr>
                        <td class="type_name">재료 설정</td>
                        <td class="type_context"><input type="text" name="ingredient"></td>
                        <td class="type_context"><input type="text" name="amount"></td>
                        <td><input type="button" value="재료 추가" id="add_ingredient"></td>
                    </tr>
                </table>
                <table id="step_table">
                    <tr>
                        <td class="type_name">상세 설명<br><br><input type="button" value="단계 추가" id="add_step"></td>
                        <td class="type_context"><textarea name="step_explain"> </textarea></td>
                        <td class="type_context"><input type="file" value="사진 추가"><br><br><input type="file" value="동영상 추가"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="type_name">태그 설정</td>
                        <td class="type_context"><input type="text" name="tag" id="tag_explain"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>

</html>