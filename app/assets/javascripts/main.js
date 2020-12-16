/* global $ MobileDetect */
// モバイルブラウザかどうか判定
const isMobile = !!new MobileDetect(window.navigator.userAgent).mobile();

// モバイルブラウザでは静止画を表示し、それ以外では動画を表示
if (isMobile) {
  $('.top_movie').css({
    'background-image': 'url(video/top-video-still.jpg)',
  });
} else {
  $('.top__video').css({ display: 'block' });
}

alert(111 + 222);
console.log('tet');

// animatedクラスの付いた要素にwaypointを登録
$('.animated').waypoint({
  handler(direction) {
    // 要素が画面中央に来るとここが実行される
    if (direction === 'down') {
     
      /**
       * 下方向のスクロール
       * イベント発生元の要素にfadeInUpクラスを付けることで
       * アニメーションを開始
       */
      $(this.element).addClass('fadeInUp');
      $(this.element).removeClass('fadeOutUp');
      /**
       * waypointを削除することで、この要素に対しては
       * これ以降handlerが呼ばれなくなる
       */
  
    }
    else if (direction === 'up') {
      $(this.element).removeClass('fadeInUp');
      $(this.element).addClass('fadeOutUp');
     

    }

  },

  // 要素が画面中央に来たらhandlerを実行
  offset: '50%',
});




// popupクラスを持つ要素にMagnific Popupを適用
$('.popup').magnificPopup({
  type: 'image',
});

