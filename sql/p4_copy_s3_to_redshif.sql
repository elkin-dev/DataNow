copy users from 's3://datanow-bucked-redshift/tickitdb/allusers_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' region 'us-east-2';

copy venue from 's3://datanow-bucked-redshift/tickitdb/venue_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' region 'us-east-2';

copy category from 's3://datanow-bucked-redshift/tickitdb/category_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' region 'us-east-2';

copy date from 's3://datanow-bucked-redshift/tickitdb/date2008_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' region 'us-east-2';

copy event from 's3://datanow-bucked-redshift/tickitdb/allevents_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' timeformat 'YYYY-MM-DD HH:MI:SS' region 'us-east-2';

copy listing from 's3://datanow-bucked-redshift/tickitdb/listings_pipe.txt' 
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow' 
delimiter '|' region 'us-east-2';

copy sales from 's3://datanow-bucked-redshift/tickitdb/sales_tab.txt'
credentials 'aws_iam_role=arn:aws:iam::471112522534:role/RolRedshiftDataNow'
delimiter '\t' timeformat 'MM/DD/YYYY HH:MI:SS' region 'us-east-2';