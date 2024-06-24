#!/bin/bash

# shellcheck source=common/common.sh
source "$(dirname "$0")/common/common.sh"

export SYSTEM="container-registry"
export ENTRYPOINT="khulnasoft/container-registry"

export_container_registry() {
  local REF_NAME=$1

  if [ -z "${REF_NAME}" ]; then
    REF_NAME=$(get_latest_version_from "$ENTRYPOINT")
  fi

  export_sbom "$ENTRYPOINT" "${REF_NAME:-}"

  create_sbom_wrapper "$REF_NAME"
}

export_container_registry "${REF_NAME:-}"

echo "Done"
