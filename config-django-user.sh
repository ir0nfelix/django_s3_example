#fix user add in docker
user="django"
if cut -d: -f1 /etc/passwd | grep -w "$user"; then
    echo "user $user found"
else
    groupadd -r -g 777 $user && useradd $user -u 777 -g $user
fi
