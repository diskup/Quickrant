function geoFindMe() {

  function success(position) {
    const latitude  = position.coords.latitude;
    const longitude = position.coords.longitude;
    var latLngInput = new google.maps.LatLng(latitude, longitude);
    var geocoder = new google.maps.Geocoder();
    geocoder.geocode(
      {
        latLng: latLngInput
      },
    function(results, status) {
      var address = "";
      if (status = google.maps.GeocoderStatus.OK) {
        address = results[0].formatted_address;
        address = address.slice(3)
      } else if (status = google.maps.GeocoderStatus.ZERO_RESULTS) {
        alert("住所が見つかりませんでした。");
      } else if (status = google.maps.GeocoderStatus.ERROR) {
        alert("サーバ接続に失敗しました。");
      } else if (status = google.maps.GeocoderStatus.INVALID_REQUEST) {
        alert("リクエストが無効でした。");
      } else if (status = google.maps.GeocoderStatus.OVER_QUERY_LIMIT) {
        alert("リクエストの制限回数を超えました。");
      } else if (status = google.maps.GeocoderStatus.REQUEST_DENIED) {
        alert("サービスが使えない状態でした。");
      } else if (status = google.maps.GeocoderStatus.UNKNOWN_ERROR) {
        alert("原因不明のエラーが発生しました。");
      }
      document.getElementById('location').value = address;
    });
  }

  function error() {
    alert('エラーが発生しました。')
  }

  if(!navigator.geolocation) {
     alert('Geolocation is not supported by your browser');
  } else {
    navigator.geolocation.getCurrentPosition(success, error);
  }
}
document.querySelector('#get_current_shop').addEventListener('click', geoFindMe);