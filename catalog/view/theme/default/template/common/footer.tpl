
</div>
<div id="footer_curier">
<div id="footer">
        <div id="footer_left">
            <div id="footer_left_up">
            <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
            
             </div>
             <div id="footer_left_middle">
                 <div id="footer_soc">
                 <div>Следите за нами в соц. сетях:</div> <a target="_blank" href="http://vk.com/triton.online"><img src="image/site/ico_soc_13.png"></a> <a target="_blank" href="https://www.facebook.com/TritonOnline"><img src="image/site/ico_soc_15.png"></a> <a target="_blank" href="http://www.odnoklassniki.ru/tritononline"><img src="image/site/ico_soc_17.png"></a> <a target="_blank" href="https://plus.google.com/107695828771832104398/"><img src="image/site/ico_soc_19.png"></a>
                 <a target="_blank" href="http://www.youtube.com/channel/UCmls6m6roIGcoimq0dyG1gQ"><img src="image/site/ico_soc_21.png"></a>
                  </div>
                  <div id="footer_search">
                  <div id="search">
   
    <?php if ($filter_name) { ?>
    <input type="text" name="filter_name2" value="<?php echo $filter_name; ?>" />
    <?php } else { ?>
    <input type="text" name="filter_name2" value="<?php echo $text_search; ?>" onclick="this.value = '';" onkeydown="this.style.color = '#000000';" />
    <?php } ?>
   <div class="button-search2"></div>
  </div>
                  </div>
             </div> 

             <div id="footer_left_dawn">
             <div id="powered"><?php echo $powered; ?></div>
            
             </div> 
 
        </div> 
        <div id="footer_right">
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
  <tr>
    <td> </td>
    <td><a href="/index.php?route=information/information&information_id=12" style="color:#FFF">Как нас найти</a></td>
  </tr>
</table>

        </div> 
</div>
</div>


<!-- Yandex.Metrika counter -->
<script type="text/javascript">
(function (d, w, c) {
    (w[c] = w[c] || []).push(function() {
        try {
            w.yaCounter21552562 = new Ya.Metrika({id:21552562,
                    webvisor:true,
                    clickmap:true,
                    trackLinks:true,
                    accurateTrackBounce:true});
        } catch(e) { }
    });

    var n = d.getElementsByTagName("script")[0],
        s = d.createElement("script"),
        f = function () { n.parentNode.insertBefore(s, n); };
    s.type = "text/javascript";
    s.async = true;
    s.src = (d.location.protocol == "https:" ? "https:" : "http:") + "//mc.yandex.ru/metrika/watch.js";

    if (w.opera == "[object Opera]") {
        d.addEventListener("DOMContentLoaded", f, false);
    } else { f(); }
})(document, window, "yandex_metrika_callbacks");
</script>
<noscript><div><img src="//mc.yandex.ru/watch/21552562" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
<!-- /Yandex.Metrika counter -->

</body></html>