<h2><?php echo $text_instruction; ?></h2>
<p><?php echo $text_description; ?></p>
<p><?php echo $bank; ?></p>
<p><?php echo $text_payment; ?></p>
<div class="buttons">
  <div class="right">  <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" /></div>
</div>
<script type="text/javascript"><!--

	$('#button-confirm').bind('click', function() {
		//alert('asd');
		$.ajax({
				url: 'index.php?route=payment/ukrsib/send',
				data: $('#payment :input'),
				dataType: 'json',	
				type: 'post',		
				
				beforeSend: function() {
					$('#button-confirm').attr('disabled', true);
					$('#payment').before('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
				},

				complete: function() {
					$('#button-confirm').attr('disabled', false);
					$('.attention').remove();
				},		

				success: function(json) {
					$('.warning, .error').remove();
					
					if (json['error']) {
						$('#payment').prepend('<div class="warning">' + json['error'] + '</div>');
					}
					
					if (json['redirect']) {
						location = json['redirect'];
					}
				}

		});
	});



//--></script>
