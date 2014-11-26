<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller
{

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     *        http://example.com/index.php/welcome
     *    - or -
     *        http://example.com/index.php/welcome/index
     *    - or -
     * Since this controller is set as the default controller in
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */
    public function index()
    {
        $this->load->view('welcome_message');
    }

    public function login()
    {
        $data = json_decode(file_get_contents("php://input"));
        $this->load->model('sessions_model');
        if (property_exists($data, 'sert_identifier') && strlen($data->sert_identifier) >= 6) {
            $token = $this->sessions_model->login($data->sert_identifier);
            if ($token) {
                $response['status'] = 'ok';
                $response['auth_token'] = $token;
                echo json_encode($response);
                return;
            }
        }
        echo json_encode(array('error' => 'not logged'));
        return;
    }

    public function empty_()
    {
        $this->checkAuth();
        echo json_encode(array());
        return;
    }

    public function checkAuth()
    {
        $this->load->model('sessions_model');

//        $headers = $this->input->request_headers();
//        $authorization = $headers['Authorization'];
        $authorization = $this->input->get('Authorization');

        if (!isset($authorization) || $authorization == null || empty($authorization) || !$this->sessions_model->isActual(substr($authorization, 7))) {
            echo json_encode(array('error' => 'not logged'));
            die;
        }
    }

    public function products()
    {
        $this->checkAuth();
        $categoryId = $this->input->get('category_id');
        $this->load->model('products_model');
        echo json_encode(array('products' => $this->products_model->get_list($categoryId)));
        return;
    }

    public function product($id)
    {
        $this->checkAuth();
        if ($id) {
            $this->load->model('products_model');
            echo json_encode(array('product' => $this->products_model->get_one($id)));
        } else {
            echo json_encode(array('error' => 'invalid params'));
        }
        return;
    }

    public function measures()
    {
        $this->checkAuth();
        $this->load->model('measures_model');
        echo json_encode(array('measures' => $this->measures_model->get_list()));
        return;
    }

    public function categories()
    {
        $this->checkAuth();
        $this->load->model('categories_model');
        echo json_encode(array('categories' => $this->categories_model->get_list()));
        return;
    }

    public function category($id)
    {
        $this->checkAuth();
        if ($id) {
            $this->load->model('categories_model');
            echo json_encode(array('category' => $this->categories_model->get_one($id)));
        } else {
            echo json_encode(array('error' => 'invalid params'));
        }
        return;
    }

}

/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */