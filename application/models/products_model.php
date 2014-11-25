<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Products_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT p.id, p.name, p.description, i.path img FROM @products p, @images i, @products_images pi WHERE pi.product_id = p.id AND pi.image_id = i.id AND pi.is_primary = 1 LIMIT 6");
        return $query->result_array();
    }

    public function get_one($id)
    {
        $query = $this->db->query("SELECT p.id, p.name, p.description, i.path img FROM @products p, @images i, @products_images pi WHERE  pi.product_id = p.id AND pi.image_id = i.id AND pi.is_primary = 1 AND p.id = $id");
        $result_array = $query->result_array();
        return $result_array[0];
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */