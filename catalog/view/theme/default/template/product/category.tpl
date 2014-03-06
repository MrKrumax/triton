<?php echo $header; ?>

<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
<? if (empty($column_left)) {?>  
  <div id="content2">
  <? } ?>
<!--  vuvodim levoy kolonku tolko esli net podkategoriy -->
  <?php if (!$categories) { ?> 
	<?php echo $column_left; ?>
<? } ?>

<?php echo $column_right; ?>
<div id="content"><?= $content_top; ?>
  
	<h1><?= $heading_title; ?></h1>

	<?php if (isset($categories)) : ?>

		<div class="category-list">

		<?php for ($i = 0; $i < count($categories);) : ?>
		<ul>
			<?php $j = $i + ceil(count($categories) / 4); ?>
			<?php for (; $i < $j; $i++) : ?>
			<?php if (isset($categories[$i])) : ?>
			<li>
					<div class="parent_category_image">
						<a href="<?= $categories[$i]['href']; ?>" >
							<img src="<?= $categories[$i]['image']; ?>" title="<?= $categories[$i]['name']; ?>" alt="<?= $categories[$i]['name']; ?>" />
						</a>
					<br />
					<a href="<?= $categories[$i]['href']; ?>"><?= $categories[$i]['name']; ?></a>
				</div>                
				<?php if (isset($categories[$i]['sub_categories'])) : ?>
					<ul class="children-sub-category">
					<?php foreach ($categories[$i]['sub_categories'] as $sub_category) : ?>
						<li><a href="<?= $sub_category['href']; ?>"><?= $sub_category['name']; ?></a></li>
					<?php endforeach; ?>
					</ul>
				<?php endif; ?>
			</li>
			<?php endif; ?>
			<?php endfor; ?>
		</ul>
		<?php endfor; ?>
		</div>
	<?php endif; ?> <!-- update by vadim -->
  
  <!-- vuvodim kontent esli net podkategoriy-->
   <?php if (!$categories) { ?> 
  <!-- -->
  <?php if ($products) { ?>
  
   
  <div class="product-filter ">
   
    <div class="limit"><?php echo $text_limit; ?>
      <select onchange="location = this.value;">
        <?php $limits2=$limits; foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select onchange="location = this.value;">
        <?php $sorts2=$sorts; foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    
     <div class="pagination"><?php echo $pagination; ?></div>
  </div>
 
 
 
  <div class="product-list">
    <?php foreach ($products as $product) { ?>
    
 
    <div class="product_one">
       <div class="product_one_left">
      <?php if ($product['thumb']) { ?>
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
      <?php } ?>
      </div>
      
       <div class="product_one_right">
       
       
       <table width="100%" border="0">
  <tr>
    <td ><div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div></td>
    <td width="125px" style="text-align:right;color:#666666; font-size:11px">код товара: <?php echo $product['sku']; ?></td>
  </tr>
  <tr>
    <td colspan="2">  <?php if ($product['price']) { ?>
      <div class="price">
        <?php if (!$product['special']) { ?>
        <?php echo $product['price']; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
        <?php } ?>
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <?php if ($product['rating']) { ?>
      <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
      <?php } ?>
      <div class="cart">
        <input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button4" />
        
        <input type="button" value="Купить в кредит" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button3" />
      </div>  <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div></td>
  </tr>
  <tr>
    <td colspan="2"><div class="description"><?php echo $product['description']; ?><br>
   <a href="<?php echo $product['href']; ?>"> Подробнее →</a>
    </div></td>
  </tr>
</table>

      
      
      
    </div> 
    </div>
    
    <?php } ?>
    
    
  
    
    
      
  </div>
   <div class="product-filter dawn">
  
    
     <div class="pagination"><?php echo $pagination; ?></div>
  </div>
 
 
 
 
  <?php } ?>
  <?php if ($thumb || $description) { ?>
  <div class="category-info TextGrey">
   
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  
  
  <?php } ?>
  
  <? } ?>
  
  
  <?php echo $content_bottom; ?></div>

<? if (empty($column_left)) {?>  
</div>
<? } ?>


<?php echo $footer; ?>