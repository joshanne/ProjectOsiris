function livehosts {
    nmap $1 -n -sP | grep report | awk '{print $5}'
}
