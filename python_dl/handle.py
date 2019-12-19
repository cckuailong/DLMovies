import json

with open("C:/Users/lovebear96/Desktop/movies.csv", "r", encoding="utf8") as f:
    lines = f.readlines()
with open("C:/Users/lovebear96/Desktop/mv_info.csv","w",encoding="utf8") as f:
    for line in lines:
        if line.strip():
            item = json.loads(line.split("\t")[1].strip())
            f.write("%s\t%s\t%s\t%s\t%s\n" % (item["title"],item["actors"],item["region"],item["desc"],str(item["urls"]).replace("'", "\"")))