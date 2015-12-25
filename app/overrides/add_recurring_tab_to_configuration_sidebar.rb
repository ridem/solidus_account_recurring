Deface::Override.new(
  virtual_path: "spree/admin/shared/_configuration_menu",
  name: "add_recurring_tab_to_configuration_sidebar",
  insert_bottom: "[data-hook='admin_configurations_sidebar_menu']",
  disabled: false,
  partial: "spree/shared/recurrings_sidebar_entry"
)
