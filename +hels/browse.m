% Morten Hels
% Initiates the browser.
function browser = browse(window_title)
    format compact
    if (exist('window_title', 'var'))
        hels.window_title(window_title);
    end
    dashed_line = '----------------------------------------------------------';
    subfolder_names = hels.get_subfolder_names();
    n_folders = size(subfolder_names, 2);
    if n_folders>1
        temp_cell = cell(1, n_folders);
        for i=1:n_folders
            addition = strcat(num2str(i), {': '}, subfolder_names(i), '\n');
            temp_cell{i} = addition{:};
        end
        prompt_string = strjoin(temp_cell, '');
        disp(dashed_line);
        disp('Showing subfolders in directory');
        disp(pwd);
        disp('Input the number corresponding to the folder you want to load...');
        sel_folder_n = input(prompt_string);
    elseif n_folders==1
        disp(dashed_line);
        disp('There is only one subfolder in data folder.');
        disp('Loading it now:');
        sel_folder_n = 1;
    end
    sel_folder_name = subfolder_names{sel_folder_n};
    full_path = fullfile(pwd, sel_folder_name);
    disp('Loading');
    disp(full_path);
    browser = qd.gui.FolderBrowser(full_path);
    try
        exp.update_browser(browser);
    catch ME
        warn_string = ['File exp.update_browser not found.\n' ...
                       'Continuing execution without it...'];
        warning(sprintf(warn_string));
    end
    browser.set_editor('C:\Program Files (x86)\Notepad++\notepad++.exe');
    set(0, 'DefaultFigureWindowStyle', 'docked');
end