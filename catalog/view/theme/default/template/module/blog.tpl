<div class="box green">
  
      
        <?php foreach ($blogies as $blog) {  ?>
       <?php if ($blog['blog_id'] == $number_blog) {  ?>
      
       
         <div class="box-heading blog"><? echo  $blog['name']; ?> <span style="font-size:12px; color:#666666">(</span><a href="<?php echo $blog['href']; ?>" class="readon">Все новости</a><span style="font-size:12px; color:#666666">)</span></div>
  <div class="box-content">
   
       <ul>
       
          <?php if ($blog['recorder']) {  ?>
    
      
       
      <li>

  <div class="record-list_s">
  
    <?php foreach ($blog['recorder'] as $record) { ?>
    <div class="record-one_s">
    <div class="record-one-left_s">
         <?php if ($record['foto']) { ?>
    <div class="image" ><img src="<?php echo $record['foto']; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>

    <a href="<?php echo $record['href']; ?>"  class="button">подробнее</a>
    </div>

       <div class="record-one-right_s">
        <div class="name"><a href="<?php echo $record['href']; ?>" ><?php echo $record['name']; ?></a></div>
        <div class="description"><?php echo $record['description']; ?>

        </div>
        <div class="rating">
        <img src="/catalog/view/theme/default/image/stars-<?php echo  $record['rating']; ?>.png"  alt="<?php echo  $record['comments']; ?>"  />
       </div>
       </div>


    </div>

 <?php } ?>


 </li>

 <?php } ?>
        
      
        
      </ul>
   
  </div><?php } } ?>
</div>
