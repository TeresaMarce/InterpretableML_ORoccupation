# Predicting real operating room occupation, an interpretable ML approach

## Thesis to obtain the Master of Science Degree in Biomedical Engineering

**October 2021**

**Teresa Marcelino**, teresamarcelino@tecnico.ulisboa.pt / teresamarcelino98@gmail.com

## Thesis Abstract:

Nowadays, the potential of using Machine Learning (ML) techniques to solve real-world problems is extensively explored, and many are the application domains such as cybersecurity, aviation and healthcare, where there is in-depth research into their applicability. With the amount of data currently gathered in the hospital environment, models capable of learning and improving automatically through the use of data might solve problems that endanger the proper functioning of hospitals. The Operating Room (OR) is a high-cost environment, and its usage must be efficient. Therefore, our presented solution focuses on developing interpretable prediction ML models for an operating theater decision support system to improve the prediction of surgical times, comparing them with traditional methods to aid the OR scheduling process. We implemented three different ML models, Extreme Gradient Boosting (XGBoost), RuleFit and a deep neural network, and we compared and analyzed their performance, including both accuracy and interpretability. For each of these algorithms, we implemented three different strategies. Then, since surgical durations showed a significant imbalance and this is known to hinder the performance of accuracy-based ML algorithms, we trained a Gaussian Mixture Model (GMM) to learn the probability distribution on the minority values of our label enabling sampling to overcome the imbalance. The performance of the models on balanced and imbalanced datasets was compared using the Utility-Based Algorithm (UBA). This research work is an evidence that the proper implementation of interpretable ML technologies can significantly improve current standards of estimation, representing a cost reduction from an operation’s perspective, maintaining the decision-makers’ confidence in the system.

## Repository content:

This repository contains all the code developed to produce the results presented in *Thesis.pdf*.

A detailed explanation concerning the code organization can be found in *Apendix B*.

## Notes:

- The files have been organized in folders. The code was developed in Python and R
- The data is not provided, as it is under the data protection and privacy policy.
- To rerun the notebooks or any other file the path must be adapted.
 
