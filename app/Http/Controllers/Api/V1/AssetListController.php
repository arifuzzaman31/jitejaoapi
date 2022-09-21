<?php

namespace App\Http\Controllers\Api\V1;

use App\Helpers\AllStatic;
use App\Http\Controllers\Controller;
use App\Http\Resources\CategoryDemandResource;
use App\Http\Resources\CategoryNilamResource;
use App\Http\Resources\CategoryResource;
use App\Http\Resources\DemandResource;
use App\Http\Resources\NilamResource;
use App\Models\Bid\Bid;
use App\Models\Category\Category;
use App\Models\Demand\Demand;
use App\Models\FAQ;
use App\Models\Nilam;
use App\Models\SubscriptionPlan;
use App\Models\User;
use App\Repository\Area\AreaRepository;
use App\Repository\Category\CategoryRepository;
use App\Repository\Demand\DemandRepository;
use App\Repository\Nilam\NilamRepository;
use Illuminate\Http\Request;

class AssetListController extends Controller
{
    //
    private $category_repo;
    private $demandRepo;
    private $nilamRepo;

    public function __construct(CategoryRepository $CatRepo, DemandRepository $demandRepo, NilamRepository $nilamRepo)
    {
        $this->category_repo = $CatRepo;
        $this->demandRepo    = $demandRepo;
        $this->nilamRepo     = $nilamRepo;

    }

    public function getCategoryList(Request $request)
    {

        $category_list = $this->category_repo->getCategoryList($request);

        return CategoryResource::collection($category_list);
    }

    public function getCategoryUnit($id)
    {
        $category_unit = $this->category_repo->getCategorWithUnit($id);
        if ($category_unit) {
            return $category_unit->quantity_unit;
        }
        return [];
    }

    public function getAreaList(Request $request)
    {

        $area_repo = new AreaRepository;
        $area_list = $area_repo->getAreaList($request);

        return $area_list;
    }

    // demand by category

    public function getCategoryDemand(Request $request)
    {
        $categoryWiseDemand = Category::withCount('demands as demand_count')
            ->with([
                'demands.user:id,name,avatar,buyer_badge',
                'demands.quantity_unit',
            ])
            ->having('demand_count', '>', 0)
            ->orderBy('demand_count', 'desc')
            ->paginate(2);

        return CategoryDemandResource::collection($categoryWiseDemand);

    }

    public function getDemand(Request $request)
    {
        $demands = Demand::with(['user:id,name,avatar,buyer_badge',
                            'quantity_unit'])
            ->where('expire_date', '>=', date('Y-m-d'))
            ->orderBy('bid_status','asc')
            ->orderBy('created_at', 'desc')
            ->take(8)
            ->get();

        return DemandResource::collection($demands);

    }

    // nilam by category

    public function getLatestNilam(Request $request)
    {
        $nilam = Nilam::with(
                'user:id,name,avatar,buyer_badge,seller_badge',
                'quantity_unit',
                'win_bid')
            ->where('expire_date', '>=', date('Y-m-d H:i:s'))
            ->orderBy('created_at', 'desc')
            ->take(8)
            ->get();

        return NilamResource::collection($nilam);

    }

    public function getCategoryNilam(Request $request)
    {
        $categoryWiseNilam = Category::withCount('nilams as nilam_count')
            ->with([
                'nilams.user:id,name,avatar,buyer_badge,seller_badge',
                'nilams.quantity_unit',
                'nilams.win_bid',
            ])
            ->having('nilam_count', '>', 0)
            ->orderBy('nilam_count', 'desc')
            ->paginate(2);

        return CategoryNilamResource::collection($categoryWiseNilam);

    }

    // all demand

    public function demandList(Request $request)
    {

        $demands = $this->demandRepo->getDemand($request);
        return DemandResource::collection($demands);
    }

    public function nilamList(Request $request)
    {

        $nilams = $this->nilamRepo->getNilam($request);
        return NilamResource::collection($nilams);
    }

    public function categoryShow($id)
    {
        try {
            $category = Category::find($id);
            if ($category) {
                return new CategoryResource($category);
            }
            return response()->json(['status' => 'error', 'message' => 'category not found!'], 400);

        } catch (\Throwable $e) {
            return response()->json(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    // total counter

    public function counter()
    {
        // sleep(10);
        $total_buyer  = 0;
        $total_seller = 0;
        $total_demand = 0;
        $total_bid    = 0;

        $buyer_count = User::count();
        $total_buyer += $buyer_count;

        $seller_count = User::where('is_seller', '=', AllStatic::$seller)->count();
        $total_seller += $seller_count;

        $demand_count = Demand::count();
        $total_demand += $demand_count;

        $bid_count = Bid::count();
        $total_bid += $bid_count;

        return response()->json([
            'total_buyer'  => $total_buyer,
            'total_seller' => $total_seller,
            'total_demand' => $total_demand,
            'total_bid'    => $total_bid,
        ]);

    }

    // get subscription plan

    public function getPlan()
    {
        $plan = SubscriptionPlan::where('status', '=', AllStatic::$active)
            ->orderBy('total_month', 'asc')
            ->get();
        return $plan;
    }

    public function getMinimumPlan()
    {
        $plan = SubscriptionPlan::where('status', '=', AllStatic::$active)
            ->orderBy('total_month', 'asc')
            ->first();
        return $plan;
    }

    public function getFAQ()
    {
        $faq = FAQ::where('status', '=', AllStatic::$active)->get();
        return $faq;

    }
}
