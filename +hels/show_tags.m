function show_tags()
    script_dir = fileparts(mfilename('fullpath'));
    tags_json_path = fullfile(script_dir, 'tags_dict.json');
    tags_struct = json.read(tags_json_path);
    fields = sort(fieldnames(tags_struct));
    num_tags = numel(fields);
    num_cols = 3;
    str_cell = cell(num_tags+1, num_cols);
    str_cell(1,:) = {'TAG', 'USE', 'RELATED'};
    for i=1:num_tags
        key = fields{i};
        val = tags_struct.(key);
        str_cell{i+1,1} = key;
        str_cell{i+1,2} = val.use;
        str_cell{i+1,3} = strjoin(val.related, ', ');
    end
    lengths = cellfun(@length, str_cell);
    max_lengths = max(lengths);
    formats = '';
    for i=1:num_cols
        col_width_str = num2str(max_lengths(i));
        formats = sprintf('%s', formats, '%-', col_width_str, 's |');
    end
    formats = strcat(formats, '\n');
    str_cell = str_cell.';
    disp_str = sprintf(formats, str_cell{:});
    disp(disp_str)
end
