function value = getFromInput(parameter)

input = fopen ('inputs.txt','r') ;
value = 0;

tline = fgetl(input);
[token,remain] = strtok(tline);

if(strcmp(token,parameter))
    value = remain;
else
    while(ischar(tline))
        tline = fgetl(input);
        [token,remain] = strtok(tline);
        if(strcmp(token,parameter))
            value = remain;
            break;
        end
    end
end
fclose(input);