"use strict";
{
    // アカウント作成画面のパスワードと確認用の一致をチェック
    const create = document.getElementById("js-create");
    console.log(create);
    create.addEventListener('click',function(e){
      let password = document.getElementById('js-password');
      let confirmPassword = document.getElementById('js-confirmPassword');
      if(password.value !== confirmPassword.value){
        e.preventDefault();
        alert('パスワードと確認用パスワードが一致しません。')
      }

    });
};