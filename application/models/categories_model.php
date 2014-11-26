<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Categories_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT c.id, c.name, c.description, i.path img FROM @categories c, @images i WHERE c.image_id = i.id LIMIT 6");
        return $query->result_array();
    }

    public function get_one($id)
    {
        $query = $this->db->query("SELECT c.id, c.name, c.description FROM @categories c WHERE c.id = $id");
        $result_array = $query->result_array();
        $category = $result_array[0];
        return $category;
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */