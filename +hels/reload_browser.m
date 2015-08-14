% Morten Hels
% Reloads the browser.
function browser = reload_browser(brw)
    format compact
    full_path = brw.get_location();
    disp('-----------------------------------------------------------');
    disp('Reloading');
    disp(full_path);
    browser = qd.gui.FolderBrowser(full_path);
    exp.update_browser(browser);
    browser.set_editor('C:\Program Files (x86)\Notepad++\notepad++.exe');
end
