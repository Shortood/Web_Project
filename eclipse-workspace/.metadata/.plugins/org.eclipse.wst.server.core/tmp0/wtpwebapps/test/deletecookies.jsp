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
          $(tbl).append('<td class="type_context"><input type="file" value="���� �߰�"><br><br><input type="file" value="������ �߰�"></td></tr>');
          $('#step_table').append(tbl);
       });
    });
    </script>
</head>

<body>
    <div id="wrap">
        <div id="head"><img src="DB���� ���� ���� ������">��극����</div>

        <div id="title">������ ���</div>

        <div id="main">
            <form action="" method="">
                <table name="first">
                    <tr>
                        <td class="type_name">�丮 �̸�</td>
                        <td class="type_context"><input type="text" name="menu_name"></td>
                    </tr>
                    <tr><td>&nbsp</td></tr>
                    <tr>
                        <td class="type_name">�丮 ����</td>
                        <td class="type_context"><textarea name="menu_explain"> </textarea></td>
                    </tr>
                </table>
                <div id="mainPic">
                    <img src="DB���� ������ ���λ��� ������"><input type="file" value="���� �߰�">
                </div>
                <table id="ingredient_table">
                    <tr>
                        <td class="type_name">��� ����</td>
                        <td class="type_context"><input type="text" name="ingredient"></td>
                        <td class="type_context"><input type="text" name="amount"></td>
                        <td><input type="button" value="��� �߰�" id="add_ingredient"></td>
                    </tr>
                </table>
                <table id="step_table">
                    <tr>
                        <td class="type_name">�� ����<br><br><input type="button" value="�ܰ� �߰�" id="add_step"></td>
                        <td class="type_context"><textarea name="step_explain"> </textarea></td>
                        <td class="type_context"><input type="file" value="���� �߰�"><br><br><input type="file" value="������ �߰�"></td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td class="type_name">�±� ����</td>
                        <td class="type_context"><input type="text" name="tag" id="tag_explain"></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>

</html>