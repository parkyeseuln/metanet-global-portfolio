<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>BTS Login page</title>
		<link rel="stylesheet" type="text/css" href="./css/common.css">
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script type="text/javascript" src="./js/login.js"></script>
	</head>
	<body>
		<header>
	    <?php include "header.php";?>
	   </header>
		<section>
			<div id="main_img_bar">
	      <img src="/img/weverse2_adobe.png">
	    </div>
			<br><br>
    <div id="main_content">
  		<div id="login_box">
  		<div id="login_title">
    		<span>로그인</span>
  		</div>
  		<div id="login_form">
      		<form  name="login_form" method="post" action="login.php">
              	<ul style="padding-left: 0px">
                <li><input type="text" name="id" placeholder="아이디" ></li>
                <li><input type="password" id="pass" name="pass" placeholder="비밀번호" ></li> <!-- pass -->
              	</ul>
              	<div id="login_btn">
                  	<a href="#"><img src="./img/login.png" onclick="check_input()"></a>
              	</div>
       		</form>
    		</div> <!-- login_form -->
		</div> <!-- login_box -->
    </div> <!-- main_content -->
	</section>
	<footer>
  	<?php include "footer.php";?>
  </footer>
</body>
</html>
