(function (global) {
  'use strict';
  var exports = {},
      template = {
        receipt_item: '<li class="receipt-item input-block"> <span class="item-name"><input type="text" name="item_name[]"></span> <span class="item-category"><input type="text" name="item_category[]"></span> <span class="item-price"><input type="text" name="item_price[]"></span> <button class="btn-delete-item">X</button></li>'
      };
  exports.addItem = function (id) {
    var elem = document.getElementById(id);
    if (elem === null) return;
    var dummy = document.createElement('div');
    dummy.innerHTML = template.receipt_item;
    elem.appendChild(dummy.firstChild);
  };

  exports.deleteItem = function (item) {
    item.parentElement.remove();
  }

  global.ham = exports;
})(this);
