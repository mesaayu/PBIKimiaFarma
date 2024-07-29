# PBIKimiaFarma

This project discusses the evaluation of Kimia Farma business performance from 2020 to 2023. The data used 
consists of 4 datasets which include transaction, inventory, branch and product information. The process begins 
with:
 ● Data Exploration; Deep understanding of data structure and characteristics
 ● Data Transformation; Data modification, such as merging, cleaning,  according to analysis needs
 ● Creating a Data Mart;  Analysis table based on aggregation results from the 4 datasets/tables
 ● Data Visualization; Display informative graphs or dashboards based on Data Mart to gain insight

Step:
1. Importing Dataset to BigQuery:  The first step, import all datasets into BigQuery. Import is carried out by uploading data from local storage
2. BigQuery Syntax:  Second step, aggregate the 4 tables with the columns needed to create a data mart table with Left Join syntax.
3. Tabel Analisa:  the results of querying the analysis table or what can be called Data Mart
4. Dashboard  Performance Analytics: The final step, analysis dashboard based on the data mart table that was created previously
