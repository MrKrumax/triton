<?php echo $header; ?>
 <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
   <div id="content2">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
 <div class="prod-name">

  <h1><?php echo $heading_title; ?></h1>
  
  <div class="prod-sku">
	  код товара: <?php echo $sku; ?>
	</div>  

  
</div>

  <div class="product-info">
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
      <div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
      <?php } ?>
      <?php if ($images) { ?>
      <div class="image-additional">
        <?php foreach ($images as $image) { ?>
        <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
        <?php } ?>
      </div>
      <?php } ?>
    </div>
    <?php } ?>
    <div class="right">
      <div class="description">
      <table width="100%" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td valign="top"> <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?>
        <?php //if ($meta_description) { ?></br>
        <?php //echo $meta_description; ?>
        <?php //} ?>

         <?php if ($price && $price > 0) { ?>
      <div class="price"><span class="text_price"><?php echo $text_price; ?></span>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php }else{ ?>		<div class="price" onclick="utt();"><span class="text_price ask">Запросить цену</span></div><div style="    position: fixed;    background: #000;    opacity: 0.5;    width: 100%;    height: 100%;    z-index: 998;	display:none;	top:0;	left:0;" id="overlay_utt"></div><div id="price_utt" class="modal in" style="width: 535px;display: none;position: fixed;top: 10%;left: 50%;z-index: 1050;margin-left: -280px;background-color: #ffffff;border: 1px solid rgba(0, 0, 0, 0.3);*border: 1px solid #999;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;-webkit-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);-moz-box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);box-shadow: 0 3px 7px rgba(0, 0, 0, 0.3);-webkit-background-clip: padding-box;-moz-background-clip: padding-box;background-clip: padding-box;outline: none;">	<div class="modal-body" style="max-height: 430px;position: relative;overflow-y: auto;padding: 15px;">		<form class="form-horizontal" onsubmit="utt_post(this); return false;" method="post" style="margin: 0 0 20px;">			<fieldset style="padding: 0;margin: 0;border: 0;">				<legend style="display: block;width: 100%;padding: 0;margin-bottom: 20px;font-size: 21px;line-height: 40px;color: #333333;border: 0;border-bottom: 1px solid #e5e5e5;">Заполните Ваши контактные данные</legend>				<div class="control-group input-prepend" style="display: inline-block;margin-bottom: 20px;vertical-align: middle;font-size: 0;white-space: nowrap;*display: inline;*zoom: 1;">					<label class="control-label" for="user_name" style="cursor: inherit;font-size: 14px;font-weight: normal;line-height: 20px;display: block;margin-bottom: 5px;float: left;width: 160px;padding-top: 5px;text-align: right;">						<b>Имя</b>					</label>					<div class="controls" style="*display: inline-block;*padding-left: 20px;margin-left: 180px;*margin-left: 0;">						<span class="add-on" style="display: inline-block;width: auto;height: 20px;min-width: 16px;padding: 4px 5px;font-size: 14px;font-weight: normal;line-height: 20px;text-align: center;text-shadow: 0 1px 0 #ffffff;background-color: #eeeeee;border: 1px solid #ccc;vertical-align: top;-webkit-border-radius: 0;-moz-border-radius: 0;border-radius: 0;margin-right: -1px;">						<i class="icon-user" style="background-position: -168px 0;"></i>						</span><input type="text" value="" class="input-xlarge" id="user_name" rel="popover" name="user_name" placeholder="Укажите Ваши имя и фамилию" data-content="Укажите Ваши имя и фамилию" data-original-title="Полное имя" style="font-size: 14px;font-weight: normal;line-height: 20px;font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;width: 270px;margin-left: 0;display: inline-block;height: 20px;padding: 4px 6px;margin-bottom: 0;color: #555555;-webkit-border-radius: 0 4px 4px 0;-moz-border-radius: 0 4px 4px 0;border-radius: 0 4px 4px 0;vertical-align: middle;background-color: #ffffff;border: 1px solid #cccccc;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition: border linear .2s, box-shadow linear .2s;-moz-transition: border linear .2s, box-shadow linear .2s;-o-transition: border linear .2s, box-shadow linear .2s;transition: border linear .2s, box-shadow linear .2s;position: relative;*margin-left: 0;*display: inline;*zoom: 1;">					</div>				</div>				<div class="control-group input-prepend" style="display: inline-block;margin-bottom: 20px;vertical-align: middle;font-size: 0;white-space: nowrap;*display: inline;*zoom: 1;">					<label class="control-label" for="user_phone" style="cursor: inherit;font-size: 14px;font-weight: normal;line-height: 20px;display: block;margin-bottom: 5px;float: left;width: 160px;padding-top: 5px;text-align: right;">						<b>Телефон</b>					</label>					<div class="controls" style="*display: inline-block;*padding-left: 20px;margin-left: 180px;*margin-left: 0;">						<span class="add-on" style="display: inline-block;width: auto;height: 20px;min-width: 16px;padding: 4px 5px;font-size: 14px;font-weight: normal;line-height: 20px;text-align: center;text-shadow: 0 1px 0 #ffffff;background-color: #eeeeee;border: 1px solid #ccc;vertical-align: top;-webkit-border-radius: 0;-moz-border-radius: 0;border-radius: 0;margin-right: -1px;">						<i class="icon-pencil" style="background-position: 0 -72px;"></i>									</span><input type="text" class="input-xlarge" id="user_phone" rel="popover" name="user_phone" placeholder="Какой у Вас номер телефона?" data-content="Какой у Вас номер телефона? Зная Ваш номер телефона, мы можем связаться с Вами для уточнения деталей заказа" data-original-title="Телефон" style="font-size: 14px;font-weight: normal;line-height: 20px;font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;width: 270px;margin-left: 0;display: inline-block;height: 20px;padding: 4px 6px;margin-bottom: 0;color: #555555;-webkit-border-radius: 0 4px 4px 0;-moz-border-radius: 0 4px 4px 0;border-radius: 0 4px 4px 0;vertical-align: middle;background-color: #ffffff;border: 1px solid #cccccc;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition: border linear .2s, box-shadow linear .2s;-moz-transition: border linear .2s, box-shadow linear .2s;-o-transition: border linear .2s, box-shadow linear .2s;transition: border linear .2s, box-shadow linear .2s;position: relative;*margin-left: 0;*display: inline;*zoom: 1;">					</div>				</div>				<div class="control-group input-prepend" style="display: inline-block;margin-bottom: 20px;vertical-align: middle;font-size: 0;white-space: nowrap;*display: inline;*zoom: 1;">					<label class="control-label" for="user_email" style="cursor: inherit;font-size: 14px;font-weight: normal;line-height: 20px;display: block;margin-bottom: 5px;float: left;width: 160px;padding-top: 5px;text-align: right;">						<b>Эл. почта</b>					</label>					<div class="controls" style="*display: inline-block;*padding-left: 20px;margin-left: 180px;*margin-left: 0;">						<span class="add-on" style="display: inline-block;width: auto;height: 20px;min-width: 16px;padding: 4px 5px;font-size: 14px;font-weight: normal;line-height: 20px;text-align: center;text-shadow: 0 1px 0 #ffffff;background-color: #eeeeee;border: 1px solid #ccc;vertical-align: top;-webkit-border-radius: 0;-moz-border-radius: 0;border-radius: 0;margin-right: -1px;">						<i class="icon-envelope" style="background-position: -72px 0;"></i>						</span><input type="text" value="" class="input-xlarge" id="user_email" rel="popover" name="user_email" placeholder="Какой у Вас адрес электронной почты?" data-content="Какой у Вас адрес электронной почты? Зная Ваш адрес электронной почты, мы можем связаться с Вами для уточнения деталей заказа и Вы сможете получить на электронную почту копию запроса с заказом" data-original-title="Email" style="font-size: 14px;font-weight: normal;line-height: 20px;font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;width: 270px;margin-left: 0;display: inline-block;height: 20px;padding: 4px 6px;margin-bottom: 0;color: #555555;-webkit-border-radius: 0 4px 4px 0;-moz-border-radius: 0 4px 4px 0;border-radius: 0 4px 4px 0;vertical-align: middle;background-color: #ffffff;border: 1px solid #cccccc;-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);-webkit-transition: border linear .2s, box-shadow linear .2s;-moz-transition: border linear .2s, box-shadow linear .2s;-o-transition: border linear .2s, box-shadow linear .2s;transition: border linear .2s, box-shadow linear .2s;position: relative;*margin-left: 0;*display: inline;*zoom: 1;">					</div>				</div>				<input type="hidden" name="link" value="" style="font-size: 14px;font-weight: normal;line-height: 20px;font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;width: 206px;margin-left: 0;display: inline-block;*display: inline;*zoom: 1;margin-bottom: 0;vertical-align: middle;">							</fieldset>		</form>	</div>	<div class="modal-footer" style="padding: 14px 15px 15px;margin-bottom: 0;text-align: right;background-color: #f5f5f5;border-top: 1px solid #ddd;-webkit-border-radius: 0 0 6px 6px;-moz-border-radius: 0 0 6px 6px;border-radius: 0 0 6px 6px;-webkit-box-shadow: inset 0 1px 0 #ffffff;-moz-box-shadow: inset 0 1px 0 #ffffff;box-shadow: inset 0 1px 0 #ffffff;*zoom: 1;">		<button class="btn btn-large btn-danger" onclick="$('#price_utt').find('form').find('input[name=link]').val(window.location.href);$('#price_utt').find('form').submit()" style="font-size: 17.5px;font-weight: normal;line-height: 20px;font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif;display: inline-block;*display: inline;*zoom: 1;padding: 11px 19px;margin-bottom: 0;text-align: center;vertical-align: middle;cursor: pointer;color: #ffffff;text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);background-color: #da4f49;background-image: linear-gradient(to bottom, #ee5f5b, #bd362f);background-repeat: repeat-x;filter: progid:DXImageTransform.Microsoft.gradient(enabled = false);border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);*background-color: #bd362f;border: 1px solid #cccccc;*border: 0;border-bottom-color: #b3b3b3;-webkit-border-radius: 6px;-moz-border-radius: 6px;border-radius: 6px;*margin-left: .3em;-webkit-box-shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);-moz-box-shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);box-shadow: inset 0 1px 0 rgba(255,255,255,.2), 0 1px 2px rgba(0,0,0,.05);*padding-top: 7px;*padding-bottom: 7px;">Сделать запрос</button>	</div></div><script>$.fn.serializeObject = function(){    var o = {};    var a = this.serializeArray();    $.each(a, function() {        if (o[this.name] !== undefined) {            if (!o[this.name].push) {                o[this.name] = [o[this.name]];            }            o[this.name].push(this.value || '');        } else {            o[this.name] = this.value || '';        }    });    return o;};function utt(){	$("#overlay_utt").on("click", function(){		$(this).hide();		$("#price_utt").hide();	}).show();	$("#price_utt").show();}function utt_post(form){	$.post('/index.php?route=record/blog', $(form).serializeObject());	alert('Запрос отправлен!');	window.location.reload();}</script>		<?php } ?>



        </td>
    <td valign="top" align="right">

    <?php if ($price > '1999') { ?>
   <img src="image/site/deliveri_no.jpg" id="image" />
    <?php } ?>

    <!-- <?php  if($informations) { ?>
    <a href="<?php echo $informations; ?>"  class="colorbox" rel="colorbox1"><img src="image/site/deliveri_<?=$information_id?>.jpg" id="image" /></a>
   <? } else {?>
   <img src="image/site/deliveri_no.jpg" id="image" />
  <?  } ?> -->
    </td>
  </tr>
