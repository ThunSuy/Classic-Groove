<div id="login">
    <div class="login-form">
        <div class="left">
            <form class="container">
                <p class="header">Login</p>
                <input type="text" id="username-field" name="username" placeholder="Username" required>
                <span class="error-message" id="login-username-error"></span>

                <div style="position:relative">
                    <input type="password" id="password-field" name="password" placeholder="Password" required>
                    <i class="fa-thin fa-eye-slash" id="eyeicon" onclick="eyePassword()"></i>

                </div>
                <span class="error-message" id="login-password-error"></span>
                <br>
                <div class="bottom">
                    <div class="left-bottom">
                    </div>
                    <!-- <div class="right-bottom">
                        <label><a href="#" class="color333">Forgot password?</a></label>
                    </div> -->
                </div>
                <div class="submit">
                    <input type="button" value="Login" onclick="login()">
                </div>
            </form>
        </div>
        <div class="right register">
            <form action="" class="container">
                <p class="header">Register</p>
                <input type="text" name="Name" class="text name" placeholder="Name">
                <span class="error-message" id="name-error"></span>

                <input type="text" name="phonenumber" class="text phonenumber" placeholder="Phone number">
                <span class="error-message" id="phonenumber-error"></span>

                <input type="text" name="username" class="text username" placeholder="Username">
                <span class="error-message" id="username-error"></span>

                <div style="position:relative">
                    <input type="password" name="password" class="text password" id="password-field2" placeholder="Password">
                    <i class="fa-thin fa-eye-slash" id="eyeicon2" onclick="eyePassword2()"></i>

                </div>
                <span class="error-message" id="password-error"></span>
                <div style="position:relative">
                    <input type="password" name="password" class="text confirmPassword" id="password-field3" placeholder="Confirm password">
                    <i class="fa-thin fa-eye-slash" id="eyeicon3" onclick="eyePassword3()"></i>

                </div>
                <span class="error-message" id="confirm-password-error"></span>
                <div class="submit">
                    <input type="button" value="Register" onclick="register()">
                </div>
            </form>
            <!-- <form action="" class="container">
                <p class="header">Register</p>
                <input type="text" name="Name" class="text name" placeholder="Name">
                <input type="text" name="phonenumber" class="text phonenumber" placeholder="Phone number">
                <input type="text" name="username" class="text username" placeholder="Username">
                <div style="position:relative">
                    <input type="password" name="password" class="text password" id="password-field2" placeholder="Password">
                    <i class="fa-thin fa-eye-slash" id="eyeicon2" onclick="eyePassword2()"></i>
                </div>
                <div style="position:relative">
                    <input type="password" name="password" class="text confirmPassword" id="password-field3" placeholder="Confirm password">
                    <i class="fa-thin fa-eye-slash" id="eyeicon3" onclick="eyePassword3()"></i>
                </div>
                <div class="submit">
                    <input type="button" value="Register" onclick="register()">
                </div>
            </form> -->
        </div>
        <div class="poster">
        </div>
    </div>
</div>