<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        DB::table('roles')->insert([
            'role_name' => 'Super Admin'
        ]);



        //  menu seeding 
         DB::insert("INSERT INTO `menus` (`id`, `parent_id`, `name`, `icon`, `menu_url`, `president`, `status`, `created_at`, `updated_at`) VALUES
        (1, 0, 'Administration', 'fa fa-sitemap', NULL, 1, 0, NULL, NULL),
        (2, 0, 'Settings', 'fa fa-cogs', NULL, 2, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (3, 2, 'Area Setting', NULL, 'area.index', 2, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (4, 2, 'Category', NULL, 'category.index', 1, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (5, 1, 'Role', NULL, 'role.index', 2, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (6, 1, 'Admin', NULL, 'admin.index', 1, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (7, 0, 'Customer', 'fa fa-users', seller, 3, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        
        (10, 2, 'Payment Setting', 'far fa-money-bill-alt', 'payment-settings', 4, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (11, 0, 'Demand', 'fa fa-book', 'get-demands', 4, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (12, 0, 'Offer', 'fa fa-gift', NULL, 7, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (13, 12, 'Coupon', NULL, 'coupon.index', 1, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (14, 12, 'Send Coupon', NULL, 'send-coupon.index', 2, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (15, 1, 'Subscription Plan', NULL, 'subscription.index', 4, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (16, 2, 'SEO', NULL, 'seo.index', 5, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (17, 2, 'SMS', NULL, 'sms.index', 6, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (18, 0, 'Nilam', 'fa fa-gift', NULL, 8, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (19, 18, 'Pending Nilam', NULL, 'nilam.index', 1, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (20, 18, 'Expired Nilam', NULL, 'expired-nilam', 2, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (21, 18, 'Completed Nilam', NULL, 'complete-nilam', 3, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22'),
        (22, 2, 'Bid Settings', NULL, 'bid-setting.index', 7, 1, '2021-02-10 09:35:22', '2021-02-10 09:35:22')
        ");

        // admin seed 
        DB::table('admins')->insert([
            'name' => 'admin',
            'email' => 'admin@admin.com',
            'avatar' => NULL,
            'role_id' => 1,
            'password' => Hash::make('123456'),
        ]);

        DB::table('seos')->insert([
            'site_name' => 'জিতে যাও',
            'title' => 'খুলে যাক ব্যবসার সকল দুয়ার।',
            'meta_image' => 'meta.png',
            'sitemap_link' => 'sitemap.com',
            'keyword' => 'JiteJao, buying, selling',
            'author' => 'Limmex Automation',
            'description' => 'JiteJao is service site.',
        ]);
        
        // admin menu permission 

        DB::insert("INSERT INTO `permissions` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
        (1, 1, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 2, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 3, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 4, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 5, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 6, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 7, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        
        (1, 10, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 11, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 12, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 13, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 14, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 15, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 16, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 17, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 18, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 19, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 20, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 21, '2021-02-10 00:41:47', '2021-02-10 00:41:47'),
        (1, 22, '2021-02-10 00:41:47', '2021-02-10 00:41:47')
        ");

        DB::table('sms')->insert([
            'provider_name' => 'SMS Service Provider',
            'api_key' => 'SMS Api Key',
            'api_secret' => 'Secret'
        ]);
    }
}
