function geoFindMe() {

  function success(position) {
    const latitude  = position.coords.latitude;
    const longitude = position.coords.longitude;
    const latLngInput = new google.maps.LatLng(latitude, longitude);
    const geocoder = new google.maps.Geocoder();
    geocoder.geocode({ latLng: latLngInput }, function(results, status) {
      let address = '';
      if (status == 'OK' && results[0]) {
        address = results[0].formatted_address;
        address = address.slice(3)
      } else {
          alert('住所から位置の取得ができませんでした。: ' + status);
          return;
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
document.getElementById('get_current_shop').addEventListener('click', geoFindMe);