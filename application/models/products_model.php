<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Products_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT p.name, p.description, i.path img FROM @products p, @images i, @products_images pi WHERE pi.product_id = p.id AND pi.image_id = i.id AND pi.is_primary = 1 LIMIT 6");
        return $query->result_array();
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */