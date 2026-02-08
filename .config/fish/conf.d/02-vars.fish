# API tokens
set -gx B2_APPLICATION_KEY_ID $(cat "$HOME/.config/b2/api_key" | sed '1!d')
set -gx B2_APPLICATION_KEY $(cat "$HOME/.config/b2/api_key" | sed '2!d')
set -gx CLOUDFLARE_API_TOKEN $(cat "$HOME/.config/cloudflare/api_token")

# Make flags
set -gx MAKEFLAGS "-j$(nproc)"
