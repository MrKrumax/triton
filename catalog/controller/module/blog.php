<?php
class ControllerModuleBlog extends Controller {
	protected function index($setting) {
		$this->language->load('module/blog');
		
		
		 $this->data['sort_order'] = $setting['sort_order'];
		  $this->data['position'] = $setting['position'];
		  $this->data['limit'] = $setting['limit'];
		  $this->data['img_width'] = $setting['width'];
		   $this->data['img_height'] = $setting['height'];

    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_readon'] = $this->language->get('text_readon');
		$this->data['text_all_materiall'] = $this->language->get('text_all_materiall');
		$this->data['entry_rating'] = $this->language->get('entry_rating');



 //echo $setting['number_blog'].'<br>';
		if ($setting['number_blog']) {
			$this->data['number_blog']= $setting['number_blog'] ;
		}

		if (isset($this->request->get['blog_id'])) {
			$parts = explode('_', (string)$this->request->get['blog_id']);
		} else {
			$parts = array();
		}

		if (isset($parts[0])) {
			$this->data['blog_id'] = $parts[0];
		} else {
			$this->data['blog_id'] = 0;
		}

		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}

        $this->load->model('catalog/blog');
		$this->load->model('catalog/record');

		$this->data['blogies'] = array();

		$blogies = $this->model_catalog_blog->getBlogies(0);

		foreach ($blogies as $blog) {

        $blog_info = $this->model_catalog_blog->getBlog($blog['blog_id']);

        $this->load->model('tool/image');

         if ($blog_info) {
             	if ($blog_info['image']) {
				$thumb = $this->model_tool_image->resize($blog_info['image'],$this->config->get('config_image_wishlist_width'), $this->config->get('config_image_wishlist_height'), 1);
			} else {
				$thumb = '';
			}

         }


			$children_data = array();

			$children = $this->model_catalog_blog->getBlogies($blog['blog_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_blog_id'  => $child['blog_id'],
					'filter_sub_blog' => true
				);

				$record_total = $this->model_catalog_record->getTotalRecords($data);


				 $blog_child_info = $this->model_catalog_blog->getBlog($child['blog_id']);



		         if ($blog_child_info) {
		             	if ($blog_child_info['image']) {
						$thumb_child = $this->model_tool_image->resize($blog_child_info['image'], $this->config->get('config_image_wishlist_width'), $this->config->get('config_image_wishlist_height'), 1);
					} else {
						$thumb_child = '';
					}

		         }





				$children_data[] = array(
					'blog_id' => $child['blog_id'],
					'name'        => $child['name'],
					'count'		  => $record_total,
					'thumb' 	  => $thumb_child,
					'href'        => $this->url->link('record/blog', 'blog_id=' . $blog['blog_id'] . '_' . $child['blog_id'])
				);
			}

			$data = array(
				'filter_blog_id'  => $blog['blog_id'],
				'filter_sub_blog' => true
			);

			$record_total = $this->model_catalog_record->getTotalRecords($data);
			
			
			##############################
			
			
			$records_data = array();

			$blog_id=$blog['blog_id'];
			
			$this->data[''] = array();
			

			$data = array(
				'filter_blog_id' => $blog_id,
				'limit'              => $this->data['limit'],
				'start' => 0,
				'filter_blog_id' => $blog_id,
				'sort'               => 'p.date_added',
				'order'              => 'DESC',
				//'start'              => ($page - 1) * $limit,
				
				
				
			);

			 $record_total = $this->model_catalog_record->getTotalRecords($data);
			
			
			$results = $this->model_catalog_record->getRecords($data);

                foreach ($results as $result) {
				if ($result['image']) {
					  $foto = $this->model_tool_image->resize($result['image'], $this->data['img_width'], $this->data['img_height']);
				} else {
					  $foto = $this->model_tool_image->resize('no_image.jpg', $this->data['img_width'], $this->data['img_height']);
					
				}




				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_comment_status')) {
					$rating = (int)$result['rating'];
				} else {
					$rating = false;
				}


//echo mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 100) . '..';
//$l_desc=wordwrap($result['description'],30,"\t",1);

$simbol=".";
$simbol2=",";
$len=strlen ($result['description']);
	
if ($len>'200')
{
	
	$position=strpos (strip_tags(html_entity_decode($result['description']), '<br>,  <br/>, <span>, </span>'), $simbol, 200);
	if (!$position) 
	{
	$position=strpos (strip_tags(html_entity_decode($result['description']), '<br>,  <br/>, <span>, </span>'), $simbol2, 200);
	}
	//$description=strip_tags (substr($result['description'], 0, $position+1), '<br>, <br/>, <span>, </span>'); 
	$description=substr(strip_tags(html_entity_decode($result['description']), '<br>,  <br/>, <span>, </span>'), 0, $position+1); 
	

}
else
{
 $description=strip_tags(html_entity_decode($result['description']), '<br>,  <br/>, <span>, </span>'); 
}






				$records_data[] = array(
					'record_id'  => $result['record_id'],
					
					
					'name'        => $result['name'],
					//'description' => mb_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, 220) . '..',
					'description' => $description,
					
					'rating'      => $result['rating'],
					'date_added'        => $result['date_added'],
					
					'date_added'        => date("d.m.Y", strtotime($result['date_added'])) ,
					
					'viewed'        => $result['viewed'],
					'comments'     => (int)$result['comments'],
					'href'        => $this->url->link('record/record', 'blog_id=' . $blog_id. '&record_id=' . $result['record_id']),
					'foto'     => $foto
					
					
				);
			}
		
			
			
			
																		 
																		 
		 #################
			
			
			

			$this->data['blogies'][] = array(
				'blog_id' => $blog['blog_id'],
				'name'        => $blog['name'],
				'children'    => $children_data,
				'count'		  => $record_total,
				'recorder'     => $records_data,
				'meta'		  => $blog['meta_description'],
				'thumb'		  => $thumb,
				'href'        => $this->url->link('record/blog', 'blog_id=' . $blog['blog_id'])
			);
			
			
		}










		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog.tpl') AND $this->data['position']=='column_left' ) {
			$this->template = $this->config->get('config_template') . '/template/module/blog.tpl';
		} elseif (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/blog2.tpl') AND $this->data['position']=='content_bottom' ){
			$this->template = 'default/template/module/blog2.tpl';
		} else {
			$this->template = 'default/template/module/blog.tpl';
		}





		$this->render();
  	}
}
?>