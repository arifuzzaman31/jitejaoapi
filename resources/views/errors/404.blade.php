@include('include.header-assets')
<style type="text/css">
    body { background-image: url('http://bidoapi.limmexbd.com/public/images/seo/meta.png'); background-repeat:no-repeat; background-size:cover;}
.error-template {padding: 40px 15px;text-align: center;}
.error-actions {margin-top:15px;margin-bottom:15px;}
.error-actions .btn { margin-right:10px; }
h1,h2,.error-details{ color: #ffffff; }
</style>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="error-template">
                <h1>
                    Oops!</h1>
                <h2>
                    404 Not Found</h2>
                <div class="error-details">
                    Sorry, an error has occured, Requested page not found!
                </div>
                <div class="error-actions">
                    <a href="{{ url('/admin/login') }}" class="btn btn-primary btn-lg"><i class="fa fa-home"></i>
                        Login </a>
                </div>
            </div>
        </div>
    </div>
</div>
@include('include.footer-assets')