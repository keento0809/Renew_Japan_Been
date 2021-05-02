'use strict ';
{
    // 県一覧のクリックイベント（selectedクラスのつけ外しで灰色or水色にする）
  document.addEventListener(
    "DOMContentLoaded",
    function () {
      let searchPref = document.querySelectorAll(".searchPref");
    //   console.log(searchPref);
      let checkPref = document.querySelectorAll("input[type='checkbox']");
    //   console.log(checkPref);
    //   以下クリックイベント
    // クリックされた県名の色を変える
      for (let i = 0; i < searchPref.length; i++) {
        searchPref[i].addEventListener(
          "click",
          function () {
            this.classList.toggle("selected");
            if(checkPref[i].checked==false){
                checkPref[i].checked=true;
            }else　if(checkPref[i].checked==true){
                checkPref[i].checked=false;
            };
          },
          false
        );
    //   チェックの付け外し
        checkPref[i].addEventListener("click",function(){
            if(this.checked==false){
                this.checked=true;
            }else if(this.checked==true){
                this.checked=false;
            }
        })
      };
      
    }
    );


  // モーダル内のリアルタイム絞り込み機能
//   各要素が取得できているかの確認
//   let $lists = document.getElementsByClassName('searchPref');
//   console.log($lists);
//   let li = $lists[0].innerHTML.toLocaleUpperCase();
//   console.log(li);

  let searchInput = document.getElementById("searchInput"); //モーダル内の検索フォームを取得
//   console.log(searchInput);
  searchInput.addEventListener('keyup', function () {
    let filter = searchInput.value; //入力された文字を取得
    let $lists = document.getElementsByClassName("searchPref"); //モーダル内の各県（li）を取得
    for (let i = 0; i < $lists.length; i++) {
      //$lists.length は47
      let li = $lists[i].innerHTML; //i番目の県を取得
      if (li) {
        if (li.toUpperCase().indexOf(filter) > -1) {
          $lists[i].style.display = "";
        } else {
          $lists[i].style.display = "none";
        }
      }
    }
  });

}