<?php

namespace Douyasi\Http\Controllers\Admin;

use Douyasi\Http\Requests\CategoryRequest;
use Douyasi\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Douyasi\Repositories\MetaRepository;
use Douyasi\Services\Tree;

/**
 * 分类资源控制器
 *
 * @author raoyc <raoyc2009@gmail.com>
 */
class AdminCategoryController extends BackController
{
    
    /**
     * The MetaRepository instance.
     *
     * @var Douyasi\Repositories\MetaRepository
     */
    protected $meta;


    public function __construct(
        MetaRepository $meta)
    {
        parent::__construct();
        $this->meta = $meta;
        
        if (! user('object')->can('manage_contents')) {
            $this->middleware('deny403');
        }
    }

   
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */

   

    public function index()
    {
        //
        $categories =$this->meta->all();
        $select=Tree::getTree($categories);
        
        return view('back.category.index',compact('select'));
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
        $categories =$this->meta->all()->toArray();
        $select=Tree::dropDownSelect(Tree::genTree($categories));
        //dd($select);
        return view('back.category.create',compact('select'));
    }


    /**
     * Store a newly created resource in storage.
     *
     * @return Response
     */
    public function store(CategoryRequest $request)
    {
        //
         //$data = (array) Request::input('old');
        $data = $request->all();
        //dd($data);
        $meta = $this->meta->store($data, 'category');
        if ($meta->id) {
            return redirect()->route('admin.category.index')->with('message', '成功新增分类！');
        } else {
            return redirect()->back()->withInput($request->input())->with('fail', '数据库操作返回异常！');
        }
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        //
       $categories =$this->meta->all()->toArray();
       $select=Tree::dropDownSelect(Tree::genTree($categories),$id);
        //$category = $this->meta->edit($id, 'category');
        $data = $this->meta->edit($id, 'category');

        //dd($select);
        //return view('back.category.edit', ['data' => $category,'select'=>$select]);
        return view('back.category.edit',compact('data','select'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(CategoryRequest $request, $id)
    {
        $data = $request->all();
        $this->meta->update($id, $data, 'category');
        return redirect()->route('admin.category.index')->with('message', '修改分类成功！');
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy($id)
    {
        if ($id == 1) {
            return redirect()->route('admin.category.index')->with('fail', 'ID为1的默认分类不能被删除！！');
        } else {
            if ($this->meta->hasContent('category', $id)) {
                return redirect()->route('admin.category.index')->with('fail', '该分类下还存在文章，不能被删除；请清空该分类下文章后再试！！');
            } else {
                $this->meta->destroy($id, 'category');
                return redirect()->route('admin.category.index')->with('message', '删除分类成功！');
            }
        }
    }

	
}
