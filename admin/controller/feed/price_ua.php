<?php
class ControllerFeedPriceUa extends Controller {

	private $error = array();

	public function index() {
		$this->load->language('feed/price_ua');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
			if (isset($this->request->post['price_ua_categories'])) {
				$this->request->post['price_ua_categories'] = implode(',', $this->request->post['price_ua_categories']);
			}

			$this->model_setting_setting->editSetting('price_ua', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_data_feed'] = $this->language->get('entry_data_feed');
		$this->data['entry_shopname'] = $this->language->get('entry_shopname');
		$this->data['entry_company'] = $this->language->get('entry_company');
		$this->data['entry_category'] = $this->language->get('entry_category');
		$this->data['entry_currency'] = $this->language->get('entry_currency');
		$this->data['entry_in_stock'] = $this->language->get('entry_in_stock');
		$this->data['entry_out_of_stock'] = $this->language->get('entry_out_of_stock');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		$this->data['breadcrumbs'] = array();

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_home'),
			'separator' => FALSE
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('text_feed'),
			'separator' => ' :: '
		);

		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('feed/yml', 'token=' . $this->session->data['token'], 'SSL'),
			'text'      => $this->language->get('heading_title'),
			'separator' => ' :: '
		);

		$this->data['action'] = $this->url->link('feed/price_ua', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/feed', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['price_ua_status'])) {
			$this->data['price_ua_status'] = $this->request->post['price_ua_status'];
		} else {
			$this->data['price_ua_status'] = $this->config->get('price_ua_status');
		}

		$this->data['data_feed'] = HTTP_CATALOG . 'index.php?route=export/price_ua';

		if (isset($this->request->post['price_ua_shopname'])) {
			$this->data['price_ua_shopname'] = $this->request->post['price_ua_shopname'];
		} else {
			$this->data['price_ua_shopname'] = $this->config->get('price_ua_shopname');
		}

		/*if (isset($this->request->post['price_ua_company'])) {
			$this->data['price_ua_company'] = $this->request->post['price_ua_company'];
		} else {
			$this->data['price_ua_company'] = $this->config->get('price_ua_company');
		}

		if (isset($this->request->post['price_ua_currency'])) {
			$this->data['price_ua_currency'] = $this->request->post['price_ua_currency'];
		} else {
			$this->data['price_ua_currency'] = $this->config->get('price_ua_currency');
		}*/

		if (isset($this->request->post['price_ua_in_stock'])) {
			$this->data['price_ua_in_stock'] = $this->request->post['price_ua_in_stock'];
		} elseif ($this->config->get('price_ua_in_stock')) {
			$this->data['price_ua_in_stock'] = $this->config->get('price_ua_in_stock');
		} else {
			$this->data['price_ua_in_stock'] = 7;
		}

		if (isset($this->request->post['price_ua_out_of_stock'])) {
			$this->data['price_ua_out_of_stock'] = $this->request->post['price_ua_out_of_stock'];
		} elseif ($this->config->get('price_ua_in_stock')) {
			$this->data['price_ua_out_of_stock'] = $this->config->get('price_ua_out_of_stock');
		} else {
			$this->data['price_ua_out_of_stock'] = 5;
		}

		$this->load->model('localisation/stock_status');

		$this->data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();

		$this->load->model('catalog/category');

		$this->data['categories'] = $this->model_catalog_category->getCategories(0);

		if (isset($this->request->post['price_ua_categories'])) {
			$this->data['price_ua_categories'] = $this->request->post['price_ua_categories'];
		} elseif ($this->config->get('price_ua_categories') != '') {
			$this->data['price_ua_categories'] = explode(',', $this->config->get('price_ua_categories'));
		} else {
			$this->data['price_ua_categories'] = array();
		}

		/*$this->load->model('localisation/currency');
		$currencies = $this->model_localisation_currency->getCurrencies();
		$allowed_currencies = array_flip(array('RUR', 'RUB', 'BYR', 'KZT', 'UAH'));
		$this->data['currencies'] = array_intersect_key($currencies, $allowed_currencies);*/

		$this->template = 'feed/price_ua.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render(), $this->config->get('config_compression'));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'feed/price_ua')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}
	}
}
?>
