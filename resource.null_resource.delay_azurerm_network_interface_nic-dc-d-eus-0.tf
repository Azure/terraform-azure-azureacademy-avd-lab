resource "null_resource" "delay_azurerm_network_interface_nic-dc-d-eus-0" {
  provisioner "local-exec" {
    command = "sleep 30"
  }

  triggers = {
    "before" = "${azurerm_network_interface.nic-dc-d-eus-0.id}"
  }
}
