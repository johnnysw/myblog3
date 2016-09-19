<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {

    public function index(){
        $this -> load -> view('admin/admin_index');
    }

	public function login(){
        $this -> load -> view('admin/admin_login');
    }

    public function mgr_category(){
        $this -> load -> model('blog_category_model');
        $categories = $this -> blog_category_model -> get_all();
        $this -> load -> view('admin/admin_category', array(
            'categories' => $categories
        ));

    }

    public function add_category(){
        $this -> load -> view('admin/add_category');

    }

    public function save_category(){
        $cate_name = $this -> input -> post('cate_name');
        $this -> load -> model('blog_category_model');
        $rows = $this -> blog_category_model -> save($cate_name);
        if($rows > 0){
            redirect('admin/category');
        }else{
            echo '添加类型失败!';
        }
    }

    public function delete_category(){
        $cate_id = $this -> input -> get('cateId');
        $this -> load -> model('blog_category_model');
        $rows = $this -> blog_category_model -> delete($cate_id);
        if($rows > 0){
            echo 'success';
        }else{
            echo 'fail';
        }
    }

    public function delete_selected_category(){
        $cate_ids = $this -> input -> get('cateIdStr');
        $this -> load -> model('blog_category_model');
        $rows = $this -> blog_category_model -> delete_selected($cate_ids);
        if($rows > 0){
            echo 'success';
        }else{
            echo 'fail';
        }
    }

}
