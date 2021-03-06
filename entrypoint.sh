#!/bin/sh -l

echo 'y' | cf add-plugin-repo CF-Community https://plugins.cloudfoundry.org y
echo 'y' | cf install-plugin multiapps

cf api "$INPUT_CF_API"
cf auth "$INPUT_CF_USERNAME" "$INPUT_CF_PASSWORD"

if [ -n "$INPUT_CF_ORG" ] && [ -n "$INPUT_CF_SPACE" ]; then
  cf target -o "$INPUT_CF_ORG" -s "$INPUT_CF_SPACE"
fi

sh -c "cf $*"
