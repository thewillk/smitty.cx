#!/bin/sh
#
#   Smitty changes your Terminal.app themes
#
#   http://smitty.cx/
#
#   To install:   curl get.smitty.cx | sh
#   To uninstall: curl unget.smitty.cx | sh
#

SMITTY_ROOT="$HOME/.smitty"
THEMES_ROOT="$SMITTY_ROOT/themes"

# Check if Smitty is already installed
# Check that OS is macos, version doens't matter
sw_vers -productName
if [ "$(sw_vers -productName)" != "Mac OS X" ]
    echo "Where am I? What am I doing here?" >&2
    echo "Try again on a Mac OS machine..." >&2
    exit exit 1
fi

# Check if apple script
if [ "$(which osascript)" == "" ]
    echo "Apple scripting?!" >&2
    echo "Yeah, Smitty needs it." >&2
    exit exit 1
fi

# Check if action script and ruby exist
if [ "$(which ruby)" == "" ]
    echo "Really, you uninstalled ruby?" >&2
    echo "That was a bad move, my friend." >&2
    exit exit 1
fi

echo "Grab a beverage while Smitty installs..."

mkdir "SMITTY_ROOT"
mkdir "THEMES_ROOT"

echo "Fetching helper scripts..."

curl -s smitty.cx/rotate.rb > "$SMITTY_ROOT/rotate.rb"
chmod +x "$SMITTY_ROOT/rotate.rb"
curl -s smitty.cx/install_theme.rb > "$SMITTY_ROOT/install_theme.rb"
chmod +x "$SMITTY_ROOT/install_theme.rb"
curl -s smitty.cx/set_default_theme.rb > "$SMITTY_ROOT/set_default_theme.rb"
chmod +x "$SMITTY_ROOT/set_default_theme.rb"

echo "Fetching fabulous themes..."

curl -s smitty.cx/themes/smitty-blue.terminal   > "$THEMES_ROOT/smitty-blue.terminal"
curl -s smitty.cx/themes/smitty-red.terminal    > "$THEMES_ROOT/smitty-red.terminal"
curl -s smitty.cx/themes/smitty-green.terminal  > "$THEMES_ROOT/smitty-green.terminal"
curl -s smitty.cx/themes/smitty-white.terminal  > "$THEMES_ROOT/smitty-white.terminal"
curl -s smitty.cx/themes/smitty-aqua.terminal   > "$THEMES_ROOT/smitty-aqua.terminal"
curl -s smitty.cx/themes/smitty-orange.terminal > "$THEMES_ROOT/smitty-orange.terminal"
curl -s smitty.cx/themes/smitty-yellow.terminal > "$THEMES_ROOT/smitty-yellow.terminal"
curl -s smitty.cx/themes/smitty-blank.terminal  > "$THEMES_ROOT/smitty-blank.terminal"
curl -s smitty.cx/themes/smitty-purple.terminal > "$THEMES_ROOT/smitty-purple.terminal"

echo "Installing fabulous themes..."

ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-blue.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-red.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-green.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-white.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-aqua.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-orange.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-yellow.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-blank.terminal"
ruby "$SMITTY_ROOT/install_theme.rb" "$THEMES_ROOT/smitty-purple.terminal"

ruby "$SMITTY_ROOT/set_default_theme.rb" "smitty-blank"

echo "Configuring smitty..."

# Set blank as default theme
cp "$HOME/.profile" "$SMITTY_ROOT/original.profile"

# Append smitty rotation script to .profile
echo "$SMITTY_ROOT/rotate.rb" >> "$HOME/.profile"

echo "Installation complete."

echo "Remember, you can always uninstall Smitty with: curl unget.smitty.cx | sh"
echo "For more information, go to http://smitty.cx/"
