// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

window.onload = function() {
    set_tagCloud();
};

 function set_tagCloud() {
 	try {
        TagCanvas.Start('tagCloud','tags',{
        textColour: 'blue',
        outlineColour: '#ff00ff',
        shape: "vring(0.5)",
        reverse: true,
        depth: 0.8,
        maxSpeed: 0.05
      });
    } catch(e) {
      // if something went wrong, hide the tagcloud container
      //document.getElementById('tagCloudContainer').style.display = 'none';
    }
 }

 function test() {
    var $input = $('<input type="text" />');
    var $btn = $('<input type="button" value="x" />');
    $btn.click(function() {
    $(this).parent().remove();
    });    
    var $div = $('<div style="position:absolute;left:200px;top:150px;" />');
    $div.append($input).append($btn);
    $('.container').append($div);
 }


  
  


