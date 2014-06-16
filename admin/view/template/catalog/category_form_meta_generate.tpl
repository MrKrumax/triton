<?php echo $header; ?>
<div id="content">
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/category.png" alt="" /> Генерировать Meta-description</h1>
        </div>
        <div class="content">

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <table class="form">
                    <tr>
                        <td><span class="required">*</span> Шаблон <br>
                            <span class="help">В шаблоне нужно вставить идентификатор позиции названия категории (<? echo  $meta_desc_cat; ?>).</span>
                        </td>
                        <td><input type="text" name="meta_desc_template" maxlength="255" size="100" value="<?php echo $meta_desc_template; ?>" />
                            <?php if (isset($error_meta_desc_template)) { ?>
                            <span class="error"><?php echo $error_meta_desc_template; ?></span>
                            <?php } ?></td>
                    </tr>
                 </table>
            </form>
            <div class="buttons">
                <a onclick="$('#form').submit();" class="button">Сгенерировать</a>
            </div>

            <table class="list">
                <thead>
                <tr>
                    <td class="right">Название</td>
                    <td class="right">Meta-Description</td>
                </tr>
                </thead>
                <tbody>
                <?php if ($category_meta_desc) { ?>
                <?php foreach ($category_meta_desc as $category) { ?>
                <tr>
                    <td ><?php echo $category['name']; ?>
                    <td ><?php echo $category['meta_description']; ?>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                    <td class="center" colspan="4">нет</td>
                </tr>
                <?php } ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php echo $footer; ?>