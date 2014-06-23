<?php
class ModelExportPriceUa extends Model {
	public function getCategory() {
		//$cache = md5('ModelExportPriceUa_getCategory');

		//$query = $this->cache->get('exportPriceUa.' . $cache);

		//if(!$query)
		//{
			$query = $this->db->query("SELECT cd.name, c.category_id, c.parent_id FROM " . DB_PREFIX . "category c LEFT JOIN " . DB_PREFIX . "category_description cd ON (c.category_id = cd.category_id) WHERE c.status = '1'");
			//$this->cache->set('exportPriceUa.' . $cache, $query);
		//}

		return $query->rows;
	}

	public function getProduct($allowed_categories, $out_of_stock_id, $vendor_required = true) {
	/*	$cache = md5('ModelExportPriceUa_getProduct'.$allowed_categories.$out_of_stock_id);

		$query = $this->cache->get('exportPriceUa.' . $cache);

		if(!$query)
		{*/
			$query = $this->db->query("SELECT p.*, pd.name, pd.description, m.name AS manufacturer, p2c.category_id, p.price AS price FROM " . DB_PREFIX . "product p JOIN " . DB_PREFIX . "product_to_category AS p2c ON (p.product_id = p2c.product_id) " . ($vendor_required ? '' : 'LEFT ') . "JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2c.category_id IN (" . $this->db->escape($allowed_categories) . ") AND p.status = '1' AND (p.quantity > '0' OR p.stock_status_id != '" . (int)$out_of_stock_id . "') GROUP BY p.product_id");
		/*	$this->cache->set('exportPriceUa.' . $cache, $query);
		}*/
		return $query->rows;
	}
	
	
	public function getCountProduct($allowed_categories, $out_of_stock_id, $vendor_required = true) {
//		$cache = md5('ModelExportPriceUa_getCountProduct'.$allowed_categories.$out_of_stock_id);
//
//		$query = $this->cache->get('exportPriceUa.' . $cache);
//
//		if(!$query)
//		{
			$query = $this->db->query("SELECT count(*) AS count FROM (SELECT p.product_id FROM " . DB_PREFIX . "product p JOIN " . DB_PREFIX . "product_to_category AS p2c ON (p.product_id = p2c.product_id) " . ($vendor_required ? '' : 'LEFT ') . "JOIN " . DB_PREFIX . "manufacturer m ON (p.manufacturer_id = m.manufacturer_id) LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p2c.category_id IN (" . $this->db->escape($allowed_categories) . ") AND p.status = '1' AND (p.quantity > '0' OR p.stock_status_id != '" . (int)$out_of_stock_id . "') GROUP BY p.product_id) AS count");
//			$this->cache->set('exportPriceUa.' . $cache, $query);
//		}

		return $query->row;
	}
}
?>
