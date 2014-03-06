<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<!-- <link rel="stylesheet" type="text/css" href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" media="screen" />-->
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script><script type="text/javascript" src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if gte IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php echo $google_analytics; ?>
<meta name='yandex-verification' content='75e1c0df3fdc1fbf' />
<link rel="shortcut icon" href="favicon.ico">
</head>
<body>

<div class="curier_top_menu">
<div class="top_menu">
	<!-- links -->
	<div class="links">
		<?php $currentUrl = str_replace('&amp;', '&', 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI']); ?>
		<?php foreach ($informations as $information) : ?>
			<?php if ($information['information_id'] == 6 || $information['information_id'] == 7 || $information['information_id'] == 8 || $information['information_id'] == 12) : ?>
				<?php if ($currentUrl === $information['href']) : ?>
					<a href="<?= $information['href']; ?>" class="BgRed"><span><?= $information['title']; ?></span></a>
				<?php else : ?>
					<a href="<?= $information['href']; ?>"><span><?= $information['title']; ?></span></a>
				<?php endif; ?>
			<?php endif; ?>
		<?php endforeach; ?>
		<?php if ($currentUrl === $special) : ?>
			<a href="<?= $special; ?>" class="BgRed"><span>Акции</span></a>
		<?php else : ?>
			<a href="<?= $special; ?>"><span>Акции</span></a>
		<?php endif; ?>
	</div>
	<!-- /links (update by vadim) -->
 
  
   <div id="welcome">
    <?php if (!$logged) { ?>
    <?php echo $text_welcome; ?>
    <?php } else { ?>
    <?php echo $text_logged; ?>
    <?php } ?>
  </div>
   
   <?php echo $cart; ?>
  
</div></div>

<div id="container">
<div id="header">
<div class="header_left">

  <?php if ($logo) { ?>
  <div id="logo"><a href="http://tritononline.com.ua/"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>
  
  </div>
  
<div class="header_middle">
  <div class="header_middle_up">
  
<div class="header_up_skype"><img src="image/ico_skype.png" align="absmiddle"> &nbsp;<a href="skype:tritononline?call">tritononline</a>

</div>

<div class="header_up_icq"><img src="http://status.icq.com/online.gif?web=689799729&img=5 " align="absmiddle"> &nbsp;<a href="http://www.icq.com/whitepages/cmd.php?uin=689799729&action=add" target="_blank">689799729</a>
  
  </div>

  </div>
  <div class="header_middle_dawn">
  <div id="search">
   
    <?php if ($filter_name) { ?>
    <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
    <?php } else { ?>
    <input type="text" name="filter_name" value="<?php echo $text_search; ?>" onClick="this.value = '';" onKeyDown="this.style.color = '#000000';" />
    <?php } ?>
   <div class="button-search"></div>
  </div>
  
  
  </div>

</div>
 <div class="header_right">
  <div class="header_right_telefon first">
  <table width="100%" border="0" class="tb_head_tel" cellpadding="0" cellspacing="0">
  <tr>
    <td> (0382)</td>
    <td>78-37-77</td>
  </tr>
  <tr>
    <td> (098)</td>
    <td>17-54-555
    
    </td>
  </tr>
  <tr>
    <td> (093)</td>
    <td>33-51-000</td>
  </tr>
  <tr>
    <td> </td>
    <td><a href="/index.php?route=information/information&information_id=12">Как нас найти</a></td>
  </tr>
</table>



</div>
</div>
</div>

<?php if ($categories) { ?>
<div id="menu">
  <ul>
    <?php foreach ($categories as $category) { ?>
    <li><?php if ($category['active']) { ?>
	<a href="<?php echo $category['href']; ?>"  <span class="active"><?php echo $category['name']; ?></span></a>
	<?php } else { ?>
	 <a href="<?php echo $category['href']; ?>"><span><?php echo $category['name']; ?></span></a>
	<?php } ?>

      <?php if ($category['children']) { ?>
      <div>
        <?php for ($i = 0; $i < count($category['children']);) { ?>
        <ul>
          <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
          <?php for (; $i < $j; $i++) { ?>
          
          <?php if (isset($category['children'][$i])) {
           $children2 = $this->model_catalog_category->getCategories($category['children'][$i]['category_id']);
              $str='';
              if ($children2){ $str='str';}
          
           ?>
          
          
          <?php if (isset($category['children'][$i])) { ?>
          
          
           <?php if (!$children2) { ?>
          <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a>
             <?php } else { ?>
           <li><span style="font-weight:bold"><?php echo $category['children'][$i]['name']; ?></span>
             <?php } ?>
          
          
          <?php   
         
          if ($children2){
           echo "  <div><ul>";
          foreach ($children2 as $child2) {
          
          $href  = $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $category['children'][$i]['category_id'].'_'.$child2['category_id']);
          
          echo '<li><a href=' .$href. ' class="children2">' .$child2['name']. '</a></li>';
          }
           echo "</ul> </div>";
          }
          ?>
          
          
          
          </li>
          <?php } ?>
          <?php } ?>
           <?php } ?>
        </ul>
        <?php } ?>
      </div>
      <?php } ?>
    </li>
    <?php } ?>
  </ul>
</div>
<?php } ?>
<div id="notification"></div>
