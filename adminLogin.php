<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login Panel</title>
  <link rel="stylesheet" href="views/style/admin/login.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" href="views/style/admin/notice.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <link rel="stylesheet" href="views/assets/icons/all.css" />
  <!-- <link rel="stylesheet" href="views/style/user/header.css"> -->
</head>
<body>
<div id="warrper">
    <!-- <header id="header">
      
    </header> -->
    <main>
       
      
      <div id="notice">

      </div>
    </main>
  </div>

  <div class="container">
    <div class="myform">
      <form class="myform1" onsubmit="loginAdmin(event)">
        <h2>Admin Login</h2>
        <input type="text" id ="username-field-admin" value="superadmin" placeholder="Admin Name">
        <input type="password" id ="password-field-admin" value="superadmin" placeholder="Password">
        <button type="submit">LOGIN</button>
      </form>
    </div>
    <div class="image">
      <img src="views/assets/img/Logo.png" alt="Admin Login Image">
    </div>
  </div>

</body>

<script src="views/js/notice.js"></script>
<!-- controllers -->
<Script src="controllers/loginController.js"></Script>
</html>
