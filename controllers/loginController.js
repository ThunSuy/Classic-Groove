const login = () => {
  if (!checkInputLogin()) return;
  let username = document.querySelector("#username-field").value;
  let password = document.querySelector("#password-field").value;
  $.ajax({
    url: "util/user.php",
    type: "POST",
    data: { user: username, pass: password, action: "checkLogin" },
    success: function (res) {
      if (res == "cus") {
        window.location.href = "index.php";}
      else if (res =="emp")  document.querySelector("#login-username-error").innerText = "Account does not exist!";
      else {
        document.querySelector("#login-password-error").innerText = res;
      }
    },
  });
};

const loginAdmin = (event) => {
  event.preventDefault();
  if (!checkInputLoginAdmin()) return;
  let usernameField = document.querySelector("#username-field-admin");
    let passwordField = document.querySelector("#password-field-admin");

    // Kiểm tra nếu phần tử không tồn tại
    if (!usernameField || !passwordField) {
      console.error("Không tìm thấy input đăng nhập!");
      return;
    }

    let username = usernameField.value;
    let password = passwordField.value;
  $.ajax({
    url: "util/user.php",
    type: "POST",
    data: { user: username, pass: password, action: "checkLogin" },
    success: function (res) {
      console.log(res);
      if (res == "emp") {
        window.location.href = "admin.php";}
      else if (res =="cus") customNotice("fa-sharp fa-light fa-circle-exclamation", "Account does not exist!",3);
      else {
        customNotice("fa-sharp fa-light fa-circle-exclamation", res,3);
      }
    },
  });
};

const checkInputLogin = () => {
  // Lấy các input và phần tử hiển thị lỗi
  let username = document.querySelector("#username-field");
  let password = document.querySelector("#password-field");

  let usernameError = document.querySelector("#login-username-error");
  let passwordError = document.querySelector("#login-password-error");

  // Xóa thông báo lỗi cũ
  usernameError.innerText = "";
  passwordError.innerText = "";

  let isValid = true;

  // Kiểm tra các trường hợp lỗi
  if (username.value.trim() === "") {
    usernameError.innerText = "Please, enter your username!";
    username.focus();
    isValid = false;
  }

  if (password.value.trim() === "") {
    passwordError.innerText = "Please, enter your password!";
    password.focus();
    isValid = false;
  }

  return isValid;
};

// const checkInputLogin = () => {
//   let username = document.querySelector("#username-field").value;
//   if (username == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter username!",3
//     );
//     document.querySelector("#username-field").focus();
//     return false;
//   }
//   let password = document.querySelector("#password-field").value;
//   if (password == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter your password!",3
//     );
//     document.querySelector("#password-field").focus();
//     return false;
//   }
//   return true;
// };

const checkInputLoginAdmin = () => {
  let username = document.querySelector("#username-field-admin").value;
  if (username == "") {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Please, enter username!",3
    );
    document.querySelector("#username-field-admin").focus();
    return false;
  }
  let password = document.querySelector("#password-field-admin").value;
  if (password == "") {
    customNotice(
      "fa-sharp fa-light fa-circle-exclamation",
      "Please, enter your password!",3
    );
    document.querySelector("#password-field-admin").focus();
    return false;
  }
  return true;
};

const logout = () => {
  $.ajax({
    url: "util/logout.php",
    type: "GET",
    success: function () {
      window.location.href = "index.php";
    },
  });
};

const logoutAdmin = () => {
  $.ajax({
    url: "util/logoutAdmin.php",
    type: "GET",
    success: function () {
      window.location.href = "adminLogin.php";
    },
  });
};

const register = async () => {
  if (!(await checkInputRegister())) return;
  let name = document.querySelector("#login .register .name").value;
  let phone = document.querySelector("#login .register .phonenumber").value;
  let username = document.querySelector("#login .register .username").value;
  let password = document.querySelector("#login .register .password").value;
  $.ajax({
    url: "util/user.php",
    type: "POST",
    data: {
      name: name,
      phone: phone,
      user: username,
      pass: password,
      action: "register",
    },
    success: function (res) {
      if (res == "Success") {
        customNotice(
          "fa-sharp fa-light fa-circle-exclamation",
          "Accout successfully created!",1
        );
        loadLoginByAjax("logIn");
        document.querySelector("#username-field").value = username;
        document.querySelector("#password-field").value = password;
      } else
        customNotice(
          "fa-sharp fa-light fa-circle-exclamation",
          "Accout creation failed!",3
        );
    },
  });
};

