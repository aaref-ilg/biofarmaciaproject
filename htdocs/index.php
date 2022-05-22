<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css " href="css/style.css">
    <link rel="stylesheet" type="text/css " href="css/css/all.min.css">

</head>
<?php
session_start();
if (!empty($_SESSION['us_tipo'])) {
    header('Location: controlador/LoginController.php');
} else {
    session_destroy();

?>

    <body>
        <img class="wave" src="img/wave7.png" alt="">
        <img class="wave2" src="img/wave8.png" alt="">
        <div class="contenedor">
            <div class="img">
                <img src="img/undraw_medical_care_movn.svg" alt="">
            </div>
            <div class="contenido-login">
                <form action="controlador/LoginController.php" method="post">
                    <img src="img/logo.png" alt="">
                    <h2><span style="color:#D41C23;">BIO</span>Farmacia</h2>
                    <div class="input-div dni">
                        <div class="i">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="div">
                            <h5>DNI</h5>
                            <input type="number" name="user" class="input" maxlength="9" required>
                        </div>
                    </div>
                    <div class="input-div pass">
                        <div class="i">
                            <i class="fas fa-lock"></i>
                        </div>
                        <div class="div">
                            <h5>Contraseña</h5>
                            <input type="password" name="pass" class="input" required>
                        </div>
                    </div>
                    <a href="vista/recuperar.php">Recuperar Contraseña</a>

                    <input type="submit" class="btn" value="iniciar Sesion">
                </form>
            </div>
        </div>
    </body>
    <script src="js/login.js"></script>

</html>
<?php
}
?>