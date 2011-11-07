module Smitty

  class Terminal
    def set_current_window_to_theme(theme_name)
      script = %[
          tell application "Terminal"
            set current settings of front window to first settings set whose name is "#{theme_name}"
          end tell
        ]
      run_apple_script script
    end

    def number_of_open_tabs
      script = %[
          set c to 0
          tell application "Terminal"
            repeat with w from 1 to count windows
              repeat with t from 1 to count tabs of window w
                set c to c + 1
              end repeat
            end repeat
          end tell
          get c
        ]
      Integer(run_apple_script script)
    end

    def install_theme!(theme_path)
      # THERE'S GOTTA BE A BETTER WAY....

      `open #{theme_path}`
      sleep 0.5
      run_apple_script 'tell application "Terminal" to close the first window'
    end

    def set_default_theme!(theme_name)
      run_apple_script %[tell application "Terminal" to set default settings to first settings set whose name is "#{theme_name}"]
    end

    def run_apple_script(script)
      %x[osascript -e '#{script}']
    end
  end

end