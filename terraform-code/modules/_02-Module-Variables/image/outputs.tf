output "image_out" {
  value       = docker_image.nodered_image.image_id
  description = "The name and tag of the Docker image pulled for Node-RED."
}