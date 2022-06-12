# Create a desktop entry for a Firefox profile.
# Usage: create-firefox-profile [profile name]

PROFILE=$1
echo Creating profile: $PROFILE
TARGET=~/.local/share/applications/firefox-${PROFILE}.desktop
cp /usr/share/applications/firefox.desktop $TARGET
sed -i "s/Name=Firefox/Name=Firefox $PROFILE/" $TARGET
sed -i "s/Exec=firefox %u/Exec=firefox -P $PROFILE %u/" $TARGET
