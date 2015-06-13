#### HiveServer2 Log summarizer 

##### Usage

```
#download latest script
wget https://raw.githubusercontent.com/abajwa-hw/hiveServer2logparser/master/hiveServer2logparser.pl

#run script
perl hiveServer2logparser.pl <path to dir containing hiveserver2.log* files>
```

##### Output

- [Tab-delimited text file](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/output.xls) with summary of queries that were run for easy filtering in Excel
![Image](../master/screenshots/output.png?raw=true)

- [Sql file of all failed queries](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/failedqueries.sql)

- [Sql file of all passed queries](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/passedqueries.sql)