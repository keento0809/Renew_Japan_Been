// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)


// ログイン画面のスライドショー

// 表示する画像を配列で持つ
// let setImage = [
//   "https://drive.google.com/file/d/1s6ZaAb9aNJByhWHEx5LyULESZtrE8QJW/view?usp=sharing", // 嵐山
//   "https://drive.google.com/file/d/1nnQob4QMqxU-KssKz54hM-e7Uw8PyPLa/view?usp=sharing", // 国府白浜
//   "https://drive.google.com/file/d/1_Kw8KV1AvIi1wPQOUhBlhT00Lzxcqvhv/view?usp=sharing" // 東京駅
// ]

// let counter = 0;

// function slideImage(){
//   if(counter >= (setImage.length-1)){
//     counter = 0
//   } // counterがsetImageの要素の数-1よりも大きいか、同じの場合0に戻す

//   document.querySelectorAll(".login-body").style.backgroundImage = "url(" + setImage[counter] + ")";
//   counter++;
// } 

// const a = document.querySelectorAll(".login-body");
// console.log(a);

// setInterval(slideImage(),3000);