<?php  

class ControllerModuleBrands extends Controller {

	protected function index($setting) {

		

	

	

	$this->load->model('catalog/category');	

		

		if (isset($this->request->get['path'])) {

			$path = '';

			

				

			foreach (explode('_', $this->request->get['path']) as $path_id) {

				if (!$path) {

					$path = $path_id;

				} else {

					$path .= '_' . $path_id;

				}

				

				$category_info = $this->model_catalog_category->getCategory($path_id);

				

				

			}

			$category_id=$category_info['category_id'];

		

		

		$this->document->addScript('catalog/view/javascript/jquery/menu-collapsed.js');

		

		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/style_menu.css')) {

			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/style_menu.css');

		} else {

			$this->document->addStyle('catalog/view/theme/default/stylesheet/style_menu.css');

		}

	

		

		

	

		if (isset($this->request->get['product_id'])) {

			$product_id = (int)$this->request->get['product_id'];

		} else {

			$product_id = 0;

		}

		

		$this->data['product_id'] = $product_id ;

		

		/*инфо про товар*/

		$this->load->model('catalog/product');

		

		$product_info = $this->model_catalog_product->getProduct($product_id);

		

		if ($product_info) {

		$this->data['manufacturer_id'] = $product_info['manufacturer_id'];

		 //$this->data['category_id'] =  $product_info['category_id'];

		  $this->data['product_id']= $product_info['product_id'];

		

		}



	

		

	 	

	

	

	

	

	/*масив всех бренедов магазина*/

	

	

			$this->data['manufacturers'] = array();

									

		$results = $this->model_catalog_manufacturer->getManufacturers();

	

		foreach ($results as $result) {

			

			

			$this->data['manufacturers'][] = array(

				'manufacturer_id' => $result['manufacturer_id'],

				'name' => $result['name'],

				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id'])

			);

		}

		

		

		/*выбор брендов  с учетом  категории*/

		

foreach ($this->data['manufacturers'] as $result) {

		$manufacturer_id= $result['manufacturer_id'];

		//echo '<br>'.$manufacturer_id= $result['manufacturer_id'].'-';

		

	if (isset($this->request->get['sort'])) {

			$sort = $this->request->get['sort'];

		} else {

			$sort = 'p.sort_order';

		}



		if (isset($this->request->get['order'])) {

			$order = $this->request->get['order'];

		} else {

			$order = 'ASC';

		}

		

		if (isset($this->request->get['page'])) {

			$page = $this->request->get['page'];

		} else { 

			$page = 1;

		}	

							

		if (isset($this->request->get['limit'])) {

			$limit = $this->request->get['limit'];

		} else {

			$limit = 100;

		}

	

	$this->data['products'] = array();

	

			

			$data = array(

			'filter_manufacturer_id' => $manufacturer_id, 

				'filter_category_id' => $category_id, 

				'sort'               => $sort,

				'order'              => $order,

				'start'              => ($page - 1) * $limit,

				'limit'              => $limit

			);

					

			$product_total = $this->model_catalog_product->getTotalProducts($data); 

			

			

			/*если есть товары по условию формируем масив товра*/

			if($product_total)

				{

				$results2 = $this->model_catalog_product->getProducts($data);

				

				$product_data = array();

				foreach ($results2 as $result2) {

				

								

				$product_data[] = array(

					'product_id'  => $result2['product_id'],

					'name'        => $result2['name'],

					'href'        => $this->url->link('product/product', 'path=' . $this->request->get['path'] . '&product_id=' . $result2['product_id'])

				);

			

			}

			

			

			$this->data['brands'][] = array(
			'product_total' => $product_total,
				'manufacturer_id' => $result['manufacturer_id'],
				'name' => $result['name'],
				'href' => $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $result['manufacturer_id']),
				'products'    => $product_data				

			);	

			
	

							

			}

		}

		

		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/brands.tpl')) {

			$this->template = $this->config->get('config_template') . '/template/module/brands.tpl';

		} else {

			$this->template = 'default/template/module/brands.tpl';

		}

		

		$this->render();

		

		

		

	}}

}

?>