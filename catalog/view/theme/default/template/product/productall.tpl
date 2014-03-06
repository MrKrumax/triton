  <?php if ($products) { ?>  
	<?php echo 'var completeResults = [';?>
    <?php 
    $numproducts = count($products);
	 $i = 0;
    foreach ($products as $product) { ?>
    <?php if(++$i === $numproducts) {?>
		<?php echo '{ "permalink": "'.$product['href'].'", "image": "'.$product['thumb'].'", "title": "'.$product['name'].'", "price": "'.$product['price'].'" } ';?>
	 <?php }else{?>
	 	<?php echo '{ "permalink": "'.$product['href'].'", "image": "'.$product['thumb'].'", "title": "'.$product['name'].'", "price": "'.$product['price'].'" }, ';?>
	 <?php } ?>
    <?php } ?>
	<?php echo '];'; ?>
  <?php } ?>