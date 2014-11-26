<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Products_model extends CI_Model
{

    public function get_list($categoryId)
    {
        $extraFrom = "";
        $extraWhere = "";
        if ($categoryId) {
            $extraFrom .= ', @products_categories pc ';
            $extraWhere .= "AND pc.product_id = p.id AND pc.category_id = $categoryId ";
        }
        $sql = "SELECT p.id, p.name, p.description, i.path img FROM @products p, @images i, @products_images pi " . $extraFrom . "WHERE pi.product_id = p.id AND pi.image_id = i.id AND pi.is_primary = 1 " . $extraWhere . "LIMIT 6";
        $query = $this->db->query($sql);
        return $query->result_array();
    }

    public function get_one($id)
    {
        $query = $this->db->query("SELECT p.id, p.name, p.description, i.path img FROM @products p, @images i, @products_images pi WHERE  pi.product_id = p.id AND pi.image_id = i.id AND pi.is_primary = 1 AND p.id = $id");
        $result_array = $query->result_array();
        $product = $result_array[0];
        $catQuery = $this->db->query("SELECT c.id, c.name FROM @categories c, @products_categories pc WHERE pc.product_id = $id AND pc.category_id = c.id");
        $product['categories'] = $catQuery->result_array();
        $catQuery = $this->db->query("SELECT m.id, m.name FROM @measures m, @products_measures pm WHERE pm.product_id = $id AND pm.measure_id = m.id");
        $product['measures'] = $catQuery->result_array();
        return $product;
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */