function sleep(milliseconds) {
  setTimeout(function(){
    var start = new Date().getTime();
    while ((new Date().getTime() - start) < milliseconds){ }
  }, 0);
}
