#### HiveServer2 Log summarizer 

##### Usage

```
perl hiveServer2logparser.pl <path to dir containing hiveserver2.log* >
```

##### Output

- [Tab-delimited text file](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/output.xls) with summary of queries that were run for easy filtering in Excel
![Image](../master/screenshots/output.png?raw=true)

- [Sql file of all failed queries](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/failedqueries.sql)

- [Sql file of all passed queries](https://github.com/abajwa-hw/hiveServer2logparser/blob/master/passedqueries.sql)