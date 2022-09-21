<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Payment Report</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   
  </head>
  <body>
    <nav class="navbar-light bg-light text-center">
	  <h3>Payment Report</h3>
	</nav>
    <main>
      <table class="table table-striped">
        <thead>
          <tr>
            <th>PaymentID</th>
            <th>Name</th>
            <th>UserID</th>
            <th>Amount/m</th>
            <th>Month</th>
            <th>Amount</th>
            <th>Discount</th>
            <th>Final Amount</th>
            <th>Mode</th>
            <th>Tran.Date</th>
          </tr>
        </thead>
        <tbody>
        @php
              $total_month = 0;
              $total_amount = 0;
              $total_discount = 0;
              $final_amount = 0;
          @endphp
        @foreach($payments as $value)
          <tr>
            <td>{{ $value->id }}</td>
            <td>{{ $value->user->name }}</td>
            <td>{{ $value->user_id }}</td>
            <td>{{ $value->amount_per_month }}</td>
            <td>{{ $value->total_month }}</td>
            <td>{{ $value->total_amount }}</td>
            <td>{{ $value->total_discount }}</td>
            <td>{{ $value->final_amount }}</td>
            <td>{{ $value->payment_mode == 1 ? 'Online' : 'Offline' }}</td>
            <td>{{ $value->date }}</td>
          </tr>
          @php
          	  $total_month += $value->total_month;
              $total_amount += $value->total_amount;
              $total_discount += $value->total_discount;
              $final_amount += $value->final_amount;
          @endphp
        @endforeach
        <tr style="font-style: bold; border-top: 1px solid #000;">
            <!-- <td></td> -->
            <td colspan="4"><strong>Total :</strong></td>
            <td><strong>{{ $total_month }}</strong></td>
            <td><strong>{{ $total_amount }}</strong></td>
            <td><strong>{{ $total_discount }}</strong></td>
            <td><strong>{{ $final_amount }}</strong></td>
            <td colspan="3"></td>
          </tr>
        </tbody>
      </table>
    </main>
  </body>
  <script>
    window.print();
  </script>
</html>