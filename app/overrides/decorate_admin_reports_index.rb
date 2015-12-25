Deface::Override.new(
  :virtual_path => "spree/admin/reports/index",
  :name => "add_subscriptions_reports_index",
  :insert_after => "table.index tbody",
  :text => %q{<tr data-hook='reports_row'>
      <td><%= link_to Spree.t(:subscriptions), admin_subscriptions_url %></td>
      <td>View Recurring Subscriptions</td>
    </tr>
    <tr data-hook='reports_row'>
      <td><%= link_to Spree.t(:subscription_events), admin_subscription_events_url %></td>
      <td>View Recurring Subscription Events</td>
    </tr>},
  :disabled => false)
