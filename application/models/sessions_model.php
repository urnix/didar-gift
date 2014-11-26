<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Sessions_model extends CI_Model
{

    public function login($sert_identifier)
    {
        $result_array = $this->db->query("SELECT id FROM @certificates WHERE sert_identifier = '$sert_identifier' AND status = 'paid'")->result_array();
        $certExist = count($result_array);
        if ($certExist) {
            $sertId = $result_array[0]['id'];
            $result_array2 = $this->db->query("SELECT token FROM @sessions WHERE sert_id = $sertId")->result_array();
            $sessionExist = count($result_array2);
            if ($sessionExist) {
                $this->db->query("UPDATE @sessions SET expiration_time = TIMESTAMPADD(MINUTE, 15, NOW()) WHERE sert_id = $sertId");
                return $result_array2[0]['token'];
            } else {
                $token = $this->generateToken();
                $this->db->query("INSERT INTO @sessions (sert_id, token, expiration_time) VALUES ($sertId, '$token', TIMESTAMPADD(MINUTE, 15, NOW()))");
                return $token;
            }
        } else {
            return false;
        }
    }

    function generateToken()
    {
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomString = '';
        for ($i = 0; $i < 6; $i++) {
            $randomString .= $characters[rand(0, strlen($characters) - 1)];
        }
        return $randomString;
    }

    public function getStatus($token)
    {
        $this->db->query("DELETE FROM @sessions WHERE expiration_time < NOW()");
        $result_array = $this->db->query("SELECT s.sert_id, (SELECT 1 FROM @certificates c WHERE c.id = s.sert_id AND c.status != 'paid' ) is_spent FROM @sessions s WHERE s.token = '$token'")->result_array();
        if (count($result_array)) {
            $sertId = $result_array[0]['sert_id'];
            $this->db->query("UPDATE @sessions SET expiration_time = TIMESTAMPADD(MINUTE, 15, NOW()) WHERE sert_id = $sertId");
            if ($result_array[0]['is_spent'] == 1) {
                return 'spent';
            } else {
                return 'active';
            }
        } else {
            return 'not logged';
        }
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */