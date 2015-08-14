%{
Prints keys and values in a containers.Map object.
Limitation: Only works if keys are strings and values are numbers.
%}
function print_cont(cont)
    keys = cont.keys;
    for index=1:length(keys)
        key = keys{index};
        value = cont(key);
        disp([key '  ' num2str(value)]);
    end
end
