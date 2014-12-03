<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Cert_orders_model extends CI_Model
{

    public function create_order($email, $source)
    {
        return $this->db->query("INSERT INTO @cert_orders (email, source) VALUES ('$email', '$source')");
    }


}
/* End of file orders_model.php */
/* Location: ./application/models/orders_model.php */
