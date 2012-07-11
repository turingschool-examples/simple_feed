describe("Array#join", function() {
  it("returns '' when the Array is empty", function() {
    [].join().should.equal('');
  });

  it("returns a joined string of numeric elements", function() {
    [1,2,3].join().should.equal('');
  });
});
