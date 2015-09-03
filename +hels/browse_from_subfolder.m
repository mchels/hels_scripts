%{
Prompts the user to choose a subfolder located in path and loads the selected
folder. If there is only one subfolder in path then that subfolder is loaded
automatically.
Input
-----
    - path: Folder in which to search for subfolders. Defaults to current
            working directory.

Output
------
    - browser: Folderbrowser object containing a list of data folders found
               in subfolder.
%}
function browser = browse_from_subfolder(path)
    if (~exist('path', 'var'))
        path = '.';
    end
    format compact
    dashed_line = '----------------------------------------------------------';
    subfolder_names = hels.get_subfolder_names(path);
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
    full_path = fullfile(path, sel_folder_name);
    disp('Loading');
    disp(full_path);
    num_of_views = input('How many views do you want?\n');
    browser = qd.gui.FolderBrowser(full_path);
    browser.num_of_views = num_of_views;
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
