<?php

namespace Douyasi\Http\Requests;

use Douyasi\Http\Requests\Request;

class TagRequest extends Request
{

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        //return false;
        return true;
    }

    /**
     * �Զ�����֤����rules
     *
     * @return array
     */
    public function rules()
    {
        //update
        if($this->segment(3)){
            $id = $this->segment(3);
            $rules = [
                'name'    => 'required|max:20|unique:metas,name,'.$id.',id,type,CATEGORY',
                'slug'    => 'required|max:10|eng_alpha_dash|unique:metas,slug,'.$id.',id,type,CATEGORY',
            ];
        }
        //store
        else{
            $rules = [
                'name'    => 'required|max:20|unique:metas,name,NULL,id,type,CATEGORY',
            ];
        }
        return $rules;
    }

    /**
     * �Զ�����֤��Ϣ
     *
     * @return array
     */
    public function messages()
    {
        return [
            'name.required'       => '����д��������',
            'name.max'            => '�������ƹ���',
            'name.unique'         => '����ͬ������',
            'slug.required'       => '����д����������',
            'slug.max'            => '��������������',
            'slug.unique'         => '����ͬ������������',
            'slug.eng_alpha_dash' => '����������ֻ�����֡���ĸ���»������ܣ�0-9A-Za-z_-�����',
        ];
    }
}
