<?php
class ControllerPaymentukrsib extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('payment/ukrsib');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('ukrsib', $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$this->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');

		$this->data['entry_bank'] = $this->language->get('entry_bank');
		$this->data['entry_total'] = $this->language->get('entry_total');
		$this->data['entry_order_status'] = $this->language->get('entry_order_status');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');

		$this->data['entry_login'] = $this->language->get('entry_login');
		$this->data['entry_pass'] = $this->language->get('entry_pass');

		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

		$this->data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->error['login_error'])) {
			$this->data['login_error'] = $this->error['login_error'];
		} else {
			$this->data['login_error'] = '';
		}
		if (isset($this->error['pass_error'])) {
			$this->data['pass_error'] = $this->error['pass_error'];
		} else {
			$this->data['pass_error'] = '';
		}

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();

		foreach ($languages as $language) {
			if (isset($this->error['bank_' . $language['language_id']])) {
				$this->data['error_bank_' . $language['language_id']] = $this->error['bank_' . $language['language_id']];
			} else {
				$this->data['error_bank_' . $language['language_id']] = '';
			}
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/ukrsib', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

		$this->data['action'] = $this->url->link('payment/ukrsib', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');

		foreach ($languages as $language) {
			if (isset($this->request->post['ukrsib_bank_' . $language['language_id']])) {
				$this->data['ukrsib_bank_' . $language['language_id']] = $this->request->post['ukrsib_bank_' . $language['language_id']];
			} else {
				$this->data['ukrsib_bank_' . $language['language_id']] = $this->config->get('ukrsib_bank_' . $language['language_id']);
			}
		}

		$this->data['languages'] = $languages;

		if (isset($this->request->post['ukrsib_total'])) {
			$this->data['ukrsib_total'] = $this->request->post['ukrsib_total'];
		} else {
			$this->data['ukrsib_total'] = $this->config->get('ukrsib_total');
		}

		if (isset($this->request->post['ukrsib_login'])) {
			$this->data['ukrsib_login'] = $this->request->post['ukrsib_login'];
		} else {
			$this->data['ukrsib_login'] = $this->config->get('ukrsib_login');
		}
		if (isset($this->request->post['ukrsib_pass'])) {
			$this->data['ukrsib_pass'] = $this->request->post['ukrsib_pass'];
		} else {
			$this->data['ukrsib_pass'] = $this->config->get('ukrsib_pass');
		}

		if (isset($this->request->post['ukrsib_order_status_id'])) {
			$this->data['ukrsib_order_status_id'] = $this->request->post['ukrsib_order_status_id'];
		} else {
			$this->data['ukrsib_order_status_id'] = $this->config->get('ukrsib_order_status_id');
		}

		$this->load->model('localisation/order_status');

		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();

		if (isset($this->request->post['ukrsib_geo_zone_id'])) {
			$this->data['ukrsib_geo_zone_id'] = $this->request->post['ukrsib_geo_zone_id'];
		} else {
			$this->data['ukrsib_geo_zone_id'] = $this->config->get('ukrsib_geo_zone_id');
		}

		$this->load->model('localisation/geo_zone');

		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();

		if (isset($this->request->post['ukrsib_status'])) {
			$this->data['ukrsib_status'] = $this->request->post['ukrsib_status'];
		} else {
			$this->data['ukrsib_status'] = $this->config->get('ukrsib_status');
		}

		if (isset($this->request->post['ukrsib_sort_order'])) {
			$this->data['ukrsib_sort_order'] = $this->request->post['ukrsib_sort_order'];
		} else {
			$this->data['ukrsib_sort_order'] = $this->config->get('ukrsib_sort_order');
		}


		$this->template = 'payment/ukrsib.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/ukrsib')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		$this->load->model('localisation/language');

		$languages = $this->model_localisation_language->getLanguages();

		foreach ($languages as $language) {
			if (!$this->request->post['ukrsib_bank_' . $language['language_id']]) {
				$this->error['bank_' .  $language['language_id']] = $this->language->get('error_bank');
			}
		}

		if (!$this->request->post['ukrsib_login']) {
			$this->error['login_error'] = $this->language->get('login_error');
		}
		if (!$this->request->post['ukrsib_pass']) {
			$this->error['pass_error'] = $this->language->get('pass_error');
		}

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>