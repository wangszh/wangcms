<?php

namespace Douyasi\Repositories;

use Douyasi\Models\Content;
use Douyasi\Models\Tag;

/**
 * 元仓库MetaRepository
 * “Meta”中国大陆一般译为“元”，表示那些对主体事物起到辅助性描述的信息，这里我们把内容的“分类”与“标签”作为元信息
 * 当前“标签”功能暂未完善
 *
 * @author raoyc<raoyc2009@gmail.com>
 */
class TagRepository extends BaseRepository
{

    /**
     * The Content instance.
     *
     * @var Douyasi\Models\Content
     */
    protected $content;

    /**
     * Create a new MetaRepository instance.
     *
     * @param  Douyasi\Models\Meta $meta
     * @param  Douyasi\Models\Content $content
     * @return void
     */
    public function __construct(
        Tag $tag,
        Content $content)
    {
        $this->model = $tag;
        $this->content = $content;
    }

    /**
     * 获取元模型所有类型
     *
     * @return array
     */
    private function getModelTypes()
    {
        return [
            //'category', //分类
            'tag', //标签
        ];
    }

    /**
     * 获取所有Meta元数据
     *
     * @param  string $type 元模型类型 分类category,标签tag
     * @return Illuminate\Support\Collection
     */
    public function all($type = 'tag')
    {
        if ($type === 'tag') {
            $tags = $this->model->tag()->get();
        } 
        return $tags;
    }

    /**
     * 创建或更新Meta分类
     *
     * @param  Douyasi\Models\Meta $meta
     * @param  array $inputs
     * @return Douyasi\Models\Meta
     */
    private function saveTag($tag, $inputs)
    {
        $tag->name              = e($inputs['name']);
        $tag->description       = e($inputs['description']);
        $tag->type              = 'tag';
        if (array_key_exists('slug', $inputs)) {
            $tag->slug = e($inputs['slug']) ;
        }
        $tag->save();
        return $tag;
    }

    /**
     * 侦测当前元（分类|标签）是否有内容（文章|单页）在所使用
     *
     * @param  string $type 元模型类型 分类category,标签tag
     * @param  int $id
     * @return boolean 如果元被内容所使用，则返回true，否则返回false
     */
    public function hasContent($type = 'tag', $id)
    {
        if ($type === 'tag') {
             $content = $this->content->article()->where('tag_id', '=', $id)->get();
            if ($content->isEmpty()) {
                return false;
            } else {
                return true;
            }
        }
    }

    #********
    #* 资源 REST 相关的接口函数 START
    #********
    /**
     * 元资源列表数据
     * 注：暂使用all()返回所有元数据，不进行分页与搜索处理
     *
     * @param  array $data
     * @param  string $type 元类型 分类category,标签tag
     * @param  string $size 分页大小
     * @return Illuminate\Support\Collection
     */
    public function index($data = [], $type = 'tag', $size = '10')
    {
        return $this->all($type);
    }

    /**
     * 存储元(Meta)
     *
     * @param  array $inputs
     * @param  string $type 元模型类型 分类category,标签tag
     * @return Douyasi\Models\Meta
     */
    public function store($inputs, $type = 'tag')
    {
        if ($type === 'tag') {
            $tag = new $this->model;
            $tag = $this->saveTag($tag, $inputs);
        }
        return $tag;
    }

    /**
     * 获取编辑的元(Meta)
     *
     * @param  int $id
     * @param  string $type 元模型类型 分类category,标签tag
     * @return Illuminate\Support\Collection
     */
    public function edit($id, $type = 'tag')
    {
        if ($type === 'tag') {
            $meta = $this->model->tag()->findOrFail($id);
        }
        return $tag;
    }

    /**
     * 更新元(Meta)
     *
     * @param  int $id
     * @param  array $inputs
     * @param  string $type 元模型类型 分类category,标签tag
     * @return void
     */
    public function update($id, $inputs, $type = 'tag')
    {
        if ($type === 'tag') {
            $tag = $this->model->category()->findOrFail($id);
            $tag = $this->saveTag($tag, $inputs);
        }
    }

    /**
     * 删除元(Meta)
     *
     * @param  string $type 元模型类型 分类category,标签tag
     * @param  int $id
     * @return void
     */
    public function destroy($id, $type = 'tag')
    {
        if ($type === 'tag') {
            $tag = $this->model->tag()->findOrFail($id);
        }
        $tag->delete();
    }
    #********
    #* 资源 REST 相关的接口函数 END
    #********
}
