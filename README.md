### Searching for Fraud
We can find potential fraud in multiple ways. The most obvious first option would be to find card
holders with a excess number of $2 transactions. To define "too many" small transactions, we should establish a baseline number of expected small transactions, then find outliers.

![C:\Users\Laramie\Desktop\SQLasgn\SQLrepo\resources\numsmalltrnscbych.png]


### Exploring Deeper
The above distribution doesn't appear to give any clear indication. Some people have very few, some have a lot, but generally speaking there aren't any enormous outliers. We can double check this by looking at the descriptive stats


We can see there are 0 users who have two standard deviations outside of the mean. Furthermore,
if you change the 'mask' variable to find users above and below the mean, they are pretty evenly distributed, which we saw at a glance from the bar chart. 

But maybe if we add the time element to this data, we could find something more interesting.
Because our database houses the datetime all together, we can split out date and time inside our notebook. We could change it at the database level by dropping the table and re-creating the schema for that table and re-seeding the data after we reformat it, however that could create huge problems. If our data pipeline from merchants includes different datetime formats that are fed to an interpretter somewhere else, and we decide to change the table format, all of a sudden there could be a huge problem. Also, timezone here is not explicit, so there could be edge cases where two transactions at the same hour occur on different dates depending on timezone. 

For that reason, I chose to look at time and date locally inside our notebook. 


### Potential Fraud
From what we see, there COULD be a subset of small transactions of $0.80 or less. It could be worth automating a service that texts a customer and checks if they made the transaction, then if they reply yes we can ask if they would like us to check with them again in the future. There are very few things a person regularly buys on credit cards that costs that litte. At least one would think. Data seems to corroborate that as well.



### Analysis
When comparing the 7-9 hour to the rest of the day inclusively, it seems like the card holders who have made large purchases in that range are larger spenders compared to the general cohort of card users. One thing we could do is find an average purchase amount for each card user and flag anything to far away from the norm for them. 

### Merchants with the largest number of small transactions
Wood-Ramirez, 	
Baker Inc, 	
Hood-Phillips, 	
Sweeney-Paul, 	
Walker, Deleon and Wolf	