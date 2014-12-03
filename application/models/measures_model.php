<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Measures_model extends CI_Model
{

    public function get_list()
    {
        $query = $this->db->query("SELECT m.id, m.name, m.description, i.path img FROM @measures m, @images i WHERE m.image_id = i.id LIMIT 6");
        return $query->result_array();
    }

    public function get_one($id)
    {
        $query = $this->db->query("SELECT m.id, m.name, m.description, i.path img FROM @measures m, @images i WHERE m.image_id = i.id AND m.id = $id");
        $result_array = $query->result_array();
        $measure = $result_array[0];
        return $measure;
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */