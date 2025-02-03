# Install Neovim from nightly release by downloading the precompiled binaries.

backup=true
dowloaded_file=/tmp/nvim-linux64.tar.gz
backup_dir=/tmp/nvim-backup

while (( "$#" )); do
  case "$1" in
    --no-backup)
      backup=false
      shift
      ;;
    *)
      echo "Invalid argument: $1"
      exit 1
      ;;
  esac
done

wget -O $dowloaded_file \
  https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz

# Was the last command ok?
if [ $? -ne 0 ]; then
  echo "Error downloading Neovim"
  exit 1
fi

echo Neovim downloaded

if [ $backup = true ]; then
  echo Backing up old Neovim
  mkdir --parents $backup_dir
  cp /usr/bin/nvim $backup_dir/bin
  cp -r /usr/lib/nvim $backup_dir/lib
  cp -r /usr/share/nvim $backup_dir/share
fi

echo Installing Neovim
# --strip-components=1 removes the first directory from the tarball (nvim-linux64).
sudo tar -xzvf $dowloaded_file -C /usr/ --strip-components=1
echo Neovim installed!
nvim --version
