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
			<h1><img src="view/image/feed.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
		</div>

		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
			<table class="form">
				<tr>
				<td><?php echo $entry_status; ?></td>
				<td><select name="price_ua_status">
					<?php if ($price_ua_status) { ?>
					<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
					<option value="0"><?php echo $text_disabled; ?></option>
					<?php } else { ?>
					<option value="1"><?php echo $text_enabled; ?></option>
					<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
					<?php } ?>
					</select></td>
				</tr>
				<tr>
				<td><?php echo $entry_shopname; ?></td>
				<td><input name="price_ua_shopname" type="text" value="<?php echo $price_ua_shopname; ?>" size="40" maxlength="20" /></td>
				</tr>
				<tr>
				<td><?php echo $entry_category; ?></td>
				<td><div class="scrollbox" style="height:200px;">
					<?php $class = 'odd'; ?>
					<?php foreach ($categories as $category) { ?>
					<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
					<div class="<?php echo $class; ?>">
						<?php if (in_array($category['category_id'], $price_ua_categories)) { ?>
						<input type="checkbox" name="price_ua_categories[]" value="<?php echo $category['category_id']; ?>" checked="checked" />
						<?php echo $category['name']; ?>
						<?php } else { ?>
						<input type="checkbox" name="price_ua_categories[]" value="<?php echo $category['category_id']; ?>" />
						<?php echo $category['name']; ?>
						<?php } ?>
					</div>
					<?php } ?>
				</div>
                    <a onclick="$(this).parent().find(':checkbox').attr('checked', true);">Выделить все</a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);">Снять выделение</a>
                </td>
				</tr>

				<tr>
				<td><?php echo $entry_data_feed; ?></td>
				<td><i><?php echo $data_feed; ?></i></td>
				</tr>
			</table>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>