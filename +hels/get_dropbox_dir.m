function dropbox_dir = get_dropbox_dir()
    appdata_dir = hels.get_appdata_dir;
    path = fullfile(appdata_dir, 'Dropbox', 'host.db');
    fileID = fopen(path);
    fileContents = textscan(fileID, '%s', 'delimiter', '\n');
    fclose(fileID);
    dropbox_dir_64 = fileContents{1}{2};
    dropbox_dir_native = hels.base64decode(dropbox_dir_64);
    dropbox_dir = native2unicode(dropbox_dir_native);
end
