<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>BTS Shop</title>
    <link rel="canonical" href="https://getbootstrap.com/docs/5.1/examples/carousel/">
    <!-- Bootstrap core CSS -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="./css/carousel.css" rel="stylesheet">
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
    </style>
  </head>
  <body style="padding-top: 0px">
    <?php include "header.php"; ?>
    <main>
      <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="/img/1.jpg" class="d-block w-100" alt="main01">
            <div class="container">
              <div class="carousel-caption text-start">
              </div>
	
            </div>
          </div>
          <div class="carousel-item">
            <img src="/img/2.jpg" class="d-block w-100" alt="main02">
            <div class="container">
              <div class="carousel-caption">
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <img src="/img/3.jpg" class="d-block w-100" alt="main03">
            <div class="container">
              <div class="carousel-caption text-end">
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

      <!-- Marketing messaging and featurettes
      ================================================== -->
      <!-- Wrap the rest of the page in another container to center all the content. -->



        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <div class="card">
              <img src="/img/btsbook.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="color:black">MAP OF THE SOUL ON:E DVD/BLU-RAY</h5><br>
                <p class="card-text" style="color:green">단독판매</p>
                <a href="/event/event1.php" class="btn btn-primary">구매하러 가기</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card">
              <img src="/img/btscard.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="color:black">위버스 카드</h5>
                <p class="card-text" style="color:gray">팬을 위한 모든 순간,<br>아티스트 포토 플레이트와 다양한 혜택까지!</p>
                <a href="/event/event2.php" class="btn btn-primary">구매하러 가기</a>
              </div>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="card">
              <img src="/img/membership.jpg" class="card-img-top" alt="...">
              <div class="card-body">
                <h5 class="card-title" style="color:black">BTS GLOBAL OFFICAIL FANCLUB ARMY MEMBERSHIP</h5>
                <p class="card-text" style="color:gray">BTS 공식 멤버십 가입은 위버스샵에서!</p>
                <a href="/event/event3.php" class="btn btn-primary">구매하러 가기</a>
              </div>
            </div>
          </div>
        </div><!-- /.row -->
      <!-- FOOTER -->
      <footer class="container">
        <?php include "footer.php"; ?>
      </footer>
    </main>
    <script src="./js/bootstrap.bundle.min.js"></script>
  </body>
</html>
