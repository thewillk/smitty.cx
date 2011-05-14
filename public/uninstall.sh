echo "The party is over: you're uninstalling Smitty..."

SMITTY_ROOT="$HOME/.smitty"

if [ ! -d "$SMITTY_ROOT" ]
then
    echo "Smitty does not appear to be installed." >&2
    echo "Do you really hate us so much that you wanna preemptively uninstall Smitty?" >&2
    exit 1
fi

if [ '$(grep "$SMITTY_ROOT/rotate.rb" "$HOME/.profile")' == '' ]
then
    echo "It looks like you moved the call to $SMITTY_ROOT/rotate.rb"
    echo "Please remove it manually..."
else
    sed -e :begin -e "$!N;s%$SMITTY_ROOT/rotate.rb%%" "$HOME/.profile" > "$SMITTY_ROOT/temp.profile"
    cp "$SMITTY_ROOT/temp.profile" "$HOME/.profile"
    echo "Removed rotation script for your .profile."
fi

ruby "$SMITTY_ROOT/set_default_theme.rb" "Homebrew"

rm -Rf "$SMITTY_ROOT"

echo "Uninstallation sucessful."

echo "Remember, you can always reinstall Smitty with: curl get.smitty.cx | sh"
echo "For more information, go to http://smitty.cx/"

echo "We're sorry to see you go  :("
