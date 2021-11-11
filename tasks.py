from invoke import task

CONTAINER_NAME = 'rstudio_datscience_verse'
IMAGE_NAME = f"tuteco/{CONTAINER_NAME}"
CONTAINER_INSTANCE = 'default'

@task
def build_local(context):
    """
        build an image from a Dockerfile with tag 'latest-dev'
    """
    context.run(f"docker build -t {IMAGE_NAME}:latest-dev . -f Dockerfile")

@task
def run(context):
    """
        run the local image with tag 'latest-dev'
    """
    context.run(f"docker run --rm --name {CONTAINER_NAME}-{CONTAINER_INSTANCE} -e PASSWORD=tutecor -p 8787:8787 {IMAGE_NAME}:latest-dev")

@task(help={
    "images": "remove images used by service"
})
def docker_clean(context, images=False):
    """
        remove containers, networks, volumes and images(optional)
    """
    context.run("docker compose down -v")

    if images:
        # delete project image
        context.run(f"docker rmi {IMAGE_NAME}:latest-dev -f")
        # delete AWS image if not in use
        context.run(f"docker rmi amazon/amazon-ecs-local-container-endpoints")
        # remove dangling images
        context.run(f"docker image prune -f")
