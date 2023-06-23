#!/bin/sh

default_source_dir="../config/game"
default_target_dir="../current/game/config"

source_dir="${1:-$default_source_dir}"
target_dir="${2:-$default_target_dir}"

echo "> Applying configuration overrides..."
echo ""

trim_ws() {
  input="$1"
  trimmed=$(echo "$input" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
  echo "$trimmed"
}

for source_config in "$source_dir"/*; do

  source_file=$(basename "$source_config")
  target_config="$target_dir/$source_file"

  echo "$source_file"
  echo "---------------------------------"

  if [ -f "$target_config" ]; then
    changes=0
    while IFS='=' read -r field value; do
      if echo "$field" | grep -E "^\s*#" >/dev/null || [ -z "$field" ]; then
        continue
      fi

      field=$(trim_ws "$field")
      value=$(trim_ws "$value")

      found=$(grep -E "^[^#]*$field\s*=" "$target_config")
      if [ -z "$found" ]; then
        echo "$field missing on target config"
        continue
      fi

      sed -i "s/${field}\s*=\s*.*/${field} = ${value}/" "$target_config"

      changes=$((changes + 1))
      echo "$field >> $value"
    done < "$source_config"

    if [ "$changes" -eq 0 ]; then
      echo "No changes found on $source_config."
    else
      echo "Modified $target_config."
    fi
  else
    echo "Target config file $target_config not found."
  fi
  echo ""
done

echo "> END"
