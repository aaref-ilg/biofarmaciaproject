
  <footer class="main-footer">
    <strong>Copyright &copy; 2022. <span style="color:#D41C23;">BIO</span>Farmacia</strong> All rights
    reserved.
  </footer>
</div>
<!-- ./wrapper -->


<script src="../js/jquery.min.js"></script>

<script src="../js/bootstrap.bundle.min.js"></script>

<script src="../js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../js/demo.js"></script>
<!-- SweetAlert2 -->
<script src="../js/sweetalert2.js"></script>
<!-- select2 -->
<script src="../js/select2.js"></script>
<script src="../js/datatables.js"></script>
</body>
<script>
  let funcion = 'devolver_avatar';
  $.post('../controlador/UsuarioController.php',{funcion},(response)=>{
    const avatar = JSON.parse(response);
    $('#avatar4').attr('src','../img/'+avatar.avatar);
    $('#avatar3').attr('src','../img/'+avatar.avatar);

  })
  funcion='tipo_usuario';
  $.post('../controlador/UsuarioController.php',{funcion},(response)=>{
    if(response==1){
      $('#gestion_lote').hide();
    }
    else if(response==2){
      $('#gestion_lote').hide();
      $('#gestion_usuario').hide();
      $('#gestion_producto').hide();
      $('#gestion_atributo').hide();
      $('#gestion_proveedor').hide();
    }
  })

  
</script>
</html>