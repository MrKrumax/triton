<?php

class ControllerExportPriceUa extends Controller {
	private $shop = array();
	private $currencies = array();
	private $categories = array();
	private $offers = array();
	private $from_charset = 'utf-8';
	private $eol = "\n";

	public function index() {
		if ($this->config->get('price_ua_status')) {
            ini_set("memory_limit", "128M");

			if (!($allowed_categories = $this->config->get('price_ua_categories'))) exit();

			$this->load->model('export/price_ua');
			$this->load->model('localisation/currency');
			$this->load->model('tool/image');

			// Магазин
			$this->setShop('name', $this->config->get('price_ua_shopname'));


			if (isset($this->request->get['id'])) {
				$price_id = $this->request->get['id'];
				$start_limit = ($price_id * 2000) - 2000;
			}


			// Категории
			$categories = $this->model_export_price_ua->getCategory();

			foreach ($categories as $category) {
				$this->setCategory($category['name'], $category['category_id'], $category['parent_id']);
			}
            unset($categories);
			// Товарные предложения
			$in_stock_id = $this->config->get('price_ua_in_stock'); // id статуса товара "В наличии"
			$out_of_stock_id = $this->config->get('price_ua_out_of_stock'); // id статуса товара "Нет на складе"
			$vendor_required = false; // true - только товары у которых задан производитель, необходимо для 'vendor.model'

            $products = $this->model_export_price_ua->getProduct($allowed_categories, $out_of_stock_id, $vendor_required);

            foreach ($products as $product) {
                $data = array();

                // Атрибуты товарного предложения
                $data['id'] = $product['product_id'];
//				$data['type'] = 'vendor.model';
                $data['available'] = ($product['quantity'] > 0 || $product['stock_status_id'] == $in_stock_id);
//				$data['bid'] = 10;
//				$data['cbid'] = 15;

                // Параметры товарного предложения
                $data['url'] = $this->url->link('product/product', 'path=' . $this->getPath($product['category_id']) . '&product_id=' . $product['product_id']);
                //$data['priceuah'] = number_format($this->currency->convert($this->tax->calculate($product['price'], $product['tax_class_id']), $shop_currency, $offers_currency), $decimal_place, '.', '');
                $data['priceuah'] = $product['price'];
                $data['categoryId'] = $product['category_id'];
                //$data['warranty'] = 'true';
                $data['name'] = $product['name'];
                $data['vendor'] = $product['manufacturer'];
                $data['description'] = $product['description'];

                if ($product['image']) {
                    $data['image'] = HTTP_IMAGE . $product['image'];//$this->model_tool_image->resize($product['image'], 300, 300);
                }
                //print_r($data);
                $this->setOffer($data);
            }
            unset($product);

            //$this->categories = array_filter($this->categories, array($this, "filterCategory"));
           // print_r($this->offers);die;
//            $this->response->addHeader('Content-Type: application/xml');
//            $this->response->setOutput($this->getXml())
            $data_xls = $this->getXml();
            file_put_contents('triton_online_price.xml',$data_xls);
//            $this->response->addheader('Pragma: public');
//            $this->response->addheader('Connection: Keep-Alive');
//            $this->response->addheader('Expires: 0');
//            $this->response->addheader('Content-Description: File Transfer');
//            $this->response->addheader('Content-Type: application/octet-stream');
//            $this->response->addheader('Content-Disposition: attachment; filename=triton_online_price.xml');
//            $this->response->addheader('Content-Transfer-Encoding: binary');
//            $this->response->addheader('Content-Length: '. strlen($data_xls));
//            $this->response->setOutput($data_xls);
        }
	}

	/**
	 * Методы формирования YML
	 */

	/**
	 * Формирование массива для элемента shop описывающего магазин
	 *
	 * @param string $name - Название элемента
	 * @param string $value - Значение элемента
	 */
	private function setShop($name, $value) {
		$allowed = array('name', 'company', 'url', 'phone', 'platform', 'version', 'agency', 'email');
		if (in_array($name, $allowed)) {
			$this->shop[$name] = $this->prepareField($value);
		}
	}



	/**
	 * Категории товаров
	 *
	 * @param string $name - название рубрики
	 * @param int $id - id рубрики
	 * @param int $parent_id - id родительской рубрики
	 * @return bool
	 */
	private function setCategory($name, $id, $parent_id = 0) {
		$id = (int)$id;
		if ($id < 1 || trim($name) == '') {
			return false;
		}
		if ((int)$parent_id > 0) {
			$this->categories[$id] = array(
				'id'=>$id,
				'parentId'=>(int)$parent_id,
				'name'=>$this->prepareField($name)
			);
		} else {
			$this->categories[$id] = array(
				'id'=>$id,
				'name'=>$this->prepareField($name)
			);
		}

		return true;
	}

	/**
	 * Товарные предложения
	 *
	 * @param array $data - массив параметров товарного предложения
	 */
	private function setOffer($data) {
		$offer = array();
        $offer['id'] = $data['id'];
		//$attributes = array('id', 'available');
//		$attributes = array('id');
//		$attributes = array_intersect_key($data, array_flip($attributes));
//
//		foreach ($attributes as $key => $value) {
//			switch ($key)
//			{
//				case 'id':
                    //$offer['id'] = $value;
//                    break;
//                case 'available':
//                $offer['available'] = ($value ? 'true' : 'false');
//					break;
//
//
//				default:
//					break;
//			}
//		}

		//$type = isset($offer['type']) ? $offer['type'] : '';

		$allowed_tags = array('name'=>0, 'categoryId'=>1, 'priceuah'=>1,'url'=>0, 'image'=>0, 'vendor'=>0, 'description'=>0);

		//$allowed_tags = array_merge($allowed_tags, array('description'=>0, 'warranty'=>0));

		//$required_tags = $allowed_tags;

//		if (sizeof(array_intersect_key($data, $required_tags)) != sizeof($required_tags)) {
//			//return;
//		}

		//$data = array_intersect_key($data, $allowed_tags);
//		if (isset($data['tarifplan']) && !isset($data['provider'])) {
//			unset($data['tarifplan']);
//		}

		$allowed_tags = array_intersect_key($allowed_tags, $data);

		// Стандарт XML учитывает порядок следования элементов,
		// поэтому важно соблюдать его в соответствии с порядком описанным в DTD
		$offer['data'] = array();
		foreach ($allowed_tags as $key => $value) {
			$offer['data'][$key] = $this->prepareField($data[$key]);
		}

		$this->offers[] = $offer;
	}

