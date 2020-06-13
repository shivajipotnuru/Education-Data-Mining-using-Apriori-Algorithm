# Education-Data-Mining-using-Apriori-Algorithm

## OBJECTIVES:
The main goal of the project is to find easy and appropriate methods to find the subjects in which the students are failing so that we can improve the ways of teaching and concentrate more on that particular subject. A parallelized algorithm will be very efficient and hence parallelizing the algorithm is the main objective


## Why Apriori ?
Apriori is an algorithm for frequent item set mining and association rule learning over relational databases. It proceeds by identifying the frequent individual items in the database and extending them to larger and larger item sets as long as those item sets appear sufficiently often in the database.

## Dataset
Datset was taken from kaggle, Data coontains of marks of students Semester wise.


## Serial Pseudocode
Pass 1<br>
1. First we read the data in csv<br>
2. Pre-processing by removing unnecessary information and saving important
tasks<br>
3. Creating Relations by combining important row values together <br>
4. Creating Transactions with the data<br>
5. Providing the algorithm with a threshold value <br>
6. Check if the set has more number of transactions than threshold then agree
to proceed to next number.<br>
7. Continue till you get a rule with most number of related records


##  Parallel pseudocode 
Pass 1<br>
1. Generate items in C1<br>
2. Save the frequently of elements in Lk1 <br>
3. Generate candidate items in C1 from all the frequency from Lk1
   Combine Lk1 p with Lk1 q, as instructed Join with C1 select p.item1, p.item2, . . . , p.item, q.item from Lk1 p, Lk1q where p.item1 =    q.item1, . . . p.itemk2 = q.itemk2, p.itemk1 < q.itemk1
2. Generate all (k1) subsets from the candidate itemsets inCk<br>
3. Chose all candidate itemsets from Ck where some items of K1<br>
subset of the candidate itemset is not in the frequent itemset Lk1<br>
4. Distribute among all the cores. Scan the transcation and use apriopri algorithm
using parallel methods.. Save the frequent itemsets in Lks
 
 
 ## Results
The process of looking for relations between records is considered the most hectic task
in the whole data mining process. The task of processing using Apriori algorithm is indeed a
hard and heavy computation task . In this project,propose a fast parallel Apriori algorithm
based on MapReduce, We use size up, speedup and scaleup to evaluate the performances of
Apriori. The time difference between parallel and serial explains how efficient the parallel
algorithm is. Serial and Parallel won’t be any different if there data sets are small so we need
more number of records to parallelize. The algorithm also consists of incrementation of speeds
in input and writing of CSV files which also increases the algorithm’s speed.
