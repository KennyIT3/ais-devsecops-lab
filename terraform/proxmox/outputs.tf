output "gitlab_runner_vm_id" {
  value = proxmox_virtual_environment_vm.gitlab_runner01.vm_id
}

output "gitlab_runner_name" {
  value = proxmox_virtual_environment_vm.gitlab_runner01.name
}
