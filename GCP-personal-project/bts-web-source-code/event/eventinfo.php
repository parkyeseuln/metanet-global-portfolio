<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>BTS Event page</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <!-- Bootstrap core CSS -->
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="../css/carousel.css" rel="stylesheet">
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .p-3 {
        padding: 0.2rem!important;
      }

      @keyframes blink-effect {
        50% {
        opacity: 0; }
       }
      .blink { animation: blink-effect 1s step-end infinite;

      /* animation-name: blink-effect; animation-duration: 1s; animation-iteration-count:infinite; animation-timing-function:step-end; */ }


    </style>
  </head>
  <body style="padding-top: 0px">
    <?php include "../header.php"; ?>
    <main>
      <br>
      <p class="text-dark fs-1" style=margin-bottom:0px>&nbsp&nbsp&nbsp&nbspEVENT</p>
      <br>
      <hr class="featurette-divider" style="margin-bottom:30px; margin-top:0px;">
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">MAP OF THE SOUL ON:E DVD/BLU-RAY<span class="text-muted"></span></h2><br><br>
          <p class="lead">7명의 최고의 호흡, 그 어느 때보다 웅장하고 화려했던 퍼포먼스로 전 세계 아미들과 함께한 단 하나(ONE)뿐인 온라인 에디션(ONline Edition) 공연 BTS MAP OF THE SOUL ON:E DVD/BLU-RAY 출시!</p>
          <br><br><br>
          <button type="button" onclick="location.href='/event/event1.php';" class="btn btn-outline-dark me-2">구매하러 가기</button>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="/img/btsbook.jpg" class="card-img-top" alt="..." width="600" height="400">
        </div>
      </div>
      <hr class="featurette-divider" style="margin:30px">
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">위버스 카드<span class="text-muted"></span></h2><br><br>
          <p class="lead">특별한 의미가 담긴 위버스 카드 디자인과 아티스트의 사진으로 제작된 포토 플레이트를 함께 만나보세요!</p>
          <br><br><br><br>
          <button type="button" onclick="location.href='/event/event2.php';" class="btn btn-outline-dark me-2">구매하러 가기</button>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="/img/btscard.jpg" class="card-img-top" alt="..." width="600" height="400">
        </div>
      </div><hr class="featurette-divider" style="margin:30px">
      <div class="row featurette">
        <div class="col-md-7 order-md-2">
          <h2 class="featurette-heading">BTS GLOBAL OFFICAIL FANCLUB ARMY MEMBERSHIP <span class="text-muted"></span></h2><br><br>
          <p class="lead">멤버십 전용 콘텐츠, 멤버십 전용 상품 구매 기회, 공연 선예매 및 추첨제 참여 기회 등의 온라인 혜택을 제공합니다.</p>
          <br>
          <button type="button" onclick="location.href='/event/event3.php';" class="btn btn-outline-dark me-2">구매하러 가기</button>
        </div>
        <div class="col-md-5 order-md-1">
          <img src="/img/membership.jpg" class="card-img-top" alt="..." width="600" height="400">
        </div>
      </div>
    </main>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <!-- FOOTER -->
    <footer class="container">
      <?php include "../footer.php"; ?>
    </footer>
  </body>
  <script src="../js/bootstrap.bundle.min.js"></script>
</html>
