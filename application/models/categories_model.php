<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Categories_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT c.name, c.description, i.path img FROM @categories c, @images i WHERE c.image_id = i.id LIMIT 6");
        return $query->result_array();
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */