<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Welcome extends CI_Controller {


	/*public function index()
	{
		$this -> load -> model('blog_category_model');
		$this -> load -> model('blog_model');


		$cate_id = $this -> input -> get('cateId');
		if(!$cate_id){
			//查所有的文章
			$blogs = $this -> blog_model -> get_all();
		}else{
			//根据类别查询该类别下的所有文章
			$blogs = $this -> blog_model -> get_by_category($cate_id);
		}
		//查所有的文章类别
		$categories = $this -> blog_category_model -> get_all();

		//跳转页面
		$this->load->view('index', array(
			'categories' => $categories,
			'blogs' => $blogs
		));
	}*/
	public function index(){
		$this -> load -> model('blog_category_model');
		$this -> load -> model('blog_model');
		$categories = $this -> blog_category_model -> get_all();
		$blogs = $this -> blog_model -> get_all();
		$this->load->view('index', array(
			'categories' => $categories,
			'blogs' => $blogs
		));
	}

	public function get_blogs(){
		$this -> load -> model('blog_model');

		$cate_id = $this -> input -> get('cateId');
		if(!$cate_id){
			$blogs = $this -> blog_model -> get_all();
		}else{
			$blogs = $this -> blog_model -> get_by_category($cate_id);
		}

		echo json_encode($blogs);
	}

	public function view_blog(){
		$blog_id = $this -> input -> get('blogId');
		$this -> load -> model('blog_model');
		$this -> load -> model('comment_model');
		$blog = $this -> blog_model -> get_by_id($blog_id);
		$blog -> comments = $this -> comment_model -> get_by_blog($blog_id);
		if($blog){
			$this -> load -> view('blog_detail', array(
				'blog' => $blog
			));
		}else{
			echo '未查到指定文章!';
		}
	}
	public function comment(){
		$this -> load -> model('comment_model');
		$username = $this -> input -> post('username');
		$email = $this -> input -> post('email');
		$phone = $this -> input -> post('phone');
		$message = $this -> input -> post('message');
		$blog_id = $this -> input -> post('blogId');
		$rows = $this -> comment_model -> save($username, $email, $phone, $message, $blog_id);
		if($rows > 0){
			echo 'success';
		}else{
			echo 'fail';
		}
	}

	public function list_blog(){
		$this -> load -> model('blog_model');
		$blogs = $this -> blog_model -> get_by_page();
		$this -> load -> view('blog_list', array(
			'blogs' => $blogs
		));
	}

	public function get_more(){
		$this -> load -> model('blog_model');
		$offset = $this -> input -> get('offset');
		$blogs = $this -> blog_model -> get_by_page($offset);
		echo json_encode($blogs);
	}

}
