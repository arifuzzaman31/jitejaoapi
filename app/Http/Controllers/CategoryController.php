<?php

namespace App\Http\Controllers;

use App\Http\Resources\CategoryResource;
use App\Models\CategoryQuantityUnit;
use App\Models\Category\Category;
use App\Repository\Category\CategoryRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Intervention\Image\Facades\Image;
use Throwable;

class CategoryController extends Controller
{
    private $categoryRepo;

    public function __construct(CategoryRepository $catRepo)
    {
        $this->categoryRepo = $catRepo;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('admin.settings.category.category_unit');
    }

    public function categoryList(Request $request)
    {
        $cateogry_list = $this->categoryRepo->getCategoryList($request);

        return $cateogry_list;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'name'          => 'required',
            'english_name'  => 'required',
            'icon'          => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'image'         => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'seo_image'     => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'banner'        => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'status'        => 'required',
            'quantity_unit' => 'required|min:1',
        ]);

        try
        {
            DB::beginTransaction();
            $category               = new Category;
            $category->name         = $request->name;
            $category->english_name = $request->english_name;
            $category->status       = $request->status;
            $icon                   = $request->icon;
            $category_image         = $request->image;
            $seo_image              = $request->seo_image;
            $banner                 = $request->banner;
            if ($icon) {
                $iconExt  = explode('/', explode(':', substr($icon, 0, strpos($icon, ';')))[1])[1];
                $iconName = 'icon_' . uniqid() . '.' . $iconExt;
                $iconFile = Image::make($icon)->encode($iconExt, 100);
                Storage::disk(currentFileSystem())->put('category/' . $iconName, $iconFile);
                $category->icon = $iconName;
            }
            if ($category_image) {
                $categoryImageName = 'cat_image_' . uniqid() . '.jpeg';
                $categoryImageFile = Image::make($category_image)->encode('jpeg', 100);
                Storage::disk(currentFileSystem())->put('category/' . $categoryImageName, $categoryImageFile);
                $category->image = $categoryImageName;
            }
            if ($seo_image) {
                $SeoImageName = 'seo_' . uniqid() . '.jpeg';
                $SeoImageFile = Image::make($seo_image)->encode('jpeg', 80);
                Storage::disk(currentFileSystem())->put('category/' . $SeoImageName, $SeoImageFile);
                $category->seo_image = $SeoImageName;
            }
            if ($banner) {
                $bannerImageName = 'banner_' . uniqid() . '.jpeg';
                $bannerFile      = Image::make($banner)->encode('jpeg', 80);
                Storage::disk(currentFileSystem())->put('category/' . $bannerImageName, $bannerFile);
                $category->banner = $bannerImageName;
            }

            $category->save();

            foreach ($request->quantity_unit as $value) {
                $cat_unit                   = new CategoryQuantityUnit;
                $cat_unit->category_id      = $category->id;
                $cat_unit->quantity_unit_id = $value['id'];
                $cat_unit->save();
            }

            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'Category Created']);
        } catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Category\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        $data = Category::where('id', $category->id)->with('quantity_unit:id,name,english_name')->first();
        return new CategoryResource($data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Category\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        return $category;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Category\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $request->validate([
            'name'          => 'required',
            'english_name'  => 'required',
            'new_icon'      => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'new_image'     => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'new_seo_image' => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'new_banner'    => 'nullable|image64:jpeg,png,PNG,gif,jpg,webp,bmp',
            'status'        => 'required',
            'quantity_unit' => 'required|min:1',
        ]);

        try
        {
            DB::beginTransaction();
            // $category               = new Category;
            $category->name         = $request->name;
            $category->english_name = $request->english_name;
            $category->status       = $request->status;
            $icon                   = $request->new_icon;
            $category_image         = $request->new_image;
            $seo_image              = $request->new_seo_image;
            $banner                 = $request->new_banner;
            if ($icon) {
                $icon_url = 'category/' . $category->icon;
                $exist    = Storage::disk(currentFileSystem())->exists($icon_url);
                if ($exist && !empty($category->icon)) {
                    Storage::disk(currentFileSystem())->delete($icon_url);
                }

                $iconExt  = explode('/', explode(':', substr($icon, 0, strpos($icon, ';')))[1])[1];
                $iconName = 'icon_' . uniqid() . '.' . $iconExt;
                $iconFile = Image::make($icon)->resize(128, 128)->encode($iconExt, 100);
                Storage::disk(currentFileSystem())->put('category/' . $iconName, $iconFile);
                $category->icon = $iconName;
            }
            if ($category_image) {
                $image_url = 'category/' . $category->image;
                $exist     = Storage::disk(currentFileSystem())->exists($image_url);
                if ($exist && !empty($category->image)) {

                    Storage::disk(currentFileSystem())->delete($image_url);
                }

                $categoryImageName = 'cat_image_' . uniqid() . '.jpeg';
                $categoryImageFile = Image::make($category_image)->encode('jpeg', 100);
                Storage::disk(currentFileSystem())->put('category/' . $categoryImageName, $categoryImageFile);
                $category->image = $categoryImageName;
            }
            if ($seo_image) {
                $seo_image_url = 'category/' . $category->seo_image;
                $exist         = Storage::disk(currentFileSystem())->exists($seo_image_url);
                if ($exist && !empty($category->seo_image)) {

                    Storage::disk(currentFileSystem())->delete($seo_image_url);
                }

                $SeoImageName = 'seo_' . uniqid() . '.jpeg';
                $SeoImageFile = Image::make($seo_image)->encode('jpeg', 80);
                Storage::disk(currentFileSystem())->put('category/' . $SeoImageName, $SeoImageFile);
                $category->seo_image = $SeoImageName;
            }
            if ($banner) {
                $banner_url = 'category/' . $category->banner;
                $exist      = Storage::disk(currentFileSystem())->exists($banner_url);
                if ($exist && !empty($category->banner)) {

                    Storage::disk(currentFileSystem())->delete($banner_url);
                }
                $bannerImageName = 'banner_' . uniqid() . '.jpeg';
                $bannerFile      = Image::make($banner)->encode('jpeg', 80);
                Storage::disk(currentFileSystem())->put('category/' . $bannerImageName, $bannerFile);
                $category->banner = $bannerImageName;
            }

            $category->update();

            if ($request->quantity_unit) {
                $unitIds = [];
                foreach ($request->quantity_unit as $value) {
                    $unitIds[] = $value['id'];
                }
                $category->quantity_unit()->sync($unitIds);
            }

            DB::commit();
            return response()->json(['status' => 'success', 'message' => 'Category Created'], 200);
        } catch (Throwable $e) {
            DB::rollBack();
            return response()->json(['status' => 'error', 'message' => $e->getMessage()]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Category\Category  $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        $icon_url = 'category/' . $category->icon;
        $exist    = Storage::disk(currentFileSystem())->exists($icon_url);
        if ($exist && !empty($category->icon)) {
            Storage::disk(currentFileSystem())->delete($icon_url);
        }

        $image_url = 'category/' . $category->image;
        $exist     = Storage::disk(currentFileSystem())->exists($image_url);
        if ($exist && !empty($category->image)) {

            Storage::disk(currentFileSystem())->delete($image_url);
        }

        $seo_image_url = 'category/' . $category->seo_image;
        $exist         = Storage::disk(currentFileSystem())->exists($seo_image_url);
        if ($exist && !empty($category->seo_image)) {

            Storage::disk(currentFileSystem())->delete($seo_image_url);
        }

        $banner_url = 'category/' . $category->banner;
        $exist      = Storage::disk(currentFileSystem())->exists($banner_url);
        if ($exist && !empty($category->banner)) {

            Storage::disk(currentFileSystem())->delete($banner_url);
        }

        $category->quantity_unit()->detach();

        if ($category->delete()) {
            return response()->json(['status' => 'success', 'message' => 'Category Deleted Successfully!']);
        } else {
            return response()->json(['status' => 'error', 'message' => 'something went wrong!']);
        }
    }
}
