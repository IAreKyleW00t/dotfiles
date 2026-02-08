# API tokens
set -gx B2_APPLICATION_KEY_ID $(cat "$HOME/.config/b2/api_key" | sed '1!d')
set -gx B2_APPLICATION_KEY $(cat "$HOME/.config/b2/api_key" | sed '2!d')
set -gx CLOUDFLARE_API_TOKEN $(cat "$HOME/.config/cloudflare/api_token")

# Firefox hardware acceleration fix for NVIDIA
# NOTE: must also be set on .desktop files
set -gx MOZ_DISABLE_RDD_SANDBOX 1
set -gx LIBVA_DRIVER_NAME nvidia
set -gx CUDA_DISABLE_PERF_BOOST 1

# Podman
set -gx DOCKER_HOST "unix://$XDG_RUNTIME_DIR/podman/podman.sock"
