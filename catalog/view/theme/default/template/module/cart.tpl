<div id="cart">
  <div class="heading">
  <a href="<?php echo $cart; ?>"><img src="image/ico_cart.png" /> </a> 
  </div>
 <a href="<?php echo $cart; ?>"> <div class="content" id="cart-total">
  <?php if ($products || $vouchers) { ?>
  <span ><?php echo $text_items; ?></span>
  <?php } else { ?>
  <div class="empty"><?php echo $text_empty; ?></div>
  <?php } ?>
  </div>
  </a> 
</div>