
<!--author sv2109 (sv2109@gmail.com) license for 1 product copy granted for GReG0 (hicenko@gmail.com)-->
<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').submit();" class="button"><?php echo $l->get('button_save'); ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $l->get('button_cancel'); ?></a>
      </div>
    </div>
    <div class="content">
      
      <?php $fields = array('name', 'description', 'tags', 'attributes', 'model', 'sku', 'upc', 'ean', 'jan', 'isbn', 'mpn' ); ?>

      <div id="tabs" class="htabs">
        <a href="#tab-general"><?php echo $l->get('tab_general'); ?></a>
        <a href="#tab-relevance"><?php echo $l->get('tab_relevance'); ?></a>
      </div>      
      
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        
        <div id="tab-general">
        
        <table id="general" class="list" style="width: 1000px; margin: 0 auto;">
          <thead>
            <tr>
              <td><?php echo $l->get('fields'); ?></td>
              <td><?php echo $l->get('search'); ?></td>
              <td><?php echo $l->get('phrase'); ?></td>
              <td><?php echo $l->get('use_morphology'); ?></td>
              <td><?php echo $l->get('use_relevance'); ?></td>              
            </tr>
          </thead>
            
          <tbody >
            
            <?php foreach($fields as $field): ?>

            <tr>

              <td>
                <?php echo $l->get($field); ?>
              </td>

              <td>
                <select name="search_mr_options[fields][<?php echo $field; ?>][search]">
                  <option value="equally"  <?php echo (isset($options['fields'][$field]['search']) && $options['fields'][$field]['search'] == 'equally')  ? 'selected="selected"' : "" ;?>><?php echo $l->get('search_equally'); ?></option>
                  <option value="contains" <?php echo (isset($options['fields'][$field]['search']) && $options['fields'][$field]['search'] == 'contains') ? 'selected="selected"' : "" ;?>><?php echo $l->get('search_contains'); ?></option>
                  <option value="start"    <?php echo (isset($options['fields'][$field]['search']) && $options['fields'][$field]['search'] == 'start') ? 'selected="selected"' : "" ;?>><?php echo $l->get('search_start'); ?></option>
                  <option value="0" <?php echo (isset($options['fields'][$field]['search']) && $options['fields'][$field]['search'] == '0') ? 'selected="selected"' : "" ;?>><?php echo $l->get('search_dont_search'); ?></option>
                </select>
              </td>

              <td>
                <select name="search_mr_options[fields][<?php echo $field; ?>][phrase]">
                  <option value="cut"  <?php echo (isset($options['fields'][$field]['phrase']) && $options['fields'][$field]['phrase'] == 'cut')  ? 'selected="selected"' : "" ;?>><?php echo $l->get('phrase_cut'); ?></option>
                  <option value="dont_cut"  <?php echo (isset($options['fields'][$field]['phrase']) && $options['fields'][$field]['phrase'] == 'dont_cut')  ? 'selected="selected"' : "" ;?>><?php echo $l->get('phrase_dont_cut'); ?></option>
                </select>
              </td>

              <td>
                <input type="checkbox" name="search_mr_options[fields][<?php echo $field; ?>][use_morphology]" value="1" <?php echo isset($options['fields'][$field]['use_morphology']) && $options['fields'][$field]['use_morphology'] ? "checked=checked" : "" ;?> />
              </td>              

              <td>
                <input type="checkbox" name="search_mr_options[fields][<?php echo $field; ?>][use_relevance]" value="1" <?php echo isset($options['fields'][$field]['use_relevance']) && $options['fields'][$field]['use_relevance'] ? "checked=checked" : "" ;?> />
              </td>              

            </tr>

            <?php endforeach; ?>
          
          </tbody>  
        
        </table>
        <?php echo $l->get('tab_general_help'); ?>
        </div>
        
        <div id="tab-relevance">
        
        <table id="relevance" class="list" style="width: 1000px; margin: 0 auto;">
          <thead>
            <tr>
              <td><?php echo $l->get('fields'); ?></td>
              <td><?php echo $l->get('relevance_start'); ?></td>
              <td><?php echo $l->get('relevance_phrase'); ?></td>
              <td><?php echo $l->get('relevance_word'); ?></td>
            </tr>
          </thead>
            
          <tbody >
            
            <?php foreach($fields as $field): ?>

            <tr>

              <td>
                <?php echo $l->get($field); ?>
              </td>

              <td>
                <input type="text" name="search_mr_options[fields][<?php echo $field; ?>][relevance][start]" value="<?php echo isset($options['fields'][$field]['relevance']['start']) ? $options['fields'][$field]['relevance']['start'] : 0; ?>" />
              </td>              

              <td>
                <input type="text" name="search_mr_options[fields][<?php echo $field; ?>][relevance][phrase]" value="<?php echo isset($options['fields'][$field]['relevance']['phrase']) ? $options['fields'][$field]['relevance']['phrase'] : 0; ?>" />
              </td>              

              <td>
                <input type="text" name="search_mr_options[fields][<?php echo $field; ?>][relevance][word]" value="<?php echo isset($options['fields'][$field]['relevance']['word']) ? $options['fields'][$field]['relevance']['word'] : 0; ?>" />
              </td>              

            </tr>

            <?php endforeach; ?>
          
          </tbody>  
        
        </table>
        <?php echo $l->get('tab_relevance_help'); ?>
        </div>

      </form>
    </div>
  </div>
  <div id="copyright">author sv2109 (sv2109@gmail.com) license for 1 product copy granted for GReG0 (hicenko@gmail.com)</div>
</div>

<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 

<?php echo $footer; ?>
