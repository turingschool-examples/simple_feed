String.prototype.titleize = function() {
  var titleized = this;

  if (this[0] && this.toUpperCase) {
    titleized = this[0].toUpperCase() + this.slice(1);
  }

  return titleized;
}
