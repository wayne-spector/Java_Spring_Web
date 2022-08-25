<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GEAR SUPPORT會員登入</title>
    <script
        src="https://cdn.jsdelivr.net/npm/js-cookie@beta/dist/js.cookie.min.js"></script>
    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.js"></script>
    <link rel="stylesheet" type="text/css"
        href="${pageContext.servletContext.contextPath }/css/login.css" />
    <link rel="stylesheet" href="../css/login2.css">
    <link   rel="stylesheet" 
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" 
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" 
        crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" 
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" 
        crossorigin="anonymous">
</script>
    
    </head>
    
    
    <body>
        <video autoplay muted loop id="myVideo">
            <source src="https://wedistill.io/uploads/videos/processed/255/MadeInLadakh-HD_3.mp4.mp4" type="video/mp4" style="width:100%";>
            Your browser does not support HTML5 video.
          </video>
        <div class="signinbox">
            <div class="loginpage">
                
                <ul id="tab">
                    <button id="tab1">登入</button>
                    
                    <button id="tab2">註冊</button>
                </ul><br>
                <div id="content1">
                    <div>
                        <input id="emailIn" type="email" placeholder="請輸入帳號">
                    </div>
                    <br>
                    <div>
                        <input id="passwordIn" type="password" placeholder="請輸入密碼">
                    </div>
                    <br>
                    <div>
                        <button id="btnSignIn">登入</button>
                    </div>
                    <br>
                    <div>
                        <button class="btn btn-outline-dark"id="googleSignUpPopup">
                            <img width="20px" style="margin-bottom:3px; margin-right:5px" alt="Google sign-in" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/512px-Google_%22G%22_Logo.svg.png" />
                            &ensp;使用 Google登入
                        </button>
                    </div><br>
                    <div>
                        <a id="forget" class="forget" style="color: black">忘記密碼?</a>
                    </div>
                </div>
                <div id="content2">
                    <div class="setup">
                        <label>請設定帳號</label> <input id="email" type="email"
                            placeholder="請輸入帳號">
                    </div>
    
                    <div class="setup">
                        <label>請設定密碼</label> <input id="password" type="password"
                            placeholder="請輸入密碼">
                    </div>
    
                    <div class="setup">
                        <label>請確認密碼</label> <input id="passwordcheck" type="password"
                            placeholder="請再次輸入密碼">
                    </div>
    
    
                    <br>
                    <div>
                        <button style="margin-left:40px;" id="btnSignUp">註冊</button>
                    </div>
                </div>
                <div id="content3">
                    <h3>忘記密碼</h3>
                    <div class="forget">
                        <input class="email" id="new-forgot" type="text"
                            placeholder="請輸入您的Email" />
                    </div>
                    <br /> <br />
                    <div class="forget">
                        <button class="btnForget" id="sure-forgot">寄出修改密碼信</button>
                    </div>
                    <br /> <br />
                </div>
            </div>
        </div>
    
        <script>
            //default只顯示content1 
            $('#content1').show();
            $('#content2').hide();
            $("#content3").hide();


            $(document).ready(function () {
                $("#tab1").on("click", function () {
                    $('#content1').show();
                    $('#content2').hide();
                    $("#content3").hide();
                })
                $("#tab2").on("click", function () {
                    $('#content2').show();
                    $('#content1').hide();
                    $("#content3").hide();
                })
                $("#forget").on("click", function(){
                    $('#content1').hide();
                    $('#content2').hide();
                    $("#content3").show();
                })
            });
            
        </script>
        <!-- The core Firebase JS SDK is always required and must be listed first -->
        <script src="https://www.gstatic.com/firebasejs/8.9.1/firebase-app.js"></script>
        <!-- TODO: Add SDKs for Firebase products that you want to use
          https://firebase.google.com/docs/web/setup#available-libraries -->
        <script
            src="https://www.gstatic.com/firebasejs/8.9.1/firebase-analytics.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.0.1/firebase-auth.js"></script>
    
    
        <script type="text/javascript">
        
        $(function() {
            // Your web app's Firebase configuration
            // For Firebase JS SDK v7.20.0 and later, measurementId is optional
            let firebaseConfig = {
            apiKey: "AIzaSyBl8entOzoK0lBevDGZm-K81HfwV_AORi8",
            authDomain: "finalfantasy-b32de.firebaseapp.com",
            projectId: "finalfantasy-b32de",
            storageBucket: "finalfantasy-b32de.appspot.com",
            messagingSenderId: "1075392614222",
            appId: "1:1075392614222:web:6e6f475a63366a4a4fd81f",
            measurementId: "G-ZGR25G94EY"
            };
            // Initialize Firebase
            let a = firebase.initializeApp(firebaseConfig);
            console.log("Initialized");
            console.log(a);
            firebase.analytics();
            // forward page
            function forward(data) {
                // 使用者已登入，可以取得資料
                let user = {};
                user.uid = data.uid;
                user.email = data.email;
                Cookies.set("user", encodeURIComponent(JSON.stringify(user)),{expires:0.1});
                console.log(data.email);
                if(data.email.toString()=="pihsia.lian@gmail.com"){
                	
                	window.location.href ="${pageContext.request.contextPath}/backgroundsystem.view"
                }else{
                	window.location.href ="${pageContext.request.contextPath}";
                }
            }
            
            //SignIn
            let btnIn = document.getElementById("btnSignIn");
            btnIn.onclick = function() {
                let emailIn = $("#emailIn").val();
                let passwordIn = $("#passwordIn").val();
               
                firebase.auth()
                    .signInWithEmailAndPassword(emailIn, passwordIn)
                    .then(result => {
                        console.log(result);
                        firebase.auth().onAuthStateChanged(function(data) {
                            if (data) {
                                // 使用者已登入，可以取得資料
                                forward(data);
                                
                                
                            } else {
                                // 使用者未登入
                                console.log("user not login");
                            }
                        });
                    })
                    .catch(error => {
                        console.log(error.message);
                    });
            }
            //SignUp
            let btn = document.getElementById('btnSignUp');
            btn.onclick = function() {
                let email = $('#email').val();
                let password = $('#password').val();
                let passwordcheck =$("#passwordcheck").val();
                
                if(password == passwordcheck){
                    firebase
                    .auth()
                    .createUserWithEmailAndPassword(email, password)
                    .then(result => {
                        console.log("註冊");
                        console.log(result);
                        let user = firebase.auth().currentUser;
                        //EmailAuth
                        user.sendEmailVerification()
                            .then(function() {
                                // 驗證信發送完成
                                window.alert('驗證信已發送到您的信箱，請點選連結驗證。');
                                window.location.reload()
                                user.updateProfile({displayName: tel});
                                
                            }).catch(error => {
                                // 驗證信發送失敗
                                console.log(error.message);
                            });
                    }).catch(function(error) {
                        console.log(error.message)
                    });
                }else{
                    alert("密碼輸入需相符");
                }
                
                
            }
            
              
            //Google
            let provider = new firebase.auth.GoogleAuthProvider();
            let btnGooglePopup = document.getElementById('#googleSignUpPopup');
            $("#googleSignUpPopup").on("click", function() {
                firebase.auth().signInWithPopup(provider).then(function(result) {
                    // 可以獲得 Google 提供 token，token可透過 Google API 獲得其他數據。  
                    let token = result.credential.accessToken;
                    let user = result.user;
                    let userIn = firebase.auth().currentUser;
                    if (userIn) {
                        // user is signed in.
                        forward(userIn);
                        alert('登入成功')
                    } else {
                        // No user is signed in.
                    }
                })
            })
            //忘記密碼
            const btnuserForgotSure = document.getElementById('sure-forgot');
            btnuserForgotSure.addEventListener('click', e => {
                const emailAddress = document.getElementById('new-forgot').value;
                const auth = firebase.auth();
                firebase.auth().languageCode = 'zh-TW'; // 發信模版改中文
                auth.sendPasswordResetEmail(emailAddress).then(() => {
                    window.alert('已發送信件至信箱，請按照信件說明重設密碼');
                    window.location.reload();
                }).catch(error => {
                    changeErrMessage(error.message)
                });
            })
            
        })
        //tab變顏色
       $("#tab1").css('background-Color','black');
            $("#tab1").css('color','rgba(255, 255, 255, 0.666)');
       $("#tab1").click(function() {
            $("#tab2").css('background-Color', 'rgba(255, 255, 255, 0.666)');
            $("#tab2").css('color','black');
            $(this).css('background-Color','black');
            $(this).css('color','white');
       });
       $("#tab2").click(function() {
            $("#tab1").css('background-Color', 'rgba(255, 255, 255, 0.666)');
            $("#tab1").css('color','black');
            $(this).css('background-Color','black');
            $(this).css('color','rgba(255, 255, 255, 0.666)');
       });
        </script>
    </body>
    </html>
    