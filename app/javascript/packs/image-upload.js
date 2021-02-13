//   image-upload.js

const uploadImageModule = (() =>{
    // DOM要素の取得
    const inputElement = document.getElementById('image');
    const previewElement = document.getElementById('image-preview');
  
    inputElement.addEventListener('change',event =>{
      event.preventDefault();  // HTML要素が持つのデフォルトイベントのキャンセル
      event.stopPropagation(); // イベントのハブリング（子要素から親要素への伝搬）を防ぐ
  
      // type=fileを指定されたinput要素のchangeイベントは「ファイルのリストfiles（複数形）」
      // 1つ目の要素を受け取るので0としている
      const file = event.target.files[0];
  
      // ファイルが存在しないかファイル形式がimageでない場合
      if(!file || !file.type.match(/image\/*/)){
        alert('画像ファイルではありません');
        return false;  // returnでイベントを終了させる
      }
  
      // FileReaderのインスタンスを生成（ローカルファイルを読み込むオブジェクト）
      const reader = new FileReader();
      
      // FileReaderの読み込み完了した結果（アップロードした画像ファイル）をimg要素のsrcにセット
      reader.addEventListener('load' , event =>{
        // event.target.resultはbase64エンコード（アップロードした画像をwebページ上で使えるようにする）された画像データ
        previewElement.setAttribute('src', event.target.result);
      })
      
      // セットされたオブジェクトを読み込む
      reader.readAsDataURL(file);
    });
  })();

// トップページに戻る
const backBtn = document.getElementById('js-backBtn');
backBtn.addEventListener('click',function(){
  location.href = 'index.html';
});