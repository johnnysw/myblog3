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

    public function mgr_blog($cate_id=0, $offset=0){
        $title = $this -> input -> get('title');
        $this -> load -> model('blog_model');
        $total_rows = $this -> blog_model -> get_all_count($cate_id, $title);

        /*分页配置信息开始*/
        $this->load->library('pagination');

        $config['base_url'] = 'admin/blog/'.$cate_id.'/';
        $config['total_rows'] = $total_rows;
        $config['per_page'] = 10;
        $config['uri_segment'] = 4;

        $this->pagination->initialize($config);

        /*分页配置信息结束*/

        $this -> load -> model('blog_category_model');
        $categories = $this -> blog_category_model -> get_all();
        $blogs = $this -> blog_model -> get_by_page($cate_id, $title, $config['per_page'], $offset);
        $this -> load -> view('admin/admin_blog', array(
            'categories' => $categories,
            'blogs' => $blogs
        ));

    }

    public function add_blog(){
        $this -> load -> model('blog_category_model');
        $categories = $this -> blog_category_model -> get_all();

        $this -> load -> view('admin/add_blog', array(
            'categories' => $categories,
        ));
    }

    public function post_blog(){


        $config['upload_path'] = './upload/';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['max_size'] = '3076';
        $config['file_name'] = date("YmdHis") . '_' . rand(10000, 99999);


        $this->load->library('upload', $config);

        if ($this->upload->do_upload("img"))
        {
            $title = htmlspecialchars($this -> input -> post('title'));
            $cate_id = $this -> input -> post('cateId');
            $clicked = htmlspecialchars($this -> input -> post('clicked'));
            $content = htmlspecialchars($this -> input -> post('content'));

            $upload_data = $this -> upload -> data();

            $this -> load -> library("image_lib");
            //压缩小图
            $config['image_library'] = 'gd2';
            $config['source_image'] = $upload_data['full_path'];
            $config['thumb_marker'] = '_thumb';
            $config['create_thumb'] = TRUE;
            $config['maintain_ratio'] = TRUE;
            $config['master_dim'] = 'width';
            $config['width'] = 330;
            $config['height'] = 240;
            $config['maintain_ratio'] = FALSE;

            $this -> image_lib -> initialize($config);
            $this -> image_lib -> resize();
            $this -> image_lib -> clear();

            $img = 'upload/'.$upload_data['raw_name'] . '_thumb'  . $upload_data['file_ext'];

            //压缩大图
            $config['image_library'] = 'gd2';
            $config['source_image'] = $upload_data['full_path'];
            $config['thumb_marker'] = '';
            $config['create_thumb'] = TRUE;
            $config['maintain_ratio'] = TRUE;
            $config['master_dim'] = 'width';
            $config['width'] = 1170;
            $config['height'] = 400;

            $this -> image_lib -> initialize($config);
            $this -> image_lib -> resize();
            $this -> image_lib -> clear();

            $big_img = 'upload/'.$upload_data['raw_name'] . $upload_data['file_ext'];


            $this -> load -> model('blog_model');
            $rows = $this -> blog_model -> save($title, $cate_id, $clicked, $content, $img, $big_img);
            if($rows > 0){
                redirect('admin/blog');
            }else{
                echo '发表文章失败';
            }
        }else{
            var_dump($this->upload->display_errors());
            echo '文件上传失败!';
        }


    }

}
