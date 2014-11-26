<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Orders_model extends CI_Model
{

    public function create_order($token, $productId, $client)
    {
        $sertId = $this->getSertUd($token);
        $sql = "INSERT INTO @orders (certificate_id, product_id, name, address, phone, email) VALUES ($sertId , $productId, '$client->name', '$client->address', '$client->phone', '$client->email')";
        $result = $this->db->query($sql);

        $sql = "UPDATE @certificates SET status = 'ordered' WHERE id = $sertId";
        $result = $result && $this->db->query($sql);

        return $result;
    }

    private function getSertUd($token)
    {
        $result_array = $this->db->query("SELECT sert_id FROM @sessions WHERE token = '$token'")->result_array();
        return $result_array[0]['sert_id'];
    }

}
/* End of file orders_model.php */
/* Location: ./application/models/orders_model.php */
