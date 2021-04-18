"use strict";
{
  // 県一覧のクリックイベント（selectedクラスのつけ外しで灰色or水色にする）
  document.addEventListener(
    "DOMContentLoaded",
    function () {
      let searchPref = document.querySelectorAll(".searchPref");
      // console.log(searchPref);
      for (let i = 0; i < searchPref.length; i++) {
        searchPref[i].addEventListener(
          "click",
          function () {
            this.classList.toggle("selected");
          },
          false
        );
      }
    },
    false
  );

  // モーダル内のリアルタイム絞り込み機能
  // let $lists = document.getElementsByClassName('searchPref');
  // console.log($lists);
  // let li = $lists[0].innerHTML.toLocaleUpperCase();
  // console.log(li);

  let searchInput = document.getElementById("search-input2"); //モーダル内の検索フォームを取得
  searchInput.addEventListener("input", function () {
    let filter = searchInput.value.toUpperCase(); //入力された文字を取得
    console.log(filter);
    let $lists = document.getElementsByClassName("searchPref"); //モーダル内の各県（li）を取得
    // console.log(filter);
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

  // const brii = document.getElementById("bri");
  // brii.addEventListener("click", () => {
  //   console.log("test is over.");
  // });
}
