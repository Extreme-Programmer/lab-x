import os
path = "."
files=os.listdir(path)
for file in files:
    file_name,file_extension = os.path.splitext(file)
    ext = os.path.splitext(file)[1][1:]
    if ((len(file_extension)<=0) or (file=="short.py")):
        pass
    else:
        # print(file_name + "\t" + file_extension + "|" + ext)
        if not os.path.exists(ext):
            os.mkdir(ext)
        source=file
        destin="./"+ext+"/"+file
        os.replace(source, destin)

