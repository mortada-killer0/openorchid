#!/system/bin/sh

# NOTE: Downloading them directly to $dest_dir is a bad idea.
# It could fail and keep a partially downloaded update and the OS will
# break when trying to install that same update in the background.

src_dir=/data/system/cache/swu
dest_dir=/data/ota
update_files=$(ls -1 "$src_dir"/*.zip 2>/dev/null)
update_boot_files=$(ls -1 "${src_dir}_boot"/*.zip 2>/dev/null)
update_vendor_files=$(ls -1 "${src_dir}_vendor"/*.zip 2>/dev/null)
update_product_files=$(ls -1 "${src_dir}_product"/*.zip 2>/dev/null)

# Verify and move downloaded main updates
for update_file in $update_files; do
  if unzip -t "$update_file" >/dev/null 2>&1; then
    # Move the update file to the destination directory
    mv -f "$update_file" "$dest_dir"
    echo "Successfully moved $update_file to $dest_dir"
  else
    # Delete the corrupted update file
    rm -f "$update_file"
    echo "Deleted corrupted update file: $update_file"
  fi
done

# Verify and move downloaded boot updates
for update_file in $update_boot_files; do
  if unzip -t "$update_file" >/dev/null 2>&1; then
    # Move the update file to the destination directory
    mv -f "$update_file" "$dest_dir"
    echo "Successfully moved $update_file to $dest_dir"
  else
    # Delete the corrupted update file
    rm -f "$update_file"
    echo "Deleted corrupted update file: $update_file"
  fi
done

# Verify and move downloaded vendor updates
for update_file in $update_vendor_files; do
  if unzip -t "$update_file" >/dev/null 2>&1; then
    # Move the update file to the destination directory
    mv -f "$update_file" "$dest_dir"
    echo "Successfully moved $update_file to $dest_dir"
  else
    # Delete the corrupted update file
    rm -f "$update_file"
    echo "Deleted corrupted update file: $update_file"
  fi
done

# Verify and move downloaded product updates
for update_file in $update_product_files; do
  if unzip -t "$update_file" >/dev/null 2>&1; then
    # Move the update file to the destination directory
    mv -f "$update_file" "$dest_dir"
    echo "Successfully moved $update_file to $dest_dir"
  else
    # Delete the corrupted update file
    rm -f "$update_file"
    echo "Deleted corrupted update file: $update_file"
  fi
done
