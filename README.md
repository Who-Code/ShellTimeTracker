# ShellTimeTracker
A simple shell script for time tracking with linux systems

## Getting Started

You just need to make the TimeTracker.sh file executable and then you need to start it as sudo or root.

### How it works

This bash script uses the ping functionality to check if a block of specified ips is connected in the network.

All functions together are:
```
- ping all ips from the ip array
- store the activity inside csv files
- a single csv for all ip addresses and users
- one csv file for every user to get single reports
```

### Installing

Just follow the steps below to get this script work on your linux machine or server.

1st - create a folder, then copy the TimeTracker.sh into this folder and open a terminal inside this folder.

2nd - make the TimeTracker.sh file executable:

```
sudo chmod +x TimeTracker.sh
```

3th - execute the TimeTracker.sh using following command

```
sudo ./TimeTracker.sh
```

## What will happen after executing the script

This bash script pings the given Ip addresses and shows you in the terminal window wether the specified persons are in office or not.
Furthermor it creates some Files for the reports.
With the examplecode you will get the following files:

```
- current.csv or aktuell.csv -> this is the file that you will see in your terminal
- testpersonX.csv or TestpersonX.csv -> The X stands for a number and this file is the report corresponding to a single IP
- timetracking.csv or zeiterfassung.csv -> This contains all activity about entering and leaving the network of the given IP's
```

## Additional informations
There are two .sh files in this repository. The TimeTracker.sh file is the english version and Zeiterfassung.sh is the german.
Only differance are the languages.

## Authors

* **Robert Keller** - *Initial work* - [ProgrammersLog](http://programmers-log.net)

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE.md](LICENSE.md) file for details
