<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Blog_model extends CI_Model {


	public function get_all(){
		$this -> db -> order_by('post_date', 'desc');//排序规则
//		$this -> db -> limit(3);//限制查询的条数
		return $this -> db -> get('t_blog') -> result();
	}

	public function get_by_category($cate_id){
		$this -> db -> order_by('post_date', 'desc');//排序规则
//		$this -> db -> limit(3);//限制查询的条数
		return $this -> db -> get_where('t_blog', array('cate_id' => $cate_id)) -> result();
	}

	public function  get_by_id($blog_id){
		//return $this -> db -> get_where('t_blog', array('blog_id'=>$blog_id)) -> row();
		$this -> db -> select('blog.*, cate.cate_name');
		$this -> db -> from('t_blog blog');
		$this -> db -> join('t_blog_category cate', 'blog.cate_id=cate.cate_id');
		$this -> db -> where('blog.blog_id', $blog_id);
		return $this -> db -> get() -> row();
		/*$query = $this -> db -> query('select blog.*, cate.cate_name from t_blog blog, t_blog_category cate where blog.cate_id=cate.cate_id and blog.blog_id='.$blog_id);
		return $query -> row();*/
	}
	public function get_by_page($cate_id, $title, $limit=6, $offset=0){
		$this -> db -> select('blog.*, cate.cate_name');
		$this -> db -> from('t_blog blog');
		$this -> db -> join('t_blog_category cate', 'blog.cate_id=cate.cate_id');
		$this -> db -> where('cate.is_delete', 0);
		if($cate_id != 0){
			$this -> db -> where('cate.cate_id', $cate_id);
		}
		if($title){
			$this -> db -> like('blog.title', $title);
		}
		$this -> db -> order_by('blog.blog_id', 'desc');
		$this -> db -> limit($limit, $offset);
		return $this -> db -> get() -> result();
	}
	public function get_all_count($cate_id, $title){
		$this -> db -> select('blog.*, cate.cate_name');
		$this -> db -> from('t_blog blog');
		$this -> db -> join('t_blog_category cate', 'blog.cate_id=cate.cate_id');
		$this -> db -> where('cate.is_delete', 0);
		if($cate_id != 0){
			$this -> db -> where('cate.cate_id', $cate_id);
		}
		if($title){
			$this -> db -> like('blog.title', $title);
		}
		return $this->db->count_all_results();
	}

	public function save($title, $cate_id, $clicked, $content, $img, $big_img){
		$this -> db -> insert('t_blog', array(
			'title' => $title,
			'cate_id' => $cate_id,
			'clicked' => $clicked,
			'content' => $content,
			'img' => $img,
			'big_img' => $big_img
		));
		return $this -> db -> affected_rows();
	}
}
