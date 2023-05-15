# Example
from sklearn.datasets import make_classification
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split

# Create datasets and separate X,Y
X, Y = make_classification(
    n_samples=200, n_classes=2, n_features=10, n_redundant=0, random_state=1
)

# Split train-test
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.2)

# Create classifier
rf = RandomForestClassifier(max_features=5, n_estimators=100)

# Train classifier
print(f"Training classifer (random forest)...\n")
rf.fit(X_train, y_train)

# Predict classifier
print(f"Prediction values on test dataset:\n{rf.predict(X_test)}\n")

# Score classifier
print(f"Score of prediction values on test dataset:\n{rf.score(X_test, y_test)}\n")
