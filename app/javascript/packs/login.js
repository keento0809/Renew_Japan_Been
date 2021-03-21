"use strict";
{
    // 表示する画像を配列で持つ
    let setImages = [
        '/assets/shirahama.JPG',
        '/assets/kyoto.JPG',
        '/assets/tokyo.png'
    // Google Driveの画像を外部で使うにはそのままのリンクは使えず編集しないといけない
    // "https://drive.google.com/uc?id=1QDs9Dd3o_W9RCTxf3D64V5ztgT7noNAt", // 東京駅
    // "https://drive.google.com/uc?id=1M61D53_BErPtxRqxF8xUtPhuK5W44EY2", // 国府白浜
    // "https://drive.google.com/uc?id=1s6ZaAb9aNJByhWHEx5LyULESZtrE8QJW", // 嵐山
  ];

  let counter = 0;

  function slideShow() {
    if (counter >= setImages.length) {
      counter = 0;
      // counterがsetImageの要素の数よりも大きいか、同じの場合0に戻す
    }
    let backGroundImage = document.getElementById("slideshow");
    backGroundImage.style.backgroundImage = "url(" + setImages[counter] + ")";
    counter++;
  }

  // setIntervalの第1引数は””で括らず関数名であっても()は付けない！！
  setInterval(slideShow, 3000);
};