<?php echo $header ?>
<style>
	.tab-inner-form {float:left;width:200px;border-right:1px #CCC dotted;margin-right:20px}
	.tab-inner-description {overflow:hidden}
</style>

<div id="content">

<div class="breadcrumb">
	<?php foreach ($breadcrumbs as $breadcrumb) { ?>
	<?php echo $breadcrumb['separator'] ?><a href="<?php echo $breadcrumb['href'] ?>"><?php echo $breadcrumb['text'] ?></a>
	<?php } ?>
</div>

<div class="box">

	<div class="heading">
	<h1><img src="view/image/module.png" /><?php echo $heading_title ?></h1>
	<div class="buttons">
		<a onclick="$('#setting-form').submit();" class="button"><?php echo $button_save ?></a>
		<a onclick="location='<?php echo $url_cancel ?>';" class="button"><?php echo $button_cancel ?></a>
	</div>
	</div>

<div class="content">
 
	<div id="tabs" class="htabs">
	<a href="#tab-connection"><?php echo $oc_smsc_tab_connection ?></a>
	<a href="#tab-admin"><?php echo $oc_smsc_tab_member ?></a>
	<a href="#tab-customer"><?php echo $oc_smsc_tab_customer ?></a>
	</div>

	<form action="<?php echo $url_action ?>" method="post" enctype="multipart/form-data" id="setting-form">

		<div id="tab-connection">

		<div class="tab-inner-form">

			<p>
			<label>
				<?php echo $oc_smsc_text_login ?> <span class="required">*</span><br />
				<input type="text" name="oc_smsc_login" value="<?php echo (isset($value_oc_smsc_login) ? $value_oc_smsc_login :false) ?>" />
			</label>
			</p>

			<p>
			<label>
				<?php echo $oc_smsc_text_password ?> <span class="required">*</span><br />
				<input type="password" name="oc_smsc_password" value="<?php echo (isset($value_oc_smsc_password) ? $value_oc_smsc_password : false) ?>" />
			</label>
			</p>

			<p>
			<label>
				<?php echo $oc_smsc_text_signature ?><br />
				<input type="text" name="oc_smsc_signature" value="<?php echo (isset($value_oc_smsc_signature) ? $value_oc_smsc_signature : false) ?>" />
			</label>
			</p>

		</div>

		<div class="tab-inner-description">

			<p>
			<?php echo $oc_smsc_text_connection_tab_description ?>
			</p>

		</div>

		</div>

		<div id="tab-admin">

		<p>
			<?php echo $oc_smsc_text_notify_by_sms ?>:
		</p>

		<p>
			<label>
			<input type="checkbox" name="oc_smsc_admin_new_customer" value="1" <?php echo (isset($value_oc_smsc_admin_new_customer) ? 'checked="checked"' : false) ?> />
			<?php echo $oc_smsc_text_admin_new_customer ?>
			</label>
		</p>

		<p>
			<label>
			<input type="checkbox" name="oc_smsc_admin_new_order" value="1" <?php echo (isset($value_oc_smsc_admin_new_order) ? 'checked="checked"' : false) ?> />
			<?php echo $oc_smsc_text_admin_new_order ?>
			</label>
		</p>

		<p>
			<label>
			<input type="checkbox" name="oc_smsc_admin_new_email" value="1" <?php echo (isset($value_oc_smsc_admin_new_email) ? 'checked="checked"' : false) ?> />
			<?php echo $oc_smsc_text_admin_new_email ?>
			</label>
		</p>

		</div>

		<div id="tab-customer">

		<p>
			<?php echo $oc_smsc_text_notify_by_sms ?>:
		</p>

		<p>
			<label>
			<input type="checkbox" name="oc_smsc_customer_new_order_status" value="1" <?php echo (isset($value_oc_smsc_customer_new_order_status) ? 'checked="checked"' : false) ?> />
			<?php echo $oc_smsc_text_customer_new_order_status ?>
			</label>
		</p>

		<p>
			<label>
			<input type="checkbox" name="oc_smsc_customer_new_register" value="1" <?php echo (isset($value_oc_smsc_customer_new_register) ? 'checked="checked"' : false) ?> />
			<?php echo $oc_smsc_text_customer_new_register ?>
			</label>
		</p>

		</div>
		<input type="hidden" name="setting_form" value="1" />

	</form>
 
</div>

</div>

</div>

<script type="text/javascript">
<!--
$('#tabs a').tabs();
//-->
</script>

<?php echo $footer ?>
