<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Products_model extends CI_Model
{

	public function get_list(){
		return $this->db->query("SELECT * FROM @products")->result_array();
	}

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */