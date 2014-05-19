<?php
class ControllerPaymentukrsib extends Controller {
	protected function index() {
		$this->language->load('payment/ukrsib');

		$this->data['text_instruction'] = $this->language->get('text_instruction');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_payment'] = $this->language->get('text_payment');
		$this->data['text_wait'] = $this->language->get('text_wait');
		

		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['bank'] = nl2br($this->config->get('ukrsib_bank_' . $this->config->get('config_language_id')));

		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
		//print_r($order_info);
		//echo round($order_info['total'],2);

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/ukrsib.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/ukrsib.tpl';
		} else {
			$this->template = 'default/template/payment/ukrsib.tpl';
		}

		$this->render();
	}

	public function send() {
		$json = array();

		//xml
		$this->load->model('checkout/order');
				
		$order_info = $this->model_checkout_order->getOrder($this->session->data['order_id']);
        $arrComment = explode('<br>', $order_info['comment']);

		if ($order_info) {
            $goodslist = array();
            $this->load->model('catalog/product');
            $this->load->model('catalog/category');
	        $login = $this->config->get('ukrsib_login');
	        $pass  = $this->config->get('ukrsib_pass');

            $xml = '<?xml version="1.0" encoding="UTF-8" ?>
                    <order xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="ecom-application-form.xsd">
                        <login>' . $login . '</login>
                        <pwd>' . $pass . '</pwd>
                        <orderid>' . $this->session->data['order_id'] . '</orderid>
                        <totalsum>' . round($order_info['total'],2) . '</totalsum>
                        <personinfo>
                            <surname>' . $order_info['lastname'] . '</surname>
                            <first_name>' . $order_info['firstname'] . '</first_name>
                            <patronymic_name>' . $arrComment[0] . '</patronymic_name>
                        <tin>' . trim($arrComment[2]) . '</tin>
                        <birthday>' . trim($arrComment[1]) . '</birthday>
                        <email>' . $order_info['email'] . '</email>
                        <mobile_phone>' . substr($order_info['telephone'], 3) . '</mobile_phone>
                        </personinfo>
                        <goods>
                        ';

				// Products

				foreach ($this->cart->getProducts() as $product) {
                    $cats = $this->model_catalog_product->getCategories($product['product_id']);
                    $cat = end($cats);
                    $category_info = $this->model_catalog_category->getCategory($cat['category_id']);
                    //$product_info = $this->model_catalog_product->getProduct($product['product_id']);
                    //print_r($cats);
                    $xml.="<good>
                            <id>".$product['product_id']."</id>
                            <classificationid>".$category_info['category_id']."</classificationid>
                            <classificationname>".$category_info['name']."</classificationname>
                            <name>".$product['name']."</name>
                            <price>".$product['price']."</price>
                            <amount>".$product['quantity']."</amount>
					      </good>
							";
				}
				$xml.="</goods>\n";
			$xml.="</order>";

			$this->data['xml'] =  ($xml);

			error_reporting(E_ALL);
			ini_set('show_errors', true);

            $url = 'ratanet-backup.ukrsibbank.com';
			$header  = 'Host: ' . $url . "\r\n";

			$header .= 'Accept	text/plain, */*; q=0.01' . "\r\n";
			$header .= 'Accept-Encoding	gzip, deflate' . "\r\n";
			$header .= 'Connection: close' . "\r\n";
			$header .= 'Content-Type: text/xml; charset=UTF-8' . "\r\n";
			//$header .= 'Content-Length: ' . strlen($xml) . "\r\n";

			$curl = curl_init();

            curl_setopt($curl, CURLOPT_URL, 'https://ratanet-backup.ukrsibbank.com/coliseum/jsp/ecommerce');
            curl_setopt($curl, CURLOPT_FAILONERROR,true);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER,true);
            curl_setopt($curl, CURLOPT_POST, true);
            //curl_setopt($curl, CURLOPT_FOLLOWLOCATION,true);
            curl_setopt($curl, CURLOPT_HTTPHEADER, Array('Content-Type: text/xml; charset=UTF-8'));
            curl_setopt($curl, CURLOPT_POSTFIELDS,$xml);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, FALSE);
            curl_setopt($curl, CURLOPT_SSLVERSION, 3);
            curl_setopt($curl, CURLOPT_PROXY, null);
			
			$response = curl_exec($curl);
			
			if (curl_errno($curl)) {
				 //curl_error($curl);
				 //echo 'Ошибка curl: ' . curl_error($curl);
				 //print_r($response);
				$this->log->write('DoDirectPayment failed: ' . curl_error($curl) . '(' . curl_errno($curl) . ')');
				$json['error'] = 'error';
				 //die('qwe');
			} else {
                echo urldecode($response);
                curl_close($curl);
                //die;
				

				//print_r($response);
				//preg_match('/<member><name>faultString<\/name><value><string>(.+)<\/string><\/value><\/member>/', $response, $match);
				//die('asd');
				//if (isset($match[1])) {
				//	$json['error'] = utf8_encode($match[1]);
				//} else 
				//{
					$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('ukrsib_order_status_id'));
					//echo var_dump($response);
					$json['redirect'] = $this->url->link('catalog/blog');
					//die('qweqweqe');
				//}		
			}		
		}


		$this->response->setOutput(json_encode($json));	
	}	

	public function confirm() {
		$this->language->load('payment/ukrsib');

		$this->load->model('checkout/order');

		$comment  = $this->language->get('text_instruction') . "\n\n";
		$comment .= $this->config->get('ukrsib_bank_' . $this->config->get('config_language_id')) . "\n\n";
		$comment .= $this->language->get('text_payment');

		$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('ukrsib_order_status_id'), $comment, true);
	}
}
?>