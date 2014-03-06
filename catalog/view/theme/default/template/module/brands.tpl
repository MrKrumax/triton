<div class="box">
  <div class="box-heading cat">Бренды</div>
  <div class="box-content">
    <div class="box-category">
            
<? if (isset($brands)){ ?>
      <ul id="menu2">
        <?php foreach ($brands as $brand) { ?>
        <li class="nav_li">
          <?php if ($brand['manufacturer_id'] == $manufacturer_id) { ?>
          <a rel="<?php echo $brand['path_and_mf']; ?>" class="active"><?php echo $brand['name']; ?>(<?php echo $brand['product_total']; ?>)</a>
          <?php } else { ?>
          <a rel="<?php echo $brand['path_and_mf']; ?>"><?php echo $brand['name']; ?>(<?php echo $brand['product_total']; ?>)</a>
          <?php } ?>
          <?php if ($brand['products']) { ?>
         
          <?php if ($brand['manufacturer_id'] == $manufacturer_id) { ?>
          <ul id="children" class="active">
          <? } else { ?>
            <ul id="children">
          <? }?>
                
        <?php foreach ($brand['products'] as $product) { ?>
 
              <?php if ($product['product_id'] == $product_id) { ?>
              <li class="drop-link">
              <a href="<?php echo $product['href']; ?>" class="td_first active <?=(($product['quantity']>0)?"":"nosklad");?>">  <?php echo $product['name']; ?></a>
              
                   
              
              
              </li>
              <?php } else { ?>
              <li class="drop-link"><a href="<?php echo $product['href']; ?>"  class="td_first <?=(($product['quantity']>0)?"":"nosklad");?>">  <?php echo $product['name']; ?></a>
              
             
        
        
               
        
        
              
              
              </li>
              <?php } ?>
       
              
           <?php } ?>

 			
          </ul>
          <?php } ?>
        </li>
        <?php } ?>
      </ul>
       <?php } ?>
      
    </div>
  </div>
</div>


