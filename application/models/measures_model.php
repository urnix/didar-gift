<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Measures_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT m.name, m.description, i.path img FROM @measures m, @images i WHERE m.image_id = i.id LIMIT 6");
        return $query->result_array();
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */