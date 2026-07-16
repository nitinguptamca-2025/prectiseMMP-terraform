#Output the IP Address of the Container
output "container-name" {
  value       = docker_container.nodered_container.name
  description = "The name of the container"
}

output "ip-address" {
  value = [
    for i in docker_container.nodered_container :
    "${i.network_data[0].ip_address}:${i.ports[0].external}"
  ]
  description = "The IP address and external port of the container"
}