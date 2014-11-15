<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Sessions_model extends CI_Model
{

    public function login($sert_identifier)
    {
        $result_array = $this->db->query("SELECT id FROM @certificates WHERE sert_identifier = '$sert_identifier' AND paid_up = 1")->result_array();
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

    public function isActual($token)
    {
        $this->db->query("DELETE FROM @sessions WHERE expiration_time < NOW()");
        $result_array = $this->db->query("SELECT sert_id FROM @sessions WHERE token = '$token'")->result_array();
        $sessionExist = count($result_array);
        if ($sessionExist) {
            $sertId = $result_array[0]['sert_id'];
            $this->db->query("UPDATE @sessions SET expiration_time = TIMESTAMPADD(MINUTE, 15, NOW()) WHERE sert_id = $sertId");
        }
        return $sessionExist;
    }

}
/* End of file products_model.php */
/* Location: ./application/models/products_model.php */