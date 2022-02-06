<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <!-- Bootstrap core CSS -->
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="/css/footers.css" rel="stylesheet">
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
          font-size : 3.5rem;
        }
      }
    </style>
  </head>
  <body>
    <div class="container">
      <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <p class="col-md-4 mb-0 text-muted">&copy; 2013~ BTS, Inc</p>
          <img src="/img/BTS-logo.jpg" alt="logo" width="140" height="140">

        <ul class="nav col-md-4 justify-content-end">
          <strong>Instance-ID</strong> : <?= $id = file_get_contents('http://169.254.169.254/latest/meta-data/instance-id'); ?><br>
          <strong>Availability Zone</strong> : <?= $az = file_get_contents('http://169.254.169.254/latest/meta-data/placement/availability-zone'); ?>
        </ul>
      </footer>
    </div>
  </body>
</html>
