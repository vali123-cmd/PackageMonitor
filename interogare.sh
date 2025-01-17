#!/usr/bin/bash



if [ -z "param" ]; then 
    echo "Nu ati introdus niciun parametru!"
    exit 1
fi
param="$1"
if [ "$param" = "1" ]; then
    for subdir in "../WorkDirectory"/*/; do
   
    subdirectory=$(basename "$subdir")
    if [[ ! $subdirectory =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then

        awk 'END {if ($0 ~ /(^|[[:space:]])installed($|[[:space:]])/) print $subdirectory;}' ../WorkDirectory/$subdirectory/$subdirectory

    fi
    done
fi
if [ "$param" = "2" ]; then
    for subdir in "../WorkDirectory"/*/; do
   
    subdirectory=$(basename "$subdir")
    if [[ ! $subdirectory =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then

        awk 'END {if ($0 ~ /(^|[[:space:]])removed($|[[:space:]])/) print $subdirectory;}' ../WorkDirectory/$subdirectory/$subdirectory

    fi
    done
fi
if [ "$param" = "3" ]; then
    for subdir in "../WorkDirectory"/*/; do
   
    subdirectory=$(basename "$subdir")
    if [[ ! $subdirectory =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then

        awk '{if ($0 ~ /(^|[[:space:]])half-installed($|[[:space:]])/) print $subdirectory;}' ../WorkDirectory/$subdirectory/$subdirectory

    fi
    done
fi

if [ "$param" = "4" ]; then
    parampackage="$2"
    awk '{print}' ../WorkDirectory/$2/$2
    
fi


if [ "$param" = "5" ]; then
    firstdate="$2"
    seconddate="$3"
    for subdir in "../WorkDirectory"/*/; do
   
    subdirectory=$(basename "$subdir")
    if [[  $subdirectory =~ ^[0-9]{4}-[0-9]{2}-[0-9]{2}$ ]]; then

        start_timestamp=$(date -d "$firstdate" +%s)
        end_timestamp=$(date -d "$seconddate" +%s)
        check_timestamp=$(date -d "$subdirectory" +%s)

        if [[ "$check_timestamp" -ge "$start_timestamp" && "$check_timestamp" -le "$end_timestamp" ]]; then
            directory="../WorkDirectory/$subdir"

            find "$directory" -type f
            
        fi
    fi 
    done
fi

        




