//= require spec_helper

var asyncUpdate = function(callback) {
  sleep(5000);
  callback(true);
}

describe("asyncUpdate", function() {
  it("returns true after a long process", function(done) {
    asyncUpdate(function(result) {
      result.should.equal(true);
      done();
    });
  });
};


