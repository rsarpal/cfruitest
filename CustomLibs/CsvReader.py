#!/Users/admin/anaconda/bin/python3

import csv
import os


def read_csv_file(filename):
    data=[]
    dirname = os.path.dirname  #create object
    from pathlib import Path
    path = Path(dirname(dirname(__file__)))  #Get parent folder path
    print(path)
    fpath = str(path) + filename  #Catenate parent folder + filename

    print(fpath)
    with open(fpath,'r') as file:
        reader=csv.reader(file)

        for row in reader:
            data.append(row)

    return data


#data=read_csv_file("/Data/loginids.csv")
#print(data[0][2])
