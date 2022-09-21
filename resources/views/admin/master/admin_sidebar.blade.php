<div class="sidebar-wrapper sidebar-theme">
            <nav id="sidebar">
                <ul class="list-unstyled menu-categories" id="accordionExample">
                    <li class="menu">
                        <a href="{{ url('/admin') }}" aria-expanded="false"
                        data-active="@if(request()->is('/admin')){{ 'true' }}@else{{ 'false' }}@endif" class="dropdown-toggle">
                            <div class="menu_heading">
                               <i class="fa fa-home"></i>
                                <span>Dashboard</span>
                            </div>
                        </a>
                    </li>
                     @php
                    $side_menu = sideMenu(Auth::guard('admin')->user()->role_id)
                    @endphp
                    @foreach($side_menu as $value)
                    @if(count($value['sub_menu'])>0)
                    <li class="menu">
                        <a href="#{{ str_replace('&','',str_replace(' ','',$value['name'])) }}" data-toggle="collapse"
                         aria-expanded="false"  class="dropdown-toggle">
                            <div class="menu_headling">
                                <i class="{{ $value['icon'] }}"></i>
                                <span>{{ $value['name'] }}</span>
                            </div>
                            <div>
                                <svg xmlns="http://www.w3.org/2000/svg"
                                width="24" height="24" viewBox="0 0 24 24"
                                 fill="none" stroke="currentColor"
                                 stroke-width="2" stroke-linecap="round"
                                  stroke-linejoin="round" class="feather feather-chevron-right">
                                  <polyline points="9 18 15 12 9 6"></polyline>
                                  </svg>
                            </div>
                        </a>
                        <ul class="collapse submenu list-unstyled"
                         id="{{ str_replace('&','',str_replace(' ','',$value['name'])) }}" data-parent="#accordionExample">
                         @foreach($value['sub_menu'] as $sub)
                            <li @if(Route::currentRouteName() == $sub->menu_url) class="active" @endif>
                                <a href="{{ $sub->menu_url ? route($sub->menu_url) : '' }}" >{{ $sub->name }}</a>
                            </li>
                         @endforeach
                        </ul>
                    </li>




                <!-- adminstration  -->
                    @else
                    <!-- Vendor menu  -->
                    <li class="menu @if(Route::currentRouteName() == $value['url']) active active_url @endif">
                        <a href="{{ $value['url'] ? route($value['url']) : '' }}"
                        data-active="@if(Route::currentRouteName() == $value['url']){{ 'true' }}@else{{ 'false' }}@endif"
                        class="dropdown-toggle">
                            <div class="menu_heading">
                            <i class="{{ $value['icon'] }}"></i>
                              <span>{{ $value['name'] }}</span>
                            </div>
                        </a>
                    </li>
                    @endif
                    @endforeach


                </ul>

            </nav>

        </div>
