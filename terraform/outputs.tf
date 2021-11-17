output "instances_details" {
description = "List of all details for compute instances"
value = google_compute_instance.vm-instance-for-jenkins.*
}

output "instances_detailtf" {
description = "List of all details for compute instances"
value = google_compute_instance.vm-instance-for-slave.*
}
