/* 
   Simple JQuery Collapsing menu.
   HTML structure to use:

   <ul id="menu">
     <li><a href="#">Sub menu heading</a>
     <ul>
       <li><a href="http://site.com/">Link</a></li>
       <li><a href="http://site.com/">Link</a></li>
       <li><a href="http://site.com/">Link</a></li>
       ...
       ...
     </ul>
     <li><a href="#">Sub menu heading</a>
     <ul>
       <li><a href="http://site.com/">Link</a></li>
       <li><a href="http://site.com/">Link</a></li>
       <li><a href="http://site.com/">Link</a></li>
       ...
       ...
     </ul>
     ...
     ...
   </ul>

Copyright 2007 by Marco van Hylckama Vlieg

web: http://www.i-marco.nl/weblog/
email: marco@i-marco.nl

Free for non-commercial use
*/

function initMenu() {
  $('#menu2 ul').hide();
  $('#menu2 ul.active').show();
  $('#menu2 > li > a').click(
    function() {
		  
		 
 
 $('.nav_li>a').removeClass('active'); 
		  
	   	$(this).addClass('active');
		
      var checkElement = $(this).next();
      if((checkElement.is('ul')) && (checkElement.is(':visible'))) {
        return false;
        }
      if((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
        $('#menu2 ul:visible').slideUp('normal');
	     //	$('#menu2 ul:visible').slideUp('normal');
        checkElement.slideDown('normal');
        return false;
        }

        if(!$(this).hasClass('loaded')){   

            var cat_id,href;   
           // href = $(this).attr('href');
           // href = href.split('&path=');
            //cat_id = href[href.length-1]
            cat_id = $(this).attr('rel');
            
            curr_cat_elm = $(this);
            $.ajax({
              url: 'index.php?route=module/brands/products_ajax',
              type: 'get',
              data: 'path=' + cat_id,
              dataType: 'json',
              success: function(json) {
                if (json['success']) {
                  $('#menu2 ul').hide();
                  curr_cat_elm.after(json['success']);
                  //curr_cat_elm.parent().siblings().children('ul').slideUp('fast');
                  //curr_cat_elm.click();
                } 
              }
            });         

            $(this).setClass('loaded')                      
            return false;
          }

      }



    );
  }
$(document).ready(function() {initMenu();});


