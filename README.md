# Oracle-Database-on-Windows-Container
Tested on ltsc2019 and ltsc2022 Windows Server Core images.

Download Oracle installation files and place it into build root folder:
https://www.oracle.com/database/technologies/oracle19c-windows-downloads.html

Download Visual C++ run-time package and also place it into build root folder:
https://www.microsoft.com/en-ie/download/details.aspx?id=40784

# Build image:
docker build -t oracle:ora193 . 

# Run docker image

#interactive mode:
docker run -it --rm -m 8G -p 1521:1521 oracle:ora193

#detached mode
docker run -d -i --rm -m 8G -p 1521:1521 oracle:ora193

# Connect to DB:
sqlplus sys/password@localhost:1521/ora193
