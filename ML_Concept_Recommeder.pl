:-dynamic known/2.

start:-introduction, recommend.

introduction:-write('Welcome! To get started, state your requirements 
and we will give you a concept to start with!'),nl,nl,
write('Happy Machine Learning!'),retractall(known(_,_)).

/*------------------------------------------------------------------------------------------------*/

type(evaluation_metrics_for_regression):- inquire(evaluation_metrics),
inquire(evaluation_metrics_for_regression).

type(evaluation_metrics_for_classification):-inquire(evaluation_metrics),
inquire(evaluation_metrics_for_classification).

type(classification):-inquire(models),inquire(supervised),inquire(classification).

type(regression):-inquire(models),inquire(supervised),inquire(regression).

type(time_series):-inquire(models),inquire(supervised),inquire(time_series).

type(clustering):-inquire(models),inquire(unsupervised),inquire(clustering).

type(association_rule_mining):-inquire(models),inquire(unsupervised),inquire(association_rule_mining).

/*------------------------------------------------------------------------------------------------*/

options(evaluation_metrics_for_regression):-write('RMSE'),nl,write('MAE'),nl,
write('MSE'),nl,write('RMSLE'),nl,write('R-squared'),nl,write('Adjusted R-squared').

options(evaluation_metrics_for_classification):-write('Confusion matrix'),nl,
write('Precision'),nl,write('Recall'),nl,write('Specificity'),
nl,write('F1-score'),nl,write('Fbeta-score'),nl,write('ROC-Curve').

options(classification):-write('Naive Bayes'),nl,write('K-Nearest Neighbours'),nl,
write('Decision Trees'),nl,write('Random Forest'),nl,write('Logistic Regression'),nl,
write('Support Vector Machine'),nl,write('Artificial Neural Network'),nl.

options(regression):-write('Linear Regression'),nl,write('Polynimial Regression'),nl,
write('Ridge Regression'),nl,write('Lasso Regression'),nl,write('Quantile Regression'),nl,
write('Bayesian Linear Regression'),nl.

options(clustering):-write('Centroid-based Clustering Algorithm'),nl,
write('K-means Clustering Algorithm'),nl,
write('DBSCAN Clustering'),
nl,write('Gaussian Mixture Clustering Model'),nl,write('BIRCH Algorithm'),nl,
write('Affinity Propagation Clustering'),nl,write('Mean-Shift Clustering Algorithm'),
nl,write('OPTICS Clustering Algorithm'),
nl,write('Agglomerative Hierarchy Clustering Algorithm'),
nl,write('Spectral Clustering'),nl,write('Mini-Batch K-means'),
nl,write('Divisive Hierarchical').

options(association_rule_mining):-write('Apriori algorithm'),nl,write('Eclat algorithm'),nl,
write('FP-growth algorithm').

options(time_series):-write('Autoregressive (AR) Model'),nl,
write('Autoregressive Integrated Moving Average (ARIMA) Model'),nl,
write('Seasonal Autoregressive Integrated Moving Average (SARIMA) Model'),nl,
write('Exponential Smoothing (ES)'),nl,
write('Facebook-Prophet'),nl,write('LSTM (Deep Learning) Model'),nl,
write('DeepAR-Amazon'),nl,write('N-BEATS-Deep Learning algorithm'),nl,
write('Temporal Fusion Transformer (Google)').

/*------------------------------------------------------------------------------------------------*/

inquire(Tag):-ask(Tag).
ask(Tag):-known(Tag, y),!.
ask(Tag):-known(Tag, n),!, fail.
ask(Tag):-nl,write( Tag) , write('?(y/n)'), read(Ans),
asserta(known(Tag,Ans)),Ans==y.

/*------------------------------------------------------------------------------------------------*/

link(Type):-inquire("Do you want the links too"),known("Do you want the links too",y), showlinks(Type).

showlinks(evaluation_metrics_for_regression):-nl,nl,
write('https://www.analyticsvidhya.com/blog/2021/05/know-the-best-evaluation-metrics-for-your-regression-model/').

showlinks(evaluation_metrics_for_classification):-nl,nl,
write('https://www.analyticsvidhya.com/blog/2021/07/metrics-to-evaluate-your-classification-model-to-take-the-right-decisions/').

showlinks(classification):-nl,nl,
write('https://analyticsindiamag.com/7-types-classification-algorithms/').

showlinks(regression):-nl,nl,
write('https://www.jigsawacademy.com/popular-regression-algorithms-ml/').

showlinks(clustering):-nl,nl,
write('https://www.freecodecamp.org/news/8-clustering-algorithms-in-machine-learning-that-all-data-scientists-should-know/').

showlinks(association_rule_mining):-nl,nl,
write('https://en.wikipedia.org/wiki/Association_rule_learning').

showlinks(time_series):-nl,nl,
write('https://www.advancinganalytics.co.uk/blog/2021/06/22/10-incredibly-useful-time-series-forecasting-algorithms').


/*------------------------------------------------------------------------------------------------*/

recommend:-nl,nl,type(Type),nl,nl,write('You can start with these concepts - '),nl,nl,options(Type),nl,nl,!,link(Type),!,nl.

recommend:-nl, write('This is all we have for now!').

/*------------------------------------------------------------------------------------------------*/