const checkInputRegister = async () => {
  // Lấy các input và phần tử hiển thị lỗi
  let name = document.querySelector("#login .register .name");
  let phone = document.querySelector("#login .register .phonenumber");
  let username = document.querySelector("#login .register .username");
  let password = document.querySelector("#login .register .password");
  let confirmPassword = document.querySelector("#login .register .confirmPassword");

  let nameError = document.querySelector("#name-error");
  let phoneError = document.querySelector("#phonenumber-error");
  let usernameError = document.querySelector("#username-error");
  let passwordError = document.querySelector("#password-error");
  let confirmPasswordError = document.querySelector("#confirm-password-error");

  // Xóa thông báo lỗi cũ
  nameError.innerText = "";
  phoneError.innerText = "";
  usernameError.innerText = "";
  passwordError.innerText = "";
  confirmPasswordError.innerText = "";

  let isValid = true;

  // Kiểm tra các trường hợp lỗi
  if (name.value.trim() === "") {
    nameError.innerText = "Please, enter your name!";
    name.focus();
    isValid = false;
  }

  if (phone.value.trim() === "") {
    phoneError.innerText = "Please, enter your phone number!";
    phone.focus();
    isValid = false;
  } else if (!isVietnamesePhoneNumberValid(phone.value.trim())) {
    phoneError.innerText = "Invalid phone number!";
    phone.focus();
    isValid = false;
  }

  if (username.value.trim() === "") {
    usernameError.innerText = "Please, enter username!";
    username.focus();
    isValid = false;
  } else if (await isUsernameExist(username.value.trim())) {
    usernameError.innerText = "Username already exists!";
    username.focus();
    isValid = false;
  }

  if (password.value.trim() === "") {
    passwordError.innerText = "Please, enter your password!";
    password.focus();
    isValid = false;
  } else if (!isPasswordValid(password.value.trim())) {
    passwordError.innerText = "Password must contain at least 8 characters, including uppercase, lowercase, numbers, and special characters.";
    password.focus();
    isValid = false;
  }

  if (confirmPassword.value.trim() === "") {
    confirmPasswordError.innerText = "Please, enter confirm password!";
    confirmPassword.focus();
    isValid = false;
  } else if (confirmPassword.value.trim() !== password.value.trim()) {
    confirmPasswordError.innerText = "Confirm password does not match!";
    confirmPassword.focus();
    isValid = false;
  }

  return isValid;
};

// const checkInputRegister = async () => {
//   let name = document.querySelector("#login .register .name");
//   let phone = document.querySelector("#login .register .phonenumber");
//   let username = document.querySelector("#login .register .username");
//   let password = document.querySelector("#login .register .password");
//   let confirmPassword = document.querySelector(
//     "#login .register .confirmPassword"
//   );
//   if (name.value == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter your name!",3
//     );
//     name.focus();
//     return false;
//   }
//   if (phone.value == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter your phone number!",3
//     );
//     phone.focus();
//     return false;
//   }
//   if (!isVietnamesePhoneNumberValid(phone.value)) {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Invalid phone number!",3
//     );
//     phone.focus();
//     return false;
//   }
//   if (username.value == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter username!",3
//     );
//     username.focus();
//     return false;
//   }
//   if (await isUsernameExist(username.value)) {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Username already exists!",3
//     );
//     username.focus();
//     return false;
//   }
//   if (password.value == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter your password!",3
//     );
//     password.focus();
//     return false;
//   }
//   if (!isPasswordValid(password.value)) {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Password that contain at least eight characters, including at least one number and includes both lowercase and uppercase letters and special characters, for example #, ?, !.",3
//     );
//     password.focus();
//     return false;
//   }

//   if (confirmPassword.value == "") {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       "Please, enter confirm password!",3
//     );
//     confirmPassword.focus();
//     return false;
//   }
//   if (confirmPassword.value != password.value) {
//     customNotice(
//       "fa-sharp fa-light fa-circle-exclamation",
//       " Confirm password incorrect!",3
//     );
//     confirmPassword.focus();
//     return false;
//   }
//   return true;
// };

function isVietnamesePhoneNumberValid(number) {
  return /(((\+|)84)|0)(3|5|7|8|9)+([0-9]{8})\b/.test(number);
}
function isPasswordValid(password) {
  return /^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$/.test(
    password
  );
}

const isUsernameExist = (username) => {
  return $.ajax({
    url: "util/user.php",
    type: "POST",
    data: { user: username, action: "checkUsernameExist" },
  });
};
const isLogin = () => {
  return $.ajax({
    url: "util/user.php?action=isLogin",
    type: "GET",
  });
};

const getRole = () => {
  return $.ajax({
    url: "util/user.php?action=getRole",
    type: "GET",
  });
};
