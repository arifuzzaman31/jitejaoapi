<?php
namespace App\Repository\Category;

use App\Helpers\AllStatic;
use App\Models\Category\Category;

class CategoryRepository
{
    public function getCategoryList($data = [])
    {
        $per_page = 10;
        if ($data['per_page']) {
            $per_page = $data['per_page'];
        }
        $keyword  = $data['keyword'];
        $category = Category::orderBy('total_demand', 'desc');
        if ($keyword) {
            $category->where(function ($query) use ($keyword) {
                $query->where('name', 'LIKE', '%' . $keyword . '%')
                    ->orWhere('english_name', 'LIKE', '%' . $keyword . '%');
            });
        }

        if ($data['status'] != '') {
            $category->where('status', '=', $data['status']);
        }

        if ($data['no_pagination']) {
            if ($data['take_only']) {
                $category->take($data['take_only']);
            }
            $category = $category->get();
        } else {
            $category = Category::paginate($per_page);
        }

        return $category;
    }

    public function getSingleCategoryWithSeller($category_id)
    {
        $category = Category::with(['user' => function ($query) {
            $query->where('is_seller', '=', AllStatic::$seller)
                ->where('status', '=', AllStatic::$active);
        }])->find($category_id);

        return $category;
    }
    public function getCategorWithUnit($category_id)
    {
        $category = Category::with(['quantity_unit'])->find($category_id);
        return $category;
    }
}
