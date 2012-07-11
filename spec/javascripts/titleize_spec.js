//= require spec_helper
//= require titleize

describe("String#titleize", function() {
  it("returns '' when the string is empty", function() {
    "".titleize().should.equal('');
  });

  it("returns the first letter capitalized when the string is a word", function() {
    "foo".titleize().should.equal('Foo');
  });

  it("returns the first letter of each word capitalized when the string is a sentence");
});

