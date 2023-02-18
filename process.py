
"a2ec1d8|Oguz Vuruskaner|ovuruska@outlook.com|Tue Dec 20 05:05:14 2022 +0300|Checkboxes are added."
from datetime import datetime,timedelta
from math import ceil

if __name__ == "__main__":
    dates = []
    with open("commits_mobile.txt", "r") as f:
        for line in f:

            line = line.strip()
            date = line.split("|")[3]
            date = datetime.strptime(date, "%a %b %d %H:%M:%S %Y %z")
            commit = line.split("|")[4]
            date_obj = {
                "date": date,
                "commit": commit,
            }
            dates.append(date_obj)

    pad = 4

    with open("deliverables_mobile.csv", "w") as f:
        total = 0
        f.write("Commit,Workhours\n")

        prev_time = None
        for date_obj in reversed(dates):
            if prev_time is not None:
                delta = date_obj["date"] - prev_time
                if delta < timedelta(hours=pad):

                    work_hour = ceil(delta.seconds / 60 / 60)
                else:
                    work_hour = pad
            else:
                work_hour = pad
            prev_time = date_obj["date"]
            total += work_hour
            f.write(f"{date_obj['commit']},{work_hour}\n")

        f.write(f"Total,{total}\n")
