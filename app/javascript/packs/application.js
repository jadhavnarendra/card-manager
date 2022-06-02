// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


import $ from 'jquery';
global.$ = jQuery;
require('datatables.net-bs4')
require ('dataTables/jquery.dataTables')

require('imports-loader?define=>false!datatables.net')(window, $)
require('imports-loader?define=>false!datatables.net-select')(window, $)


document.addEventListener("turbolinks:load", function () {
  debugger
  $('#cards-datatable').click(function(){
    alert("hi")
  })
});

