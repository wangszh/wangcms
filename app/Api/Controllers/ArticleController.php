<?php
/**
 * Created by PhpStorm.
 * User: jnjsgcjyzx
 * Date: 2016/6/29
 * Time: 13:45
 */

namespace Douyasi\Api\Controllers;


use Barryvdh\Debugbar\Controllers\BaseController;
use Douyasi\Models\Content;

class ArticleController extends BaseController
{
   public function index()
   {
       $articles=Content::all();
       return $articles;
   }

}