</table>
</div>



      <?php if ($options) { ?>




      <div class="options">
          <a href="/index.php?route=information/information&information_id=8&design=no"  class="colorbox" rel="colorbox1">Условия гарантии</a>
        <br /> <br />
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <table class="option-image">
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <tr>
              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                </label></td>
            </tr>
            <?php } ?>
          </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?>
          <b><?php echo $option['name']; ?>:</b><br />
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>



      <div class="cart">

            <?php if ($price && $price > 0) {  ?>
        <div>
          <input type="hidden" name="quantity" size="2" value="<?php echo $minimum; ?>" />
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          &nbsp;
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button4" />
           &nbsp;
           <input type="button" onclick="addToCartOnCredit('<?php echo $product_id; ?>');" value="купить в кредит" id="button-cart" class="button3" />
        </div>
 <?       } ?>
        <div class="compare">
          <a onclick="addToCompare('<?php echo $product_id; ?>');"><?php echo $button_compare; ?></a></div>
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
      </div>
      <?php if ($review_status) { ?>
      <div class="review">
        <div><img src="catalog/view/theme/default/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $text_write; ?></a></div>
        <div class="share"><!-- AddThis Button BEGIN -->
          <div class="addthis_default_style">
              <!--<a class="addthis_button_compact"><?php echo $text_share; ?></a>-->
              <a class="addthis_button_odnoklassniki_ru"></a>
              <a class="addthis_button_vk"></a>
              <a class="addthis_button_twitter"></a>
            <a class="addthis_button_facebook"></a>
            <a class="addthis_button_email"></a>
          </div>
            <!--<a class="addthis_button_print"></a>-->

          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script>
          <!-- AddThis Button END -->
        </div>
      </div>
      <?php } ?>
    </div>
    </div>
    <div class="note">
        Цвет или оттенок изделия на фотографии может отличаться от реального.</br>
        Характеристики и комплектация товара могут изменятся производителем без уведомления.</br>
        Магазин не несет ответственности за изменения, внесенные производителем.
    </div>
  <div id="tabs" class="htabs">

      <?php if ($description) { ?>
      <a href="#tab-description"><?php echo $tab_description; ?></a>
      <?php } ?>

    <?php if ($attribute_groups) { ?>
        <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>

     <?php if ($video) { ?>
    <a href="#tab-video"><?php echo $tab_video; ?></a>
    <?php } ?>

    <?php if ($review_status) { ?>
        <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>



  </div>

  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($description) { ?>
   <div id="tab-description" class="tab-content"><?php echo $description; ?></div>
  <?php } ?>
   <?php if ($video) { ?>
   <div id="tab-video" class="tab-content" style="text-align:center">
    <?php echo $video; ?>
    </div>
    <?php } ?>
  
  
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 98%; resize:none"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br /><br /> &nbsp;
    <input type="text" name="captcha" value="" />
    <br /><br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
 
<!---->
 <?php if ($products) { ?>
<div class="box">
  <div class="box-heading">Аксессуары</div>
  <div class="box-content">
   
    <div id="carousel22">
  <ul class="jcarousel-skin-opencart3">
      <?php $k=0;  foreach ($products as $product) { $k=$k+1; ?>
      <li <? if ($k=='4') echo 'class="last_r"'; ?> >
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        <?php } ?>
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>
        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        
       </li>
      <?php } ?>
    </ul>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#carousel22 ul').jcarousel({
	vertical: false,
	visible: 3,
	scroll: 1,
	auto: 2,
        wrap: 'circular',
});
//--></script>
<!---->
  <?php } ?>

  
  <?php echo $content_bottom; ?></div></div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); 
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 
<?php echo $footer; ?>