	/**
	 * Формирование XML файла
	 *
	 * @return string
	 */
	private function getXml() {
		$yml  = '';
		/*$yml  .= '<?xml version="1.0" encoding="windows-1251"?>' . $this->eol;*/
		$yml  .= '<?xml version="1.0" encoding="UTF-8"?>' . $this->eol;
		//$yml .= '<!DOCTYPE yml_catalog SYSTEM "shops.dtd">' . $this->eol;
		$yml .= '<price date="' . date('Y-m-d H:i') . '">' . $this->eol;

		// информация о магазине
		$yml .= $this->array2Tag($this->shop);

		// валюты
		/*$yml .= '<currencies>' . $this->eol;
		foreach ($this->currencies as $currency) {
			$yml .= $this->getElement($currency, 'currency');
		}
		$yml .= '</currencies>' . $this->eol;*/

		// категории<catalog>

		$yml .= '<catalog>' . $this->eol;
		foreach ($this->categories as $key => $category) {
			$category_name = $category['name'];
			unset($category['name'], $category['export']);
			$yml .= $this->getElement($category, 'category', $category_name);
            //unset($this->categories[$key]);
		}
		$yml .= '</catalog>' . $this->eol;

		// товарные предложения
		$yml .= '<items>' . $this->eol;
		foreach ($this->offers as $key=>$offer) {
			$tags = $this->array2Tag($offer['data']);
			unset($offer['data']);
			if (isset($offer['param'])) {
				$tags .= $this->array2Param($offer['param']);
				unset($offer['param']);
			}
			$yml .= $this->getElement($offer, 'item', $tags);
            //unset ($this->offers[$key]);
		}
		$yml .= '</items>' . $this->eol;

		$yml .= '</price>';

		return $yml;
	}

	/**
	 * Фрмирование элемента
	 *
	 * @param array $attributes
	 * @param string $element_name
	 * @param string $element_value
	 * @return string
	 */
	private function getElement($attributes, $element_name, $element_value = '') {
		$retval = '<' . $element_name . ' ';
		foreach ($attributes as $key => $value) {
			$retval .= $key . '="' . $value . '" ';
		}
		$retval .= $element_value ? '>' . $this->eol . $element_value . '</' . $element_name . '>' : '/>';
		$retval .= $this->eol;

		return $retval;
	}

	/**
	 * Преобразование массива в теги
	 *
	 * @param array $tags
	 * @return string
	 */
	private function array2Tag($tags) {
		$retval = '';
		foreach ($tags as $key => $value) {
			$retval .= '<' . $key . '>' . $value . '</' . $key . '>' . $this->eol;
		}

		return $retval;
	}

	/**
	 * Преобразование массива в теги параметров
	 *
	 * @param array $params
	 * @return string
	 */
	private function array2Param($params) {
		$retval = '';
		foreach ($params as $param) {
			$retval .= '<param name="' . $this->prepareField($param['name']);
			if (isset($param['unit'])) {
				$retval .= '" unit="' . $this->prepareField($param['unit']);
			}
			$retval .= '">' . $this->prepareField($param['value']) . '</param>' . $this->eol;
		}

		return $retval;
	}

	/**
	 * Подготовка текстового поля в соответствии с требованиями Яндекса
	 * Запрещаем любые html-тэги, стандарт XML не допускает использования в текстовых данных
	 * непечатаемых символов с ASCII-кодами в диапазоне значений от 0 до 31 (за исключением
	 * символов с кодами 9, 10, 13 - табуляция, перевод строки, возврат каретки). Также этот
	 * стандарт требует обязательной замены некоторых символов на их символьные примитивы.
	 * @param string $text
	 * @return string
	 */
	private function prepareField($field) {
		$field = htmlspecialchars_decode($field);
		$field = strip_tags($field);
		$from = array('"', '&', '>', '<', '\'');
		$to = array('&quot;', '&amp;', '&gt;', '&lt;', '&apos;');
		$field = str_replace($from, $to, $field);
		if ($this->from_charset != 'windows-1251') {
			//$field = iconv($this->from_charset, 'windows-1251//IGNORE//TRANSLIT', $field);
		}
		$field = preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#is', ' ', $field);

		return trim($field);
	}

	protected function getPath($category_id, $current_path = '') {
		if (isset($this->categories[$category_id])) {
			$this->categories[$category_id]['export'] = 1;

			if (!$current_path) {
				$new_path = $this->categories[$category_id]['id'];
			} else {
				$new_path = $this->categories[$category_id]['id'] . '_' . $current_path;
			}	

			if (isset($this->categories[$category_id]['parentId'])) {
				return $this->getPath($this->categories[$category_id]['parentId'], $new_path);
			} else {
				return $new_path;
			}

		}
	}

	function filterCategory($category) {
		return isset($category['export']);
	}
}
?>