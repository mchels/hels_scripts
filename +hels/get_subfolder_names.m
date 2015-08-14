function folder_names = get_subfolder_names(path)
    if (~exist('path', 'var'))
        path = '.';
    end
    full_listing = dir(path);
    directories = [full_listing.isdir];
    folder_names = {full_listing(directories).name};
    folder_names(ismember(folder_names, {'.', '..'})) = [];
end
