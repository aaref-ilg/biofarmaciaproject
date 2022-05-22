<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Recuperar password</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="../css/css/all.min.css">
  <link rel="stylesheet" href="../css/sweetalert2.css">
  <link rel="stylesheet" href="../css/adminlte.min.css">
</head>

<body class="hold-transition login-page">
  <img class="wave" src="../img/wave7.png" alt="noimage">
  <img class="wave2" src="../img/wave8.png" alt="">
  <div class="login-box">

    <div class="login-logo">
      <img src="../img/logo.png" alt="noimage">
      <br>
      <a href="../index.php"><span style="color:#D41C23;">bio</span>Farmacia</a>
    </div>

    <div class="card">
      <div class="card-body login-card-body">
        <p class="login-box-msg">Olvidaste tu contrasena? Aqui puede recuperar facilmente una nueva.</p>
        <span id="aviso1" class="text-success text-bold">texto</span>
        <span id="aviso" class="text-danger text-bold">texto</span>
        <form id="form-recuperar" action="" method="post">
          <div class="input-group mb-3">
            <input type="number" class="form-control" id="dni-recuperar" maxlength="9" placeholder="DNI">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="far fa-address-card"></span>
              </div>
            </div>
          </div>
          <div class="input-group mb-3">
            <input type="email" class="form-control" id="email-recuperar" placeholder="Email">
            <div class="input-group-append">
              <div class="input-group-text">
                <span class="fas fa-envelope"></span>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-12">
              <button type="submit" class="btn btn-primary btn-block">Enviar</button>
            </div>

          </div>
        </form>
        <p class="login-box-msg mt-3">Se le enviara un codigo a su correo electronico.</p>
        <p class="mt-3 mb-1">
          <a href="../index.php">Login</a>
        </p>

      </div>

    </div>
  </div>



  <script src="../js/jquery.min.js"></script>

  <script src="../js/bootstrap.bundle.min.js"></script>

  <script src="../js/adminlte.min.js"></script>
  <script src="../js/recuperar.js"></script>
  <script src="../js/sweetalert2.js"></script>

</body>

</html>