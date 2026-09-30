terraform {
  required_providers {
    docker = {
        source = "kreuzwerker/docker"
        version = "~> 4.6.0"
    }
  }
}


provider "docker" {
    # Automatically finds your installed Docker daemon 
}

# resource reservedName customName {
#   resource properties go in here 
# }
resource "docker_image" "alex_docker_app" {
    name = "alex_docker_app_testo:latest"
    keep_locally = true

    # build data 
    build {
        context = "."
        dockerfile = "Dockerfile"

        # should map to Dockerfile "ARG" properties 
        build_args = {
          PORT = "3000"
          RANDOM_VARIABLE_STUFF = "bananas"
        }
    }
}