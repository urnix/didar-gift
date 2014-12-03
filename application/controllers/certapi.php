<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Certapi extends CI_Controller
{


    public function products()
    {
        $categoryId = $this->input->get('category_id');
        $measureId = $this->input->get('measure_id');
        $this->load->model('products_model');
        $list = $this->products_model->get_list($categoryId, $measureId);
        $list = $this->wr($list);
        echo json_encode(array('products' => $list));
        return;
    }

    private function wr($list)
    {
        for ($i = 0; $i < count($list); $i++) {
            $list[$i]['img'] = '../gift/' . $list[$i]['img'];
        }
        return $list;
    }

    public function measures()
    {
        $this->load->model('measures_model');
        $list = $this->measures_model->get_list();
        $list = $this->wr($list);
        echo json_encode(array('measures' => $list));
        return;
    }

    public function cert_order()
    {
        $data = json_decode(file_get_contents("php://input"));
        $this->load->model('cert_orders_model');
        $success = $this->cert_orders_model->create_order($data->email, $data->source);
        if ($success) {
            $response['status'] = 'ok';
            echo json_encode($response);
            return;
        } else {
            echo json_encode(array('error' => 'failed cert_order creation'));
        }
    }

}

/* End of file certapi.php */
/* Location: ./application/controllers/certapi